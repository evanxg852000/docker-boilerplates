#!/bin/bash
if [ "$1" = "prod" ] 
then
  docker build ./frontend -t frontend_builder --no-cache
  docker run -e APP_ENV="production" -v "$PWD/frontend/build":"/usr/devserver/build" frontend_builder
  cp -r ./frontend/build/* ./backend/public
  chmod 755 -R ./backend/public
  cp ./backend/docker/nginx/prod.conf ./backend/docker/nginx/nginx.conf
  docker-compose -f docker-compose.yml build --remove-orphans --no-cache
  docker-compose -f docker-compose.yml up
else
  cp ./backend/docker/nginx/dev.conf ./backend/docker/nginx/nginx.conf 
  docker-compose -f docker-compose.yml  -f frontend/docker-compose.yml up --build
fi
