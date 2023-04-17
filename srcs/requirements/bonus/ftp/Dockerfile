FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/setup.sh /entrypoint.d/

RUN chmod +x /entrypoint.d/setup.sh

EXPOSE 20 21 40000-40005

ENTRYPOINT [ "/entrypoint.d/setup.sh" ]

CMD ["vsftpd", "/etc/vsftpd.conf"]