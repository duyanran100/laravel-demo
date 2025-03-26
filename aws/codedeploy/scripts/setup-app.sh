#!/bin/bash

cd /var/www/laravel-demo

# Run database migrations
sudo -u www-data php artisan migrate --isolated --force --no-interaction

# Cache app configs
sudo -u www-data php artisan optimize
sudo -u www-data php artisan filament:optimize

# Add Laravel scheduler cron job
cat >/etc/cron.d/laravel-task-scheduler <<EOF
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * www-data cd /var/www/laravel-demo && php artisan schedule:run >> /dev/null 2>&1
EOF
