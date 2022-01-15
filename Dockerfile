ARG OFFICIAL_TAG 22-apache

FROM nextcloud:${OFFICIAL_TAG}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt install -y procps smbclient libsmbclient-dev \
    && pecl install smbclient \
    && docker-php-ext-enable smbclient \
    && echo "extension=smbclient.so" > /usr/local/etc/php/conf.d/docker-php-ext-smbclient.ini \
    && rm -rf /var/lib/apt/lists/*