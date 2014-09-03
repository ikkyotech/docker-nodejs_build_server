FROM node
MAINTAINER "Martin Heidegger" <mh@ikkyotech.com>

RUN apt-get -y update
RUN apt-get -y install git make build-essential openssh-server mongodb-server supervisor libssl-dev python python-dev git default-jre-headless s3cmd

# turn off pam otherwise the ssh login will not work
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

EXPOSE 22