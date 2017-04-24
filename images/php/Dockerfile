FROM php:fpm-alpine

RUN sed -i 's/www-data:x:82:82/www-data:x:33:33/' /etc/passwd \
    && apk add --update --no-cache openssl git libmcrypt libpq libpng jpeg freetype \
    && apk add --no-cache --virtual .build-deps libmcrypt-dev postgresql-dev libpng-dev freetype-dev jpeg-dev \
    && docker-php-ext-install mcrypt pdo_pgsql pdo_mysql zip opcache session gd \
    && sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /usr/local/etc/php-fpm.d/www.conf \
    && sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 5/" /usr/local/etc/php-fpm.d/www.conf \
    && sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /usr/local/etc/php-fpm.d/www.conf \
    && mkdir /var/htdocs \
    && apk del .build-deps

VOLUME /var/htdocs
WORKDIR /var/htdocs

CMD ["php-fpm"]
