docker-centos-6-java-7
============================
Java 7 Update 79 (7u79) on CentOS 6.7

##### Installation
```
docker pull drodrigues/centos-6-java-7
```

#####Run with 22 port opened:
```
docker run -t -i -p 51022:22 --name centos6 drodrigues/centos-6-java-7
```

#####Login by SSH
```
ssh root@localhost -p 51022
password: admin
```
