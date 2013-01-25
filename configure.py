"""
Configures this MapBox project to work with your local PostGIS server.
"""
#
# You need to fill out this part to match your local postgres connection!
#

# PostGIS connection setup
dbname   = "osm_california"
host     = "localhost"
port     = "5432"
user     = "postgres"
password = "postgres"


# For postgres layers mapnik by default will query postgis for the
# extent to know whether to process the layer during rendering
# Increase performance if you are only rendering a particular area by
# specifying a bounding box in the format of "XMIN,YMIN,XMAX,YMAX" in the
# same units as the database (probably spherical mercator meters). The
# whole world is "-20037508.34,-20037508.34,20037508.34,20037508.34".
extent = "-13849828.38,3833234.22,-12705175.77,5162381.7"

# osm2pgsql table prefix - only change this is you explicitly imported
# with a custom prefix (--prefix)
prefix = 'planet_osm'

# if you have > 2GB mem, turn this on for slightly faster rendering
feat_caching = True

#
# Don't touch this part down here, just run it.
#

import os
import json
from sys import path
from os.path import join

this_dir = os.path.dirname(__file__)
source_mml = os.path.join(this_dir, 'quiet-la/project.mml.template')
target_mml = os.path.join(this_dir, 'quiet-la/project.mml')

with open(source_mml, 'r') as f:
  newf = json.loads(f.read())
f.closed

with open(target_mml, 'w') as f:
  for layer in newf["Layer"]:
    layer["properties"] = {}
    if feat_caching:
        layer["properties"]["cache-features"] = "true"
    ds_type = layer["Datasource"].get("type")
    if ds_type and ds_type == "postgis":
        layer["Datasource"]["host"] = host
        layer["Datasource"]["port"] = port
        layer["Datasource"]["dbname"] = dbname
        layer["Datasource"]["user"] = user
        layer["Datasource"]["password"] = password
        layer["Datasource"]["extent"] = extent
        layer["Datasource"]["srid"] = 900913
        if prefix != 'planet_osm':
            layer["Datasource"]["table"] = layer["Datasource"]["table"].replace('planet_osm',prefix)
  f.write(json.dumps(newf, sort_keys=True, indent=2))
f.closed