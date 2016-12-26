# VERSION 0.0.1
FROM ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && \
apt-get install -y php-fpm php-curl php-mongodb php-apcu php-uuid php-phar php-ctype php-mysqlnd php-pdo_pgsql php-mcrypt php-gd php-pgsql php-memcached php-mbstring php-xml php-zip git && \
rm -rf /var/lib/apt/lists/*

# connfiguration
RUN sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 2/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /etc/php/7.0/fpm/pool.d/www.conf && \
sed -E -i "s/^error_log\ =.+?$/error_log = \/proc\/self\/fd\/2/" /etc/php/7.0/fpm/php-fpm.conf && \
sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php/7.0/fpm/php.ini && \
sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php/7.0/fpm/php.ini && \
sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php/7.0/fpm/php.ini && \
sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL" /etc/php/7.0/fpm/php.ini && \
mkdir /var/run/php

# phpunit & composer
ADD https://phar.phpunit.de/phpunit.phar /usr/local/bin/phpunit
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/phpunit /usr/local/bin/composer /entrypoint.sh && \
mkdir /var/htdocs && \
chown -R www-data:www-data /var/htdocs

WORKDIR /var/htdocs
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000

CMD ["php-fpm7.0", "-F"]
