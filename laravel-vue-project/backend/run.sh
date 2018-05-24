#!/bin/bash
if [ "$APP_ENV" = "production" ] 
then
  php-fpm
else
  php artisan serve
fi