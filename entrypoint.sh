#!/bin/bash

# ZMICRO_NVM
export NODE_HOME=/usr/local/node
export NODE_USER_HOME=$HOME/.node
export PATH=$NODE_HOME/bin:$NODE_USER_HOME/bin:$PATH

http-server \
  -p ${PORT:-8080} \
  -d /data/plugins/eunomia/export
