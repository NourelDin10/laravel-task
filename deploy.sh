#!/bin/bash
APP_DIR="/var/www/laravel-task"  
LOG_FILE="$APP_DIR/deploy.log"

cd $APP_DIR || exit

{
  echo "---------------------------------"
  echo "Deployment started at $(date)"

  git checkout 12.x
  git pull origin 12.x

  composer install --no-interaction --prefer-dist
  php artisan migrate --force
  php artisan cache:clear
  php artisan config:clear
  php artisan route:clear
  php artisan view:clear

  echo "Deployment completed at $(date)"
} >> $LOG_FILE 2>&1
