FROM php:7.3-fpm-alpine

LABEL maintainer="Tuan Cao <caotuan92.hus@gmail.com>"

RUN apk update && apk add --no-cache \
    # for install bz2 ext
    libbz2 \
    bzip2-dev \
    # for install gd ext
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    # for install imap ext
    imap-dev \
    krb5-dev \
    openssl-dev \
    # for install intl ext
    icu-dev \
    # for install soap ext
    libxml2-dev \
    # for install xsl ext
    libxslt-dev \
    # for install zip ext
    libzip-dev

RUN docker-php-ext-install \
    bcmath \
    bz2 \
    exif \
    intl \
    mysqli \
    pdo_mysql \
    soap \
    xmlrpc \
    xsl \
    zip \
    opcache

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

# Below cmd use for install postgresql
# RUN apk add --no-cache postgresql-dev \
#    && docker-php-ext-install pdo_pgsql pgsql

# Below cmd use for install mongodb
# RUN apk add --no-cache autoconf build-base \
#    && pecl install mongodb \
#    && apk del autoconf build-base 

RUN apk del openssl-dev
RUN rm -rf /var/cache/apk/*