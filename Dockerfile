FROM node
MAINTAINER "Martin Heidegger" <mh@ikkyotech.com>

RUN apt-get -y update
RUN apt-get -y install git make build-essential openssh-server mongodb-server supervisor libssl-dev python python-dev git default-jre-headless s3cmd locales python-dateutil python-magic cron.d cron

# turn off pam otherwise the ssh login will not work
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN locale-gen en_US en_US.UTF-8
ENV LOCALE en_US
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
RUN localedef -v -c -i en_US -f UTF-8 en_US.UTF-8 || true
RUN dpkg-reconfigure -f noninteractive tzdata

EXPOSE 22