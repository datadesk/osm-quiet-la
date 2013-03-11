from __future__ import with_statement
import os
import json
import urllib
from fabric.api import *


def get_version():
    """
    Returns the current version of the MapBox project.
    """
    f = open('./%s/project.mml' % env.name,'r')
    return json.load(f)['version']


env.tilemill = 'nodejs $TILEMILL/index.js'
env.name = 'quiet-la'
env.version = get_version()
env.release_name = '%s-%s' % (env.name, env.version)
env.tile_bucket = 'tiles.latimes.com'


def rollout():
    update_osm()
    build_tiles()
    build_samples()
    deploy_tiles()


def download_osm(state='california'):
    """
    Download a state slice of OpenStreetMap data from GeoFabrik's 
    daily snapshots.

    Returns a path to the a bz2 file containing the data.

    Keyword argument:

        state: The name of the state slice you want to install. 
            Default: 'california'
    
    """
    print('Updating OpenStreetMap slice for the state of %s' % state.title())
    # Figure out what file we want
    bz2 = '%s-latest.osm.bz2' % state
    # Delete it from the local folder if it already exists
    if os.path.exists('./%s' % bz2):
        print('- Deleting existing OpenStreetMap bz2 from this directory')
        os.remove('./%s' % bz2)
    # Download a new file from our data source
    url = 'http://download.geofabrik.de/north-america/us/%s'
    print('- Downloading new OpenStreetMap slice from geofabrik.de')
    urllib.urlretrieve(url % bz2, './%s' % bz2)
    print('- Download successful')
    return bz2


def load_osm(bz2,  postgres_user='postgres', postgres_host='localhost'):
    """
    Loads a bz2 slice of OSM data into the database.

    Keyword arguments:
    
        - postgres_user: The name of the postgres user who can access you 
            database. Default: 'postgres'
        - postgres_host: The postgres hostname or socket location to use 
            with osm2psql. Default: 'localhost'

    """
    # Unzip file
    print ('- Unzipping OpenStreetMap bz2')
    local('bunzip2 ./%s' % bz2)
    print ('- Unzip successful')
    # Drop the database if it already exists
    state = bz2.replace("-latest.osm.bz2", "")
    db = 'osm_%s' % state
    try:
        local("sudo -u %s dropdb %s" % (postgres_user, db))
        print('- Dropped existing database %s' % db)
    except:
        pass
    # Create a new database
    print('- Creating new database %s' % db)
    local('sudo -u %s createdb -U %s -T template_postgis %s' % (
        postgres_user,
        postgres_user,
        db
    ))
    # Load the database with osm2pgsql
    print('- Loading OpenStreetMap data')
    osm = '%s-latest.osm' % state
    local('osm2pgsql -U %s -H %s -d %s %s' % (postgres_user, postgres_host, db, osm))
    # Remove OSM file
    print('Removing %s' % osm)
    local('rm %s' % osm)


def update_osm(state='california', postgres_user='postgres', postgres_host='localhost'):
    """
    Download and install the latest snapshot of the OpenStreetMap database.
    
    What it does:
    
        - Download a state slice of OpenStreetMap data from GeoFabrik's 
            daily snapshots
        - Drop your existing postgre database for that state slice
        - Load the latest slice in using osm2psql
    
    Keyword arguments:
    
        - state: The name of the state slice you want to install. 
            Default: 'california'
        - postgres_user: The name of the postgres user who can access you 
            database. Default: 'postgres'
        - postgres_host: The postgres hostname or socket location to use 
            with osm2psql. Default: 'localhost'
    
    Example usage:
    
        $ fab update_osm:state=iowa
    
    """
    bz2 = download_osm(state)
    load_osm(bz2, postgres_user=postgres_user, postgres_host=postgres_host)


def build_tiles():
    """
    Create a set of tiles and zip it up so it can be deploy.
    """
    print('Building map tiles')
    # Have TileMill build the current project as an mbtiles file
    local('%(tilemill)s export %(name)s ./%(release_name)s.mbtiles --format=mbtiles' % env)
    # Crack open the mbtiles file as a directory
    print('- Opening mbtiles file')
    local('mb-util ./%(release_name)s.mbtiles %(release_name)s' % env)
    print('- Deleting mbtiles file')
    local('rm -rf ./%(release_name)s.mbtiles' % env)
    print('- Deleting export log')
    local('rm *export*')


def build_samples():
    """
    Create a set of predefined sample tiles
    """
    # Set the directory for our samples
    samples_dir = os.path.join('./samples', env.version)
    # Make the directory if it doesn't already exist
    os.path.exists(samples_dir) or os.mkdir(samples_dir)
    # Delete any existing files in the directory
    file_paths = [os.path.join(samples_dir, n)
        for n in ['socal.png', 'sfvalley.png', 'dtla.png']]
    [os.remove(i) for i in file_paths if os.path.exists(i)]
    # Create the new samples
    local("%(tilemill)s export %(name)s samples/%(version)s/socal.png --format=png --bbox=-118.921,34.696,-117.421,33.564 --minzoom=9 --maxzoom=9 --width=1024" % env)
    local("%(tilemill)s export %(name)s samples/%(version)s/sfvalley.png --format=png --bbox=-118.685,34.106,-118.259,34.308 --minzoom=12 --maxzoom=12 --width=1024" % env)
    local("%(tilemill)s export %(name)s samples/%(version)s/dtla.png --format=png --bbox=-118.280,34.0233,-118.216,34.064 --minzoom=14 --maxzoom=14 --width=1024" % env)


def deploy_tiles():
    """
    Upload a release folder to the live Amazon S3 bucket.
    """
    print('Deploying tiles to Amazon S3')
    print('- Uploading files to %s' % bucket)
    local("ivs3 -P %s %s/%s" % (
        env.release_name,
        env.tile_bucket,
        env.release_name,
        )
    )
    print('- Deleting file directory')
    local('rm -rf ./%(release_name)s' % env)
