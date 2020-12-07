#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker run ... composer`
# USAGE:
# $ script/composer.sh <your command>
# EG:
# $ script/composer.sh install --ignore-platform-reqs OR script/composer.sh install
docker run --rm --interactive --tty \
  --volume $PWD/src:/app \
  --volume $PWD/data/composer:/tmp \
  --user $(id -u):$(id -g) \
  composer "$@"
