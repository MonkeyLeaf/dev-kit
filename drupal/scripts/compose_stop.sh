#!/bin/bash

#environment=$1
#
#case "$environment" in
#    js)
#      docker-compose -f docker-compose-js.yml down
#      ;;
#
#    *)
      docker-compose -f docker-compose.yml down
#esac