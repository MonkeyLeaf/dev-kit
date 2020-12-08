FROM drupal:8

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data
RUN chown -R www-data:www-data web/sites web/modules web/themes;

WORKDIR /opt/drupal/web

CMD ["apachectl", "-DFOREGROUND"]