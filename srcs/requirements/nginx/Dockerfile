FROM debian:buster


RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get install -y openssl \
    && apt-get install -y gettext-base \
    && mkdir /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj "/C=mr/ST=State/L=City/O=Organization/CN=localhost" \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/ /etc/nginx/conf.d/
COPY ./tools/ setup.d
RUN chmod +x /setup.d/setup.sh

EXPOSE 443 80

CMD ["/setup.d/setup.sh"]


