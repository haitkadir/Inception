#!/bin/bash

envsubst < /etc/nginx/conf.d/my-site.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'