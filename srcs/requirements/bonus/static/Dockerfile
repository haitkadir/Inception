FROM debian:buster


RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./conf/ /etc/nginx/conf.d/
COPY ./site/ /var/www/html

EXPOSE 88

CMD ["nginx", "-g", "daemon off;"]


