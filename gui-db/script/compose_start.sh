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
    pgadmin)
        docker-compose -f docker-compose.pgadmin.yml up -d
        ;;

    phpmyadmin)
        docker-compose -f docker-compose.phpmyadmin.yml up -d
        ;;

    *)
        docker-compose -f docker-compose.yml up -d
esac
