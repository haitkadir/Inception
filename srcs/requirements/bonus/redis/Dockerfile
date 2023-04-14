FROM debian:buster

RUN apt-get update && apt-get install -y redis-server



RUN sed -i 's/^daemonize yes/daemonize no/' /etc/redis/redis.conf \
    && sed -i 's/^bind 127.0.0.1 -::1/bind 0.0.0.0 ::/' etc/redis/redis.conf \
    && sed -i 's/^# save ""/save 60 1000/' etc/redis/redis.conf \
    && sed -i 's/^# maxmemory <bytes>/maxmemory 128mb/' etc/redis/redis.conf \
    && sed -i 's/^# maxmemory-policy noeviction/maxmemory-policy allkeys-lru/' etc/redis/redis.conf

EXPOSE 6379

CMD [ "redis-server", "--protected-mode", "no" ]