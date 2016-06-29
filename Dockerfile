FROM centos:6.7

MAINTAINER Danilo Rodrigues <danilo@fillet.com.br>

# Install OpenSSH
RUN yum update -y
RUN yum -y install openssh-server

# Change ROOT PASS
RUN mkdir /var/run/sshd
RUN echo 'root:admin' | chpasswd

# SSH Login FIX
RUN sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri "s/^UsePAM yes/#UsePAM yes/" /etc/ssh/sshd_config
RUN sed -ri "s/^#UsePAM no/UsePAM no/" /etc/ssh/sshd_config
RUN ssh-keygen -P "" -t dsa -f /etc/ssh/ssh_host_dsa_key

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Install wget
RUN yum -y install wget

#Install Java 7 update 79
WORKDIR /opt/
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jre-7u79-linux-x64.rpm"
RUN yum -y localinstall jre-7u79-linux-x64.rpm
RUN echo "export JAVA_HOME=/usr/java/jdk1.7.0_79/jre" >> /etc/profile
ENV JAVA_HOME /usr/java/jdk1.7.0_79/jre

# Remove installation files
RUN rm /opt/jre-7u79-linux-x64.rpm

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
