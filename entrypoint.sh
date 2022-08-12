#!/bin/bash

# # ZMICRO_NVM
# export NODE_HOME=/usr/local/node
# export NODE_USER_HOME=$HOME/.node
# export PATH=$NODE_HOME/bin:$NODE_USER_HOME/bin:$PATH

# http-server \
#   -p ${PORT:-8080} \
#   -d /data/plugins/eunomia/export

PLUGIN_EUNOMIA_DOCKERFILES_DIR=/usr/local/lib/zmicro/plugins/eunomia/config/dockerfiles

if [ ! -d "$PLUGIN_EUNOMIA_DOCKERFILES_DIR" ]; then
  echo "ERROR: dockerfiles not found (path: $PLUGIN_EUNOMIA_DOCKERFILES_DIR)"
  exit 1
fi

if [ -z "$(ls $PLUGIN_EUNOMIA_DOCKERFILES_DIR)" ]; then
  echo "ERROR: dockerfiles is empty (path: $PLUGIN_EUNOMIA_DOCKERFILES_DIR)"
  exit 1
fi

serve \
  -p ${PORT:-8080} \
  -d ${DIR:-"/data/plugins/eunomia/export"} \
  --prefix ${PREFIX:-"/"}
