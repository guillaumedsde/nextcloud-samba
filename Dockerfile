FROM docker.io/nextcloud:28.0.3-apache

ARG DEBIAN_FRONTEND=noninteractive

# hadolint ignore=DL3008,DL3015
RUN apt-get update \
    && apt-get install --yes\
    procps \
    smbclient \
    libsmbclient-dev \
    && pecl install smbclient \
    && docker-php-ext-enable smbclient \
    && echo "extension=smbclient.so" > /usr/local/etc/php/conf.d/docker-php-ext-smbclient.ini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*