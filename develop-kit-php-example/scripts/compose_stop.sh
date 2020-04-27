#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose down`
# USAGE:
# $ script/compose_stop.sh [environment]
# EG:
# $ script/compose_stop.sh
environment=$1

case "$environment" in
    local)
        docker-compose -f docker-compose.yml -f docker-compose.local.yml down
        ;;

    *)
        docker-compose -f docker-compose.yml down
esac