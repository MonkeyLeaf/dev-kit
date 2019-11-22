FROM alpine:3.10

LABEL maintainer="Tuan Cao <caotuan92.hus@gmail.com>" \
      description="Lightweight container with Nginx 1.16 & PHP-FPM 7.3 based on Alpine Linux."

RUN mkdir -p /run/nginx

# Install packages
RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl \
    php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session \
    php7-mbstring php7-gd nginx supervisor curl

# Configure nginx
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

# Configure PHP-FPM
COPY config/php/php-fpm.conf /etc/php7/php-fpm.conf
COPY config/php/php-fpm.d/www.conf /etc/php7/php-fpm.d/www.conf

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup document root
RUN mkdir -p /var/www/html

# Make the document root a volume
VOLUME /var/www/html

# Add application
WORKDIR /var/www/html

# Expose the port nginx is reachable on
EXPOSE 80

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
