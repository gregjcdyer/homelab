#!/usr/bin/env bash
set -e

SERVER="$1"
REMOTE_DIR="$2"

read -r -p "Service name to push (e.g. myapp): " name

file="docker/traefik/data/configs/${name}.yml"

if [ ! -f "$file" ]; then
  echo "Error: $file not found. Run 'make traefik-add' first." >&2
  exit 1
fi

echo "Pushing $file to ${SERVER}:${REMOTE_DIR}/"
scp "$file" "${SERVER}:${REMOTE_DIR}/"
echo "Done. Traefik will pick up the new service automatically."
