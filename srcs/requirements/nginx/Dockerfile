FROM debian:buster

# RUN apt-get update \
#     && apt-get install -y curl gnupg2 ca-certificates lsb-release debian-archive-keyring
    
# RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor \
#     | tee /usr/share/keyrings/nginx-archive-keyring.gpg >/dev/null 

# RUN gpg --dry-run --quiet --no-keyring --import --import-options import-show /usr/share/keyrings/nginx-archive-keyring.gpg

# RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] \
#     http://nginx.org/packages/debian `lsb_release -cs` nginx" \
#     | tee /etc/apt/sources.list.d/nginx.list

# RUN echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" \
#     | tee /etc/apt/preferences.d/99nginx

# RUN apt-get update \
#     && apt-get install -y nginx \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl gnupg2 ca-certificates lsb-release build-essential zlib1g-dev libpcre3-dev libssl-dev && \
    curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add - && \
    echo "deb https://nginx.org/packages/mainline/debian/ $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list && \
    apt-get update && \
    apt-get install -y nginx



COPY ./conf/ /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
