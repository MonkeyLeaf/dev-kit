#!/bin/bash

SRC_DIR="$PWD/src"
cd "$SRC_DIR" || exit
sudo chown -R "$USER":"$USER" .