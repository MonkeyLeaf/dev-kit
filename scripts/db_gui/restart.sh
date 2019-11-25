#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose up -d`
# USAGE:
# $ script/db_gui/start.sh [environment]
# EG:
# $ script/db_gui/start.sh
# $ script/db_gui/start.sh mysql

environment=$1

cd ./develop-kit-gui-db
docker-compose down

case "$environment" in
    phpmyadmin)
        docker-compose -f docker-compose.phpmyadmin.yml up -d
        ;;

    pgadmin)
        docker-compose -f docker-compose.pgadmin.yml up -d
        ;;

    *)
        docker-compose -f docker-compose.yml up -d
esac
