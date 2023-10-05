#!/bin/bash


openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/nginx.key \
  -out /etc/ssl/certs/nginx.crt \
  -subj $SUBJ

envsubst '$DOMAIN_NAME' < /nginx.conf > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'