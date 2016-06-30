docker-centos-6-java-7
============================
Java 7 Update 79 (7u79) with Maven on CentOS 6.7

##### Installation
```
docker pull drodrigues/centos-6-java-7:maven
```

##### Run the container:
```
docker run -d -p 51022:22 --name centos6 drodrigues/centos-6-java-7:maven
```

##### Login by SSH
```
ssh root@$(docker-machine ip) -p 51022
password: admin
```
