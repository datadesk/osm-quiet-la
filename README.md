<pre><code> ______     __  __     __     ______     ______      __         ______    
/\  __ \   /\ \/\ \   /\ \   /\  ___\   /\__  _\    /\ \       /\  __ \   
\ \ \/\_\  \ \ \_\ \  \ \ \  \ \  __\   \/_/\ \/    \ \ \____  \ \  __ \  
 \ \___\_\  \ \_____\  \ \_\  \ \_____\    \ \_\     \ \_____\  \ \_\ \_\ 
  \/___/_/   \/_____/   \/_/   \/_____/     \/_/      \/_____/   \/_/\/_/ 
                                                                          </code></pre>

A template for a muted base layer about Southern California. Designed for overlaying loud data visualizations. Created with open data. Configured for [TileMill](http://mapbox.com/tilemill/) and [Mapnik](http://mapnik.org). Ready to deploy to Amazon S3 using [Fabric](https://github.com/fabric/fabric), [invar](https://github.com/onyxfish/invar) and [boto](https://github.com/boto/boto). 

Read more about it in [this introductory post](http://datadesk.latimes.com/posts/2012/11/introducing-quiet-la/). Try the map on [this demonstration page](http://datadesk.github.io/osm-quiet-la/).

![DTLA](https://raw.github.com/datadesk/osm-quiet-la/master/samples/0.3.0/dtla.png)

## Layers

* Roads, water, landuse and buildings by [OpenStreetMap](http://www.openstreetmap.org/) using a state extract published by [Geofabrik](http://www.geofabrik.de)
* Places by the U.S. Census via [census.ire.org](census.ire.org)
* Neighborhoods and regions by The Times' [Mapping LA project](http://mapping.la)

## Installation

The first thing to do is install [TileMill](http://mapbox.com/tilemill/), the open-source map design studio by [MapBox](http://www.mapbox.com). 

Some of the tricks in this repo require you to install TileMill using its source code rather than MapBox's prepackaged releases. Instructions on how to do that can be found [here.](http://mapbox.com/tilemill/docs/source/#source_install_on_ubuntu_linux)

Next clone this repository, or a fork of it, to your computer. I recommend doing this inside of a [virtualenv](http://www.virtualenv.org/en/latest/index.html).

```bash
# Create the virtualenv
$ virtualenv osm-quiet-la
# Jump into it
$ cd osm-quiet-la
# Turn it on
$ . bin/activate
# Pull down this repository into a subdirectory
$ git clone https://github.com/datadesk/osm-quiet-la.git repo
```

Create a symbolic link installing Quite LA inside Mapbox's project directory. You'll need to substitute your path below. 

```bash
$ ln -s /path/to/this/repo/quiet-la /path/to/Documents/MapBox/project/
```

Install [PostgreSQL](http://www.postgresql.org/) with the [PostGIS](http://postgis.refractions.net/) extensions that allow the database to do geometry. If you haven't done this before, I would recommend follow the instructions included with [GeoDjango](https://docs.djangoproject.com/en/dev/ref/contrib/gis/install/#ubuntu-debian-gnu-linux). Just focus on the PostGIS part and you will be in good hands.

Next you need to download OpenStreetMap data covering the area you're going to map. I'm sticking with California, but you could use this system to map any of the 50 states that make up America.

I've condensed all the steps into [a Fabric function](https://github.com/datadesk/osm-quiet-la/blob/master/fabfile.py#L35) in this repository's fabfile. Besides Fabric, it requires the OpenStreetMap utility for loading data into PostgresSQL. On Ubuntu, you can install them like so.

```bash
$ sudo apt-get install fabric
$ sudo apt-get install osm2pgsql
```

Once that's out of the way, it might be this easy.

```bash
$ fab update_osm
# Or if you want another state
$ fab update_osm:state=iowa
```

Though if you're not on Ubuntu you might have to tweak each step a little. Crack open the fabfile and you'll figure it out pretty quick. It's a few basic steps.

```bash
# Download and unzip the OSM extract for your state. I use Geofabrik as a source because they update frequently.
$ curl -O http://download.geofabrik.de/openstreetmap/north-america/us/california.osm.bz2
$ bunzip2 ./california.osm.bz2
# Create a new PostgreSQL database to store the data. Substitute your postgres user and state.
$ sudo -u postgres createdb -U postgres -T template_postgis osm_california
# Use osm2pgsql to load the OpenStreetMap data into the database.
# The location of the default.style file can be different depending on the platform.
# This is where it shows up in the latest Ubuntu distro, but you might need to dig up its path on your system.
$ osm2pgsql -U postgres -d osm_california -S /usr/share/osm2pgsql/default.style california.osm
# Delete that osm file now that you don't need it anymore.
$ rm california.osm
```

Finally, you have to configure the Tilemill configuration file to work with your PostgreSQL database. You can do this by filling out the options at the top of ``configure.py`` in this directory and then running it.

```bash
$ python configure.py
```

![San Fernando Valley](https://raw.github.com/datadesk/osm-quiet-la/master/samples/0.3.0/sfvalley.png)

## Deployment

There are additional steps you need to take before you are able to deploy tiles created with this template to Amazon S3 for public use. 

First, set an environment variable that leads to the directory where you installed TileMill.

```bash
# Consider adding this to your .bashrc or .bash_profile but can also just run it from the shell
$ export TILEMILL=/path/to/repo/for/tilemill
```

Use our fabric function to create a new set of tiles using TileMill.

```bash
$ fab build_tiles
```

Log into your Amazon account at [aws.amazon.com](http://aws.amazon.com) and create one or more S3 buckets to hold your tiles.

Edit the `tile_bucket` environment variable in `fabfile.py` to point to your bucket name.

```python
env.tile_bucket = 'yourbucket'
```

Install the Python dependencies necessary to interact with S3.

```bash
# Jump into your virtualenv and turn it on
$ . bin/activate
# Install the Python requirements with pip
$ pip install -r repo/requirements.txt
```

Store your Amazon access key and secret key in the config file for [boto](https://github.com/boto/boto), the Python library for accessing S3.

```bash
# That is found right here
$ vim ~/.boto
```

You'll need to provide them as boto expects.

```bash
[Credentials]
aws_access_key_id = your_key
aws_secret_access_key = your_secret_key
```

Now all that's left is to upload the files in bulk using [invar](https://github.com/onyxfish/invar)'s handy S3 uploader.

```bash
$ fab deploy_tiles
```

![Southern California](https://raw.github.com/datadesk/osm-quiet-la/master/samples/0.3.0/socal.png)

## Credits

This application was created by Ben Welsh and Ken Schwencke at the [Los Angeles Times Data Desk](datadesk.latimes.com). The cosmetic design was inspired by [this 2008 map](http://projects.latimes.com/elections/orange-county-prop-8-results-by-city/) by Thomas Suh Lauder. The technical design borrows heavily from MapBox's [osm-bright](https://github.com/mapbox/osm-bright).
