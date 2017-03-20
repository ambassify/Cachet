#!/bin/sh

# recreate laravel cache stuff, it's all invalid since paths change after heroku
# build has completed and dyno gets started
composer run post-update-cmd

# password file for nginx
echo "${AUTH_USER}:`openssl passwd -apr1 ${AUTH_PASSWORD}`" > /app/.htpasswd

vendor/bin/heroku-php-nginx -C nginx_app.conf public/
