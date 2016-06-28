FROM centos:6.7

MAINTAINER Danilo Rodrigues <danilo@fillet.com.br>

ADD assets /assets
RUN /assets/setup.sh

EXPOSE 22

CMD /usr/sbin/sshd -D