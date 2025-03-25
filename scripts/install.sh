#!/bin/bash

cd /var/www/laravel-demo

# Ensure correct permissions
chown -R www-data:www-data .

# Laravel setup
composer install --no-dev --optimize-autoloader
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan migrate --force
