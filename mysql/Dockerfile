# VERSION 0.0.1
FROM rabbit52/ubuntu
MAINTAINER Tuzki Zhang<rabbitzhang52@gmail.com>

# install packages
RUN apt-get update && apt-get install -y mysql-server
RUN sed -E -i "s/^bind-address.+?$/bind-address = 0.0.0.0/" /etc/mysql/my.cnf && \
sed -i "s/skip-external-locking/skip-external-locking\nskip-name-resolve\n/" /etc/mysql/my.cnf

# for boot2docker
RUN sed -E -i "s/^user.+?$/user = root/" /etc/mysql/my.cnf

# access ports
EXPOSE 3306

ADD startup.sh /opt/startup.sh

CMD /opt/startup.sh