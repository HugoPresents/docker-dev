# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages

RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y php5-fpm php5-curl php5-mysqlnd php5-mcrypt php5-gd php5-dev php5-pgsql libyaml-dev git-core gcc libpcre3-dev && \
pecl install yaml

# build phalcon
RUN cd /tmp && \
git clone --depth=1 git://github.com/phalcon/cphalcon.git && \
cd cphalcon/build && \
./install && \
touch /etc/php5/mods-available/phalcon.ini && \
echo '[phalcon]\nextension=phalcon.so' > /etc/php5/mods-available/phalcon.ini && \
rm -rf /tmp/cphalcon

# connfiguration
RUN sed -E -i "s/^listen.+?$/listen = 0.0.0.0:9000/" /etc/php5/fpm/pool.d/www.conf
RUN sed -E -i "s/^pm\.max_children.+?$/pm\.max_children=10/" /etc/php5/fpm/pool.d/www.conf
RUN sed -E -i "s/^pm\.start_servers.+?$/pm\.start_servers=4/" /etc/php5/fpm/pool.d/www.conf
RUN sed -E -i "s/^pm\.min_spare_servers.+?$/pm\.min_spare_servers=2/" /etc/php5/fpm/pool.d/www.conf
RUN sed -E -i "s/^pm\.max_spare_servers.+?$/pm\.max_spare_servers=6/" /etc/php5/fpm/pool.d/www.conf
RUN sed -E -i "s/^post_max_size.+?$/post_max_size = 100M/" /etc/php5/fpm/php.ini
RUN sed -E -i "s/^upload_max_filesize.+?$/upload_max_filesize = 100M/" /etc/php5/fpm/php.ini

RUN touch /etc/php5/mods-available/yaml.ini && \
echo "extension=yaml.so" > /etc/php5/mods-available/yaml.ini && \
php5enmod yaml mcrypt phalcon

# phalcon alias
RUN touch /root/.bash_aliases && \
echo "alias phalcon='/var/htdocs/ide-helper/phalcon-devtools/phalcon.php'" > /root/.bash_aliases

# for development
RUN sed -E -i "s/^display_errors.+?$/display_errors = On/" /etc/php5/fpm/php.ini
RUN sed -E -i "s/^error_reporting.+?$/error_reporting = E_ALL/" /etc/php5/fpm/php.ini

RUN mkdir /var/htdocs
RUN chown -R www-data:www-data /var/htdocs

EXPOSE 9000

CMD php5-fpm -F