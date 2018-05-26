#!/bin/ash
if [ "$APP_ENV" = "production" ] 
then
  npm run build
else 
  npm start
fi