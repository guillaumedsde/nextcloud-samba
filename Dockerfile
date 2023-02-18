ARG OFFICIAL_TAG 25-apache

FROM docker.io/nextcloud:${OFFICIAL_TAG}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
    procps \
    smbclient \
    libsmbclient-dev \
    && pecl install smbclient \
    && docker-php-ext-enable smbclient \
    && echo "extension=smbclient.so" > /usr/local/etc/php/conf.d/docker-php-ext-smbclient.ini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*