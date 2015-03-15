# VERSION 0.0.1
FROM ubuntu:14.04.2
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# backup original repo address
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak

# replace repo address
COPY sources.list /etc/apt/sources.list

# update & upgrade packages
RUN apt-get update && apt-get upgrade -y

# install packages
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# change timezone
RUN echo Asia/Chongqing /etc/timezone

# add startup script

RUN mkdir /var/htdocs
RUN chown -R www-data:www-data /var/htdocs
# define volumes
VOLUME ["/etc/nginx/sites-available", "/etc/nginx/sites-enabled", "/var/log/nginx", "/var/htdocs"]

# access ports
EXPOSE 80 443

CMD nginx