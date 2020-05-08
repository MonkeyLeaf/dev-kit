#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
TMP_DIR="/example-app/tmp"
if [ -d "$TMP_DIR" ]; then
  rm -f /example-app/tmp/pids/server.pid
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"