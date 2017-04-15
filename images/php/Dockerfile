FROM php:fpm-alpine

RUN apk add --update --no-cache openssl git libmcrypt-dev postgresql-dev libpng-dev freetype-dev jpeg-dev \
    && docker-php-ext-install mcrypt pdo_pgsql pdo_mysql zip opcache session gd \
    && sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /usr/local/etc/php-fpm.d/www.conf \
    && sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 2/" /usr/local/etc/php-fpm.d/www.conf \
    && sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /usr/local/etc/php-fpm.d/www.conf \
    && mkdir /var/htdocs

VOLUME /var/htdocs
WORKDIR /var/htdocs

CMD ["php-fpm"]
