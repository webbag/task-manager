### Install 

Check version your docker
```
docker -v
 17.05.0-ce, build 89658be
docker-compose -v
 version  1.17.1 or higher
```
```
git clone git@github.com:webbag/task-manager.git
``` 

Create network from dedicated ip
* If the network uses this ip then select others (eg 172.255.0.1 or similar)
``` 
docker network create nginx-proxy --subnet=172.18.0.0/16 --gateway=172.18.0.1
```
Inspect network
``` 
docker network inspect nginx-proxy
```
Add to /ete/hosts IP gateway
* Also change the IP gateway in the _develop/.env file NGINX_PROXY_IP=172.18.0.1 
``` 
sudo echo "172.18.0.1 task-manager.lh" >> /etc/hosts
```

### Getting started DEV
```
cd _develop/ 
```
(enter your own settings)
```
cp .env.disc .env 
```

* Up
```
cd _develop/ 
docker-compose up -d
```
Open url 
http://task-manager.lh/ 

* Down
```
docker-compose down
```

#### Entrance to the container
*  ```docker exec -it php bash ```
*  ```docker exec -it web bash ```
*  ```docker exec -it mysql bash ```
 
#### Diagnosing containers

* Main 
``` 
docker ps
``` 

* Other
``` 
docker ps -a -f status=dead
docker ps -a -f status=exited
docker rm -f $(docker ps -aqf status=dead)
docker rm -f $(docker ps -aqf status=exited)

docker images -f dangling=true
docker rmi $(docker images -q -f dangling=true)
``` 

### MYSQL

DEV
* host:       task-manager.lh
* port:       3306
* user:       task-manager
* pass:       task-manager
* pass_root:  task-manager
* db:         task-manager


![Alt text](https://github.com/webbag/task-manager/blob/master/_develop/database-task-manager-structure.png?raw=true "Model DB")



