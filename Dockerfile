# VERSION 0.0.1
FROM ubuntu:14.04
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# backup original repo address
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak

# replace repo address
COPY etc/apt/sources.list /etc/apt/sources.list

# update & upgrade packages
RUN apt-get update && apt-get upgrade -y

# install packages
#RUN apt-get install -y mysql-server php5 php5-cli php5-fpm php5-mysqlnd php5-mcrypt php5-gd nginx
RUN apt-get install -y nginx supervisor
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# ssh debug
#RUN apt-get install -y openssh-server



# access mysql from remote
#RUN sed -i -e "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
#RUN /usr/sbin/mysqld


# change timezone
COPY etc/timezone /etc/timezone

# add startup script
ADD startup.sh /opt/startup.sh

RUN mkdir /var/htdocs
RUN chown -R www-data:www-data /var/htdocs
# define volumes
VOLUME ["/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/var/log/nginx", "/var/htdocs"]
WORKDIR /etc/nginx
# access ports
EXPOSE 80 443

CMD /opt/startup.sh