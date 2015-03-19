#!/bin/sh

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db
    /usr/bin/mysqld_safe & sleep 5s
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'rabbit' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    killall mysqld
    sleep 10s
fi

/usr/bin/mysqld_safe