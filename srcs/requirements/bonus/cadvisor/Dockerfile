FROM debian:buster


RUN apt-get update \
    && apt-get install -y wget \
    && wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -O /usr/bin/cadvisor \
    && chmod +x /usr/bin/cadvisor

EXPOSE 8080

CMD [ "cadvisor" ]