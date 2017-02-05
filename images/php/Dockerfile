# VERSION 0.0.1
FROM alpine:edge
MAINTAINER Hugo Zhang<rabbitzhang52@gmail.com>

# install packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
echo 'http://mirrors.ustc.edu.cn/alpine/edge/testing' >> /etc/apk/repositories && \
apk add --no-cache php7 php7-fpm php7-pdo_mysql php7-zip php7-mcrypt php7-phar php7-gd php7-curl php7-mysqlnd php7-xml php7-pdo_pgsql \
php7-pgsql php7-mbstring git openssh openssl php7-gettext php7-json php7-dom php7-iconv php7-openssl php7-ctype php7-apcu php7-pdo && \
sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php7/php-fpm.d/www.conf && \
sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /etc/php7/php-fpm.d/www.conf && \
sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 2/" /etc/php7/php-fpm.d/www.conf && \
sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /etc/php7/php-fpm.d/www.conf && \
sed -E -i "s/^;error_log\ =.+?$/error_log = \/proc\/self\/fd\/2/" /etc/php7/php-fpm.conf && \
sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php7/php.ini && \
sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php7/php.ini && \
sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php7/php.ini && \
sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL/" /etc/php7/php.ini && \
mkdir /var/run/php

# https://phar.phpunit.de/phpunit.phar https://getcomposer.org/composer.phar
COPY phpunit.phar /usr/local/bin/phpunit
COPY composer.phar /usr/local/bin/composer
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/phpunit /usr/local/bin/composer /entrypoint.sh && \
mkdir /var/htdocs

WORKDIR /var/htdocs
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000

CMD ["php-fpm7", "-F"]
