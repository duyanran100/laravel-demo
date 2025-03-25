#!/bin/bash
set -e

cd /var/www/laravel-demo

# Set correct permissions
chown -R www-data:www-data .

# Fetch .env from SSM Parameter Store
PARAM="laravel-demo-env"
REGION="ap-southeast-2"

aws ssm get-parameter \
  --with-decryption \
  --name "$PARAM" \
  --region "$REGION" \
  --query Parameter.Value \
  --output text > /var/www/laravel-demo/.env

# Install dependencies
composer install --no-dev --optimize-autoloader

# Laravel setup
php artisan key:generate
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan migrate --force
