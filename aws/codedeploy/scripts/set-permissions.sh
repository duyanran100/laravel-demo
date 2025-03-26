#!/bin/bash

chown -R www-data:www-data /var/www/laravel-demo
find /var/www/laravel-demo -type d -exec chmod 755 {} \;
find /var/www/laravel-demo -type f -exec chmod 644 {} \;
chmod -R 775 /var/www/laravel-demo/storage
chmod -R 775 /var/www/laravel-demo/bootstrap/cache
