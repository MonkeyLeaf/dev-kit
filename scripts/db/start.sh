#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose up -d`
# USAGE:
# $ script/db/start.sh [environment]
# EG:
# $ script/db/start.sh
# $ script/db/start.sh mysql

environment=$1

cd ./develop-kit-databases

case "$environment" in
    mysql)
        docker-compose -f docker-compose.mysql.yml up -d
        ;;

    pgsql)
        docker-compose -f docker-compose.pgsql.yml up -d
        ;;

    mongo)
        docker-compose -f docker-compose.mongo.yml up -d
        ;;
    *)
        docker-compose -f docker-compose.yml up -d
esac
