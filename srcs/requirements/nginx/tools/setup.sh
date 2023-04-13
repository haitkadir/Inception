#!/bin/bash

envsubst '${DOMAIN_NAME}' < /etc/nginx/conf.d/my-site.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"