FROM nginx:alpine
# Set timezone
ARG TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG FILE_CONFIG_NGINX="/etc/nginx/conf.d/default.conf"
ARG APP_CODE_PATH_PUBLIC="/var/www/public"
ADD ./config/webserver/conf.d/vhost.conf ${FILE_CONFIG_NGINX}
ARG VAR_NAME=__NGINX_ROOT
ARG APP_CODE_PATH_CONTAINER="/var/www"
ARG APP_CODE_PATH_HOST="src"
COPY ./$APP_CODE_PATH_HOST $APP_CODE_PATH_CONTAINER
WORKDIR $APP_CODE_PATH_CONTAINER
RUN sed -i -e "s#${VAR_NAME}#${APP_CODE_PATH_PUBLIC}#g" "${FILE_CONFIG_NGINX}"



