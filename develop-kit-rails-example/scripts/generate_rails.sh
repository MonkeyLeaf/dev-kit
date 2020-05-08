#!/bin/bash

DATABASE=mysql

if [ -n "$1" ]
  then
    DATABASE="$1"
fi
docker-compose run --rm app rails new . --force --skip-git --database="$DATABASE"