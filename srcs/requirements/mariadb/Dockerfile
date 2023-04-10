FROM debian:buster

# Set the root password for MariaDB
# ENV MARIADB_ROOT_PASSWORD mypassword
# ENV MARIADB_USER db_user
# ENV MARIADB_PASSWORD db_password
# ENV MARIADB_DATABASE mydatabase

# Install MariaDB and its dependencies
RUN apt-get update && \
    apt-get install -y mariadb-server
    # rm -rf /var/lib/apt/lists/*

RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

# WORKDIR /docker-intrepoint.d/

COPY ./tools/setup.sh .

RUN chmod +x setup.sh


# Expose the MySQL port
EXPOSE 3306

# Start the MySQL server
CMD ["./setup.sh"]

