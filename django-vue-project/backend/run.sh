#!/bin/bash
if [ "$APP_ENV" = "production" ] 
then
  gunicorn backend.wsgi:application \
    --bind 0.0.0.0:9000 \
    --workers 4
else
  python ./manage.py runserver 0.0.0.0:9000
fi