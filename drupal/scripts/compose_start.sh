#!/bin/bash

#environment=$1

#case "$environment" in
#    js)
#      docker-compose -f docker-compose-js.yml up -d
#      ;;

#    *)
      docker-compose -f docker-compose.yml up -d
#esac