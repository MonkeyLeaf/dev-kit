#!/bin/bash

#environment=$1
#
#case "$environment" in
#    js)
#      docker-compose -f docker-compose-js.yml build
#      ;;
#
#    *)
      docker-compose -f docker-compose.yml build
#esac