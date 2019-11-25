FROM php:7.3-fpm-alpine

LABEL maintainer="Tuan Cao <caotuan92.hus@gmail.com>" \
      description="Lightweight container with Nginx 1.16 & PHP-FPM 7.3 based on Alpine Linux."

RUN mkdir -p /run/nginx

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
  libzip-dev \
  nginx \
  supervisor

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

# Configure nginx
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Coyping project to image
COPY ./src /var/www/html

RUN chown -R www-data:www-data /var/www/html

# Expose the port nginx is reachable on
EXPOSE 80

RUN apk del openssl-dev
RUN rm -rf /var/cache/apk/*

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
