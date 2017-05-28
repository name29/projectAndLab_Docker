#!/bin/sh -e

if [  "$(docker ps | grep postgres-server)" ]; then
	echo "Stopping postgres-server"
	docker stop postgres-server >> /dev/null
fi

if [  "$(docker ps | grep rails-server)" ]; then
	echo "Stopping rails-server"
	docker stop rails-server >> /dev/null
fi

if [  "$(docker ps | grep sft-server)" ]; then
	echo "Stopping sft-server"
	docker stop sft-server >> /dev/null
fi

if [ ! "$(docker volume ls | grep projectWS)" ];then
	echo "Creating volume projectWS"
	docker volume create projectWS >> /dev/null
fi

if [ ! "$(docker volume ls | grep post)" ];then
	echo "Creating volume post"
	docker volume create post >> /dev/null
fi

if [ ! "$(docker volume ls | grep imagestore)" ];then
	echo "Creating volume imagestore"
	docker volume create imagestore >> /dev/null
fi

if [ !  "$(docker images | grep base-sft)" ]; then
	echo "Creating base-sft..."
	docker build -t "base-sft" -f ./base-sft-dockerfile .
fi

if [ !  "$(docker images | grep base-rails)" ]; then
	echo "Creating base-rails..."
	docker build -t "base-rails" -f ./base-rails-dockerfile .
fi


if [ !  "$(docker images | grep postgres-custom)" ]; then
	echo "Creating postgres-custom..."
	docker build -t "postgres-custom" -f ./pci-dockerfile .
fi

if [ !  "$(docker images | grep rails-env)" ]; then
	echo "Creating rails-env..."
	docker build -t "rails-env" -f ./rails-dockerfile .
fi

if [ ! "$(docker images | grep sft-custom)" ]; then
	echo "Creating sft-custom..."
	docker build -t "sft-custom" -f ./sft-dockerfile .
fi

if [ ! "$(docker ps -a | grep postgres-server)" ]; then
	echo "Starting postgres-server"
	docker run --name "postgres-server" -d -v /var/lib/docker/volumes/post/_data:/datadb -p 5432:5432 postgres-custom >> /dev/null
else
	echo "Starting (again) postgres-server"
	docker start "postgres-server" >> /dev/null
fi

if [ !  "$(docker ps -a | grep rails-server)" ]; then
	echo "Starting rails-server"
#	docker run --name "rails-server" -d -p 3000:3000 rails-env  >> /dev/null
	docker run --name "rails-server" -d -v /var/lib/docker/volumes/projectWS/_data:/volume -p 3000:3000 rails-env  >> /dev/null
else
	echo "Starting (again) rails-server"
	docker start "rails-server" >> /dev/null
fi

if [ ! "$(docker ps -a | grep sft-server)" ]; then
	echo "Starting sft-server"
	docker run --name "sft-server" -d -v /var/lib/docker/volumes/imagestore/_data:/var/www -p 5050:80 -p 5000:5000 sft-custom >> /dev/null
else
	echo "Starting (again) sft-server"
	docker start "sft-server" >> /dev/null
fi

ifconfig eth0 up
ifconfig eth0 192.168.89.1 netmask 255.255.255.0
