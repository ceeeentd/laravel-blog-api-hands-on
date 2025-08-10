#!/usr/bin/env bash
set -euo pipefail
APP_DIR=/var/www/laravel-blog-api-hands-on

# preserve .env if present
if [ -f "$APP_DIR/.env" ]; then
  cp "$APP_DIR/.env" /tmp/.env.keep
fi

# remove EVERYTHING inside the app dir (incl. hidden files/dirs)
find "$APP_DIR" -mindepth 1 -maxdepth 1 -exec rm -rf {} +

# re-create expected dirs
mkdir -p "$APP_DIR/bootstrap/cache" "$APP_DIR/storage"

# restore .env if we saved it
if [ -f /tmp/.env.keep ]; then
  mv /tmp/.env.keep "$APP_DIR/.env"
fi
