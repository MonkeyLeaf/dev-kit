#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose up`
# USAGE:
# $ script/compose_start.sh [environment]
# EG:
# $ script/compose_start.sh
environment=$1

case "$environment" in
    local)
        docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d
        ;;

    *)
        docker-compose -f docker-compose.yml up -d
esac