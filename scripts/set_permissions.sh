#!/usr/bin/env bash
set -e
chown -R ubuntu:www-data /var/www/laravel-blog-api-hands-on
find /var/www/laravel-blog-api-hands-on/storage -type d -exec chmod 775 {} \;
find /var/www/laravel-blog-api-hands-on/storage -type f -exec chmod 664 {} \;
chmod -R 775 /var/www/laravel-blog-api-hands-on/bootstrap/cache
sudo -u www-data touch /var/www/laravel-blog-api-hands-on/storage/logs/laravel.log || true
sudo -u www-data chmod 664 /var/www/laravel-blog-api-hands-on/storage/logs/laravel.log || true
