#!/bin/bash

service mysql start

if [ $? -eq 0 ]
then
    echo "$MARIADB_ROOT_PASSWORD"
    echo "1"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "DELETE FROM mysql.user WHERE User='';"
    echo "2"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "DROP DATABASE IF EXISTS test;"
    echo "3"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASSWORD';"
    echo "4"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "CREATE DATABASE $MARIADB_DATABASE;"
    echo "5"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%';"
    echo "6"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"
    echo "7"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "UPDATE mysql.user SET plugin = 'MARIADB_native_password' WHERE user = 'root';"
    echo "8"
    mysql -u root -p"$MARIADB_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
    echo "Success"
else
    echo "==========================( Error Starting mysql )=============================="
fi

# Start MariaDB service
exec mysqld

# mysqld_safe --user="$MARIADB_USER" --datadir=/var/lib/mysql --log-error=/var/log/mysql/error.log