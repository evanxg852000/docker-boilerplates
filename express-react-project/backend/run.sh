#!/bin/ash
if [ "$APP_ENV" = "production" ] 
then
  npm run production
else 
  npm start
fi