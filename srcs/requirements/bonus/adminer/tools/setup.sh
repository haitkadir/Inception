#!/bin/bash

wget https://www.adminer.org/latest.php -O /var/www/html/index.php

service php7.3-fpm start

exec "$@"