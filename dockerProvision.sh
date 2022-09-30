#!/bin/sh
CONTAINER_NAME1=my-nginx
CONTAINER_NAME2=my-apache
#CREATE DIRECTORIES
mkdir -p apache-bind/html
mkdir -p apache-nginx/html

cp /vagrant/html/apache/index.html /home/vagrant/apache-bind/html
cp /vagrant/html/nginx/index.html /home/vagrant/nginx-bind/html

if [ $( docker ps -a | grep $CONTAINER_NAME1 | wc -l ) -gt 0 ]; then
  echo "Container exists running..."
  docker start $CONTAINER_NAME1
else
  echo "$CONTAINER_NAME1 does not exist..."
  echo "creating container in port 8081..."

  docker run -d -p 8081:80 -v /home/vagrant/nginx-bind/html:/usr/share/nginx/html --name my-nginx  nginx
fi

if [ $( docker ps -a | grep $CONTAINER_NAME2 | wc -l ) -gt 0 ]; then
  echo "Container exists running..."
  docker start $CONTAINER_NAME2
else
  echo "$CONTAINER_NAME2 does not exist..."
  echo "creating container in port 8082..."

  docker run -d -p 8082:80 -v /home/vagrant/apache-bind/html:/usr/local/apache2/htdocs --name my-apache  httpd
fi
