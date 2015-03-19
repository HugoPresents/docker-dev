# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && apt-get install -y mysql-server
RUN sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# for boot2docker
RUN sed -i -e "s/^user\s*=\s*mysql/user = root/" /etc/mysql/my.cnf

# access ports
EXPOSE 3306

ADD startup.sh /opt/startup.sh

CMD /opt/startup.sh