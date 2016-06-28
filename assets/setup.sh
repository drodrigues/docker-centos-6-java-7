#!/bin/bash

# Install OpenSSH
yum -y install openssh-server
mkdir /var/run/sshd &&
echo 'root:admin' | chpasswd &&
sed -i 's/^PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config &&
sed -i 's/^#PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config &&
sed -i 's/session\s*required\s*pam_loginuid.so/session optional pam_loginuid.so/g' /etc/pam.d/sshd &&

# Install wget
yum -y install wget

# Install Java 7
cd /opt/ && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jre-7u79-linux-x64.rpm"
yum -y localinstall jre-7u79-linux-x64.rpm
sh -c "echo export JAVA_HOME=/usr/java/jdk1.7.0_79 >> /etc/environment"
sh -c "echo export JRE_HOME=$JAVA_HOME/jre >> /etc/environment"

echo 'export VISIBLE=now' >> /etc/profile &&

# Remove installation files
rm -r /assets/
rm /opt/jre-7u79-linux-x64.rpm

exit $?
