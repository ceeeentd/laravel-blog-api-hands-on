#!/usr/bin/env bash
set -euo pipefail
cd /var/www/laravel-blog-api-hands-on

# Ensure composer exists on the instance 
if ! command -v composer >/dev/null 2>&1; then
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php composer-setup.php --install-dir=/usr/local/bin --filename=composer
  rm composer-setup.php
fi

composer install --no-dev --prefer-dist --optimize-autoloader

php -r "file_exists('.env') && strpos(file_get_contents('.env'),'APP_KEY=')!==false ?: exit(1);" || php artisan key:generate

sudo -u www-data php artisan config:cache || true
sudo -u www-data php artisan route:cache || true

sudo -u www-data php artisan migrate --force