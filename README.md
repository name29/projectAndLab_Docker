### NOTE ###
IP will be provided as serial starting from 1172.17.0.x

Order:

* Postgres (172.17.0.2)

* Rails (172.17.0.3)

* FTP (172.17.0.4)


# POSTGRES

* docker volume create post

* sudo docker build -t "postgres-custom" -f ./pci-dockerfile .

* sudo docker run --name "postgres-server" -d -v /var/lib/docker/volumes/post/_data:/datadb -p 5432:5432 postgres-custom


# RAILS

* docker volume create projectWS

* sudo docker build -t "rails-env" -f ./rails-dockerfile .

* sudo docker run --name "rails-server" -d -v /var/lib/docker/volumes/projectWS/_data:/volume -p 3000:3000 -it rails-env

(Use DOCKER ATTACH CONTAINER_NAME to see its status. Use "CTRL C" to KILL it. Use "CTRL P Q" to detach and let it running)



# FTP

* docker volume create ftpServer

* sudo docker build -t "ftp-custom" -f ./ftp-dockerfile .

* sudo docker run --name "ftp-server" -d -v /var/lib/docker/volumes/ftpServer/_data:/mnt/ruby -p 5000:5000 ftp-custom


