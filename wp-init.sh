#!/usr/bin/env bash

set -e

# Only download WordPress if folder is empty
if [ -z "$(ls -A /var/www/html)" ]; then
  echo "WordPress not found. Downloading from WordPress.org..."
  wp core download --allow-root
else
  echo "Existing WordPress detected."
fi

exec "$@"
