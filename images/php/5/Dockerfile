# VERSION 0.0.1
FROM ubuntu:14.04
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y php5-fpm php5-curl php5-mysqlnd php5-mcrypt php5-gd php5-pgsql php5-memcached && \
rm -rf /var/lib/apt/lists/*

# connfiguration
RUN sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 10/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php5/fpm/php.ini && \
sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php5/fpm/php.ini && \
sed -E -i "s/^max_execution_time\ =.+?$/max_execution_time = 3/" /etc/php5/fpm/php.ini && \
sed -E -i "s/^memory_limit\ =.+?$/memory_limit = 256M/" /etc/php5/fpm/php.ini

# for development
RUN sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php5/fpm/php.ini && \
sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL \& \~E_DEPRECATED \& \~E_STRICT \& \~E_NOTICE/" /etc/php5/fpm/php.ini

# phpunit & composer
ADD https://phar.phpunit.de/phpunit.phar /usr/local/bin/phpunit
ADD https://getcomposer.org/download/1.1.2/composer.phar /usr/local/bin/composer

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/local/bin/phpunit /usr/local/bin/composer /entrypoint.sh && \
mkdir /var/htdocs && \
chown -R www-data:www-data /var/htdocs

WORKDIR /var/htdocs
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000

CMD ["php5-fpm", "-F"]
