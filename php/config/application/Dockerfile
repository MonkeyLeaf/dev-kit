FROM php:fpm-alpine

ARG APP_CODE_PATH_CONTAINER="/var/www"
ARG APP_CODE_PATH_HOST="src"
ARG ENVIRONMENT="production"
ARG WITH_XDEBUG="false"
ARG REMOTE_PORT=9001
ARG REMOTE_HOST=172.17.0.1
ARG IDE_KEY="PHPSTORM"

WORKDIR $APP_CODE_PATH_CONTAINER

RUN apk update && apk add --no-cache \
  # for install bz2 ext
  libbz2 bzip2-dev \
  # for install gd ext
  freetype-dev libjpeg-turbo-dev libpng-dev \
  # for install imap ext
  imap-dev krb5-dev openssl-dev \
  # for install intl ext
  icu-dev \
  # for install soap ext
  libxml2-dev \
  # for install xsl ext
  libxslt-dev \
  # for install zip ext
  libzip-dev \
  # Install Redis extension library
  gcc musl-dev libc-dev g++ autoconf make

# Install additional packages for php
RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install bcmath bz2 exif intl mysqli pdo_mysql soap xmlrpc xsl zip opcache gd imap

RUN pecl install redis && docker-php-ext-enable redis

# Install composer and config global token
#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#    && php composer-setup.php --install-dir=/bin --filename=composer \
#    && php -r "unlink('composer-setup.php');" \
#    && composer config -g github-oauth.github.com ab3c9ee8522ebc22da20e8b10b35fd0ac00d41de

# Configure php
COPY ./config/application/php.development.ini $PHP_INI_DIR/php.ini-development
COPY ./config/application/php.production.ini $PHP_INI_DIR/php.ini-production

RUN if [ "$ENVIRONMENT" = "development" ]; then \
    mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini" \
    ; else \
    mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    ; fi

# Set timezone
ARG TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install XDebug
RUN if [ "$WITH_XDEBUG" = "true" ]; then \
    pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_connect_back=0" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_autostart=1" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.idekey=$IDE_KEY" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_port=$REMOTE_PORT" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.remote_host=$REMOTE_HOST" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini \
    ; fi

RUN rm -rf /var/cache/apk/*

# Coyping project to image
COPY ./$APP_CODE_PATH_HOST $APP_CODE_PATH_CONTAINER
RUN chown -R www-data:www-data $APP_CODE_PATH_CONTAINER
RUN find $APP_CODE_PATH_CONTAINER -type f -exec chmod 644 {} \;
RUN find $APP_CODE_PATH_CONTAINER -type d -exec chmod 755 {} \;

USER www-data
EXPOSE $REMOTE_PORT 9000
