FROM debian:buster


RUN apt-get update && \
    apt-get install -y mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf /etc/mysql/mariadb.conf.d

COPY ./tools entrypoint.d

RUN chmod +x /entrypoint.d/setup.sh

EXPOSE 3306

ENTRYPOINT [ "/entrypoint.d/setup.sh" ]

CMD ["mysqld_safe"]

