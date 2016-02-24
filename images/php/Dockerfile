FROM php:7-fpm

# replace repo address
RUN echo "deb http://mirrors.ustc.edu.cn/debian jessie main\n
deb http://mirrors.ustc.edu.cn/debian jessie-updates main" > /etc/apt/sources.list

# update & upgrade packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y curl vim php5-pgsql libyaml-dev php5-memcached

# change localtime
RUN cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime