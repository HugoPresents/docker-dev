# VERSION 0.0.1
FROM ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y software-properties-common && \
locale-gen en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \
apt-add-repository -y ppa:ondrej/php5-5.6 && \
apt-get update && \
apt-get install -y php5-fpm php5-curl php5-mysqlnd php5-mcrypt php5-gd php5-pgsql php5-memcached git && \
rm -rf /var/lib/apt/lists/*

# connfiguration
RUN sed -E -i "s/^listen\ =.+?$/listen = 0.0.0.0:9000/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\ =.+?$/pm = ondemand/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^pm\.max_children\ =.+?$/pm\.max_children = 2/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^;pm\.process_idle_timeout\ =.+?$/pm\.process_idle_timeout=10s/" /etc/php5/fpm/pool.d/www.conf && \
sed -E -i "s/^error_log\ =.+?$/error_log = \/dev\/stdout/" /etc/php5/fpm/php-fpm.conf && \
sed -E -i "s/^post_max_size\ =.+?$/post_max_size = 100M/" /etc/php5/fpm/php.ini && \
sed -E -i "s/^upload_max_filesize\ =.+?$/upload_max_filesize = 100M/" /etc/php5/fpm/php.ini

# for development
RUN sed -E -i "s/^display_errors\ .+?$/display_errors = On/" /etc/php5/fpm/php.ini && \
sed -E -i "s/^error_reporting\ .+?$/error_reporting = E_ALL \& \~E_DEPRECATED \& \~E_STRICT \& \~E_NOTICE/" /etc/php5/fpm/php.ini

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

CMD ["php5-fpm", "-F"]
