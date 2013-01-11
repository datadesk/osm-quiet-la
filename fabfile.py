from __future__ import with_statement
import os
import json
import urllib
from fabric.api import *
from fabric.colors import green, yellow


def get_version():
    """
    Returns the current version of the MapBox project.
    """
    f = open('./quiet-la/project.mml','r')
    return json.load(f)['version']


env.tilemill = '$TILEMILL/index.js'
env.version = get_version()
env.release_name = 'quiet-la-%s' % env.version
env.tile_buckets = (
    'tiles1.latimes.com',
    'tiles2.latimes.com',
    'tiles3.latimes.com',
    'tiles4.latimes.com',
)


def rollout():
    update_osm()
    build_tiles()
    build_samples()
    deploy_tiles()


def update_osm(state='california', postgres_user='postgres', host='localhost'):
    """
    Download and install the latest snapshot of the OpenStreetMap database.
    """
#    print('Updating OpenStreetMap slice for the state of %s' % state.title())
#    # Figure out what file we want
#    bz2 = '%s.osm.bz2' % state
#    # Delete it from the local folder if it already exists
#    if os.path.exists('./%s' % bz2):
#        print('- Deleting existing OpenStreetMap bz2 from this directory')
#        os.remove('./%s' % bz2)
#    # Download a new file from our data source
#    url ='http://download.geofabrik.de/openstreetmap/north-america/us/%s'
#    print('- Downloading new OpenStreetMap slice from geofabrik.de')
#    urllib.urlretrieve(url % bz2, './%s' % bz2)
#    print('- Download successful')
#    # Unzip file
#    print ('- Unzipping OpenStreetMap bz2')
#    local('bunzip2 ./%s' % bz2)
#    print ('- Unzip successful')
    # Drop the database if it already exists
    db = 'osm_%s' % state
    try:
        local("sudo -u %s dropdb %s" % (postgres_user, db))
    except:
        print('- Dropped existing database %s' % db)
    # Create a new database
    print('- Creating new database %s' % db)
    local('sudo -u %s createdb -U %s -T template_postgis %s' % (
        postgres_user,
        postgres_user,
        db
    ))
    # Load the database with osm2pgsql
    print('- Loading OpenStreetMap data')
    osm = '%s.osm' % state
    local('osm2pgsql -U %s -H %s -d %s -S /usr/share/osm2pgsql/default.style %s' % (postgres_user, host, db, osm))
    # Remove OSM file
    print('Removing %s' % osm)
    local('rm %s' % osm)
    print(green('Success!'))


def build_tiles():
    """
    Create a set of tiles and zip it up so it can be deploy.
    """
    print('Building map tiles')
    # Have TileMill build the current project as an mbtiles file
    local('%(tilemill)s export quiet-la ./%(release_name)s.mbtiles --format=mbtiles' % env)
    # Crack open the mbtiles file as a directory
    print('- Opening mbtiles file')
    local('mb-util ./%(release_name)s.mbtiles %(release_name)s' % env)
    print('- Deleting mbtiles file')
    local('rm -rf ./%(release_name)s.mbtiles' % env)
    # Zip up the directory for deployment
    #print('- Zipping up file directory')
    #local('tar -zcvf %(release_name)s.tar.gz ./%(release_name)s/' % env)
    print('- Deleting file directory')
    #local('rm -rf ./%(release_name)s' % env)
    print('- Deleting export log')
    #local('rm *export*')
    print(green('Success!'))


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
    local("%(tilemill)s export quiet-la samples/%(version)s/socal.png --format=png --bbox=-118.921,34.696,-117.421,33.564 --minzoom=9 --maxzoom=9 --width=1024" % env)
    local("%(tilemill)s export quiet-la samples/%(version)s/sfvalley.png --format=png --bbox=-118.685,34.106,-118.259,34.308 --minzoom=12 --maxzoom=12 --width=1024" % env)
    local("%(tilemill)s export quiet-la samples/%(version)s/dtla.png --format=png --bbox=-118.280,34.0233,-118.216,34.064 --minzoom=14 --maxzoom=14 --width=1024" % env)


def deploy_tiles():
    """
    Upload a release folder to Amazon S3 buckets
    """
    print('Deploying tiles to Amazon S3')
    for bucket in env.tile_buckets:
        print('- Uploading files to %s' % bucket)
        local("ivs3 -P %s %s/%s" % (
            env.release_name,
            bucket,
            env.release_name,
            )
        )
    print('- Deleting file directory')
    local('rm -rf ./%(release_name)s' % env)
    print(green('Success!'))

