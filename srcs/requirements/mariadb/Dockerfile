FROM debian:buster


RUN apt-get update && \
    apt-get install -y mariadb-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf /etc/mysql/mariadb.conf.d

COPY ./tools setup.d

RUN chmod +x /setup.d/setup.sh


EXPOSE 3306

CMD ["/setup.d/setup.sh"]

