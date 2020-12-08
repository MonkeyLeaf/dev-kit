#!/bin/bash

# !!! Please run this file in root project folder
# This file is a shortcut for `docker-compose exec --rm app sh -c ""`
# USAGE:
# $ script/compose_exec.sh
docker-compose exec wordpress sh -c "$@"

#sudo chown -R "$USER":"$USER" .