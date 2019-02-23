FROM php:7.1.26-fpm

MAINTAINER Tuan Cao <caotuan92.hus@gmail.com>

RUN apt-get update && apt-get install -y \
    libbz2-dev \
    libc-client2007e-dev \
    libcurl4-gnutls-dev \
    libedit-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libkrb5-dev \
    libmcrypt-dev \
    libpng-dev \
    libpq-dev \
    libsqlite3-dev \
    libxml2-dev \
    libxslt1-dev

RUN docker-php-ext-install \
    bz2 \
    curl \
    exif \
    #iconv \
    intl \
    json \
    mbstring \
    mcrypt \
    mysqli \
    opcache \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    pgsql \
    readline \
    soap \
    xml \
    xmlrpc \
    xsl \
    zip \
    bcmath

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install imap

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd
