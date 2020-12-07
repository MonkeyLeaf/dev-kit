#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose up`
# USAGE:
# $ script/compose_start.sh [environment]
# EG:
# $ script/compose_start.sh
# $ script/compose_start.sh dev

environment=$1

case "$environment" in
    mongo)
        docker-compose -f docker-compose.mongo.yml up -d
        ;;

    mysql)
        docker-compose -f docker-compose.mysql.yml up -d
        ;;

    pgsql)
        docker-compose -f docker-compose.pgsql.yml up -d
        ;;

    *)
        docker-compose -f docker-compose.yml up -d
esac
