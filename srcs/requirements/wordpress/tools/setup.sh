#!/bin/bash

wp_config="<?php
// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$WORDPRESS_DB_NAME' );

/** Database username */
define( 'DB_USER', '$WORDPRESS_DB_USER' );

/** Database password */
define( 'DB_PASSWORD', '$WORDPRESS_DB_PASSWORD' );

/** Database hostname */
define( 'DB_HOST', '$WORDPRESS_DB_HOST' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

$(wget -qO- https://api.wordpress.org/secret-key/1.1/salt/)

\$table_prefix = '$WORDPRESS_TABLE_PREFIX';

define( 'WP_DEBUG', false );

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

"

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp
chmod +x /tmp/wp-cli.phar
mkdir -p /var/www/html
cd /var/www/html
/tmp/wp-cli.phar core download --allow-root
echo "$wp_config" >> /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/html
find /var/www/html/ -type d -exec chmod 750 {} \;
find /var/www/html/ -type f -exec chmod 640 {} \;
/tmp/wp-cli.phar core install --allow-root --url=$DOMAIN_NAME --title=$WORDPRESS_SITE_TITLE --admin_user=$WORDPRESS_SITE_ADMIN_USER --admin_password=$WORDPRESS_SITE_ADMIN_PASSWORD --admin_email=$WORDPRESS_SITE_ADMIN_EMAIL
/tmp/wp-cli.phar user create --allow-root  $WORDPRESS_SITE_USER $WORDPRESS_SITE_USER_EMAIL --role=author --user_pass=$WORDPRESS_SITE_USER_PASSWORD

#Clear unnecessary files
rm -rf /tmp/* /var/tmp/*

exec php-fpm8.2 -F