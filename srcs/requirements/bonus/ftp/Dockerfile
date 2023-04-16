FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd db-util db5.3-util

# COPY ./conf /etc/

COPY ./tools/setup.sh /entrypoint.d/

RUN chmod +x /entrypoint.d/setup.sh

EXPOSE 20 21 1024-1048

ENTRYPOINT [ "/entrypoint.d/setup.sh" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]