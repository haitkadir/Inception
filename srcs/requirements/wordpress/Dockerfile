FROM debian:buster

RUN apt-get update \
    && apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 wget \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list \
    && wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - \
    && apt-get update \
    && apt-get install --no-install-recommends -y php8.2 php8.2-cli php8.2-common php8.2-mysql php8.2-zip php8.2-gd php8.2-mbstring php8.2-curl php8.2-xml php8.2-bcmath php8.2-fpm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /run/php && chown www-data:www-data /run/php && chmod 755 /run/php

COPY ./conf /etc/php/8.2/fpm/pool.d

COPY ./tools/setup.sh setup.d/

RUN  chmod +x /setup.d/setup.sh

EXPOSE 9000

CMD [ "/setup.d/setup.sh"]