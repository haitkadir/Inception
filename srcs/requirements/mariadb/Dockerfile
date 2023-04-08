FROM debian:buster

# # Set the root password for MariaDB
# ENV MYSQL_ROOT_PASSWORD mypassword
# ENV MYSQL_USER db_user
# ENV MYSQL_PASSWORD db_password
# ENV MYSQL_DATABASE mydatabase

# Install MariaDB and its dependencies
RUN apt-get update && \
    apt-get install -y mariadb-server
    # rm -rf /var/lib/apt/lists/*

WORKDIR /docker-intrepoint.d/

COPY ./conf/setup.sh .

RUN chmod +x setup.sh

# Expose the MySQL port
EXPOSE 3306

# Start the MySQL server
CMD ["./setup.sh"]

