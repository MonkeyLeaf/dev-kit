#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose exec hoosier php artisan ...`
# USAGE:
# Change `hoosier` to your service name
# $ script/artisan.sh <your command>
# EG:
# $ script/artisan.sh yarn add lodash

docker-compose exec application php artisan "$@"
