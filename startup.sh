#!/bin/sh

# start rsyslog
service rsyslog start

# start nginx
service nginx start

# start php-fpm
service php5-fpm start

# start mysql
service mysql start