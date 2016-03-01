# VERSION 0.0.1
FROM ubuntu:latest
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# replace repo address
RUN echo "deb http://mirrors.sohu.com/ubuntu/ trusty main restricted universe multiverse\n\
deb http://mirrors.sohu.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb http://mirrors.sohu.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb http://mirrors.sohu.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb http://mirrors.sohu.com/ubuntu/ trusty-backports main restricted universe multiverse\n\
deb-src http://mirrors.sohu.com/ubuntu/ trusty main restricted universe multiverse\n\
deb-src http://mirrors.sohu.com/ubuntu/ trusty-security main restricted universe multiverse\n\
deb-src http://mirrors.sohu.com/ubuntu/ trusty-updates main restricted universe multiverse\n\
deb-src http://mirrors.sohu.com/ubuntu/ trusty-proposed main restricted universe multiverse\n\
deb-src http://mirrors.sohu.com/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list

# update & upgrade packages
RUN apt-get update && \
apt-get upgrade -y && \
apt-get install -y curl vim && \
rm -rf /var/lib/apt/lists/*

# change localtime
RUN cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime
