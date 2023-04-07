FROM debian:buster

# Set the root password for MariaDB
ENV MYSQL_ROOT_PASSWORD mypassword
ENV MYSQL_USER db_user
ENV MYSQL_PASSWORD db_password
ENV MYSQL_DATABASE mydatabase

# Install MariaDB and its dependencies
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*


RUN service mysql start \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root';" \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DELETE FROM mysql.user WHERE User='';" \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "DROP DATABASE IF EXISTS test;" \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${MYSQL_DATABASE};" \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';" \
    && mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

RUN service mysql stop

# Expose the MySQL port
EXPOSE 3306

# Start the MySQL server
CMD ["service", "mysql", "start"]

