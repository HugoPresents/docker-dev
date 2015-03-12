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
RUN apt-get install mysql-server php5 php5-cli php5-fpm php5-mysqlnd php5-mcrypt php5-gd nginx

# change timezone
COPY etc/timezone /etc/timezone

# access ports
EXPOSE 80 443 3306