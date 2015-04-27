# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 627220E7
RUN echo 'deb http://archive.scrapy.org/ubuntu scrapy main' | sudo tee /etc/apt/sources.list.d/scrapy.list
RUN apt-get update && apt-get upgrade
RUN apt-get install -y scrapy-0.24

# work dir
RUN mkdir /var/htdocs