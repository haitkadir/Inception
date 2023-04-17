FROM debian:buster


RUN apt-get update \
    && apt-get install -y nginx wget php php-fpm php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/ /etc/nginx/conf.d/
COPY ./tools/ entrypoint.d
RUN chmod +x /entrypoint.d/setup.sh

EXPOSE 81
ENTRYPOINT ["/entrypoint.d/setup.sh"]

CMD ["nginx", "-g", "daemon off;"]


