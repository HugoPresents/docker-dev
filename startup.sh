#!/bin/sh

# start rsyslog
#service rsyslog start

# start nginx
service nginx start
supervisord -n
#service ssh start

# start php-fpm
#service php5-fpm start

# start mysql
#service mysql start
#echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'rabbit' WITH  GRANT OPTION; FLUSH PRIVILEGES;" | mysql