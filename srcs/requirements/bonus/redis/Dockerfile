FROM debian:buster

RUN apt-get update && apt-get install -y lsb-release curl gnupg vim \
    && curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list \
    && apt-get update && apt-get install -y redis


COPY ./conf /etc/redis


EXPOSE 6379


CMD [ "/etc/init.d/redis-server", "start" ]