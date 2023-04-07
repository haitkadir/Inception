FROM debian:buster


RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get install openssl -y \
    && mkdir /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt -subj "/C=mr/ST=State/L=City/O=Organization/CN=localhost" \
    && openssl dhparam -out /etc/nginx/dhparam.pem 4096 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y curl gnupg2 ca-certificates lsb-release build-essential zlib1g-dev libpcre3-dev libssl-dev && \
#     curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - && \
#     echo "deb https://nginx.org/packages/mainline/debian/ $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list && \
#     apt-get update && \
#     apt-get install -y nginx



COPY ./conf/ /etc/nginx/sites-available/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]


