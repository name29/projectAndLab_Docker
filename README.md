### NOTE ###
IP will be provided as serial starting from 1172.17.0.x
Order:
Postgres (172.17.0.2)
Rails (172.17.0.3)
FTP (172.17.0.4)


# POSTGRES

docker volume create post

sudo docker build -t "postgres-custom" -f ./pci-dockerfile .
sudo docker run --name "postgres-server" -d -v /var/lib/docker/volumes/post/_data:/datadb -p 5432:5432 postgres-custom

### postgres e bestemmie (NON SERVE, E' INTEGRATO NELLO SCRIPT init.sql)###
docker exec -it postgres-server bash #-> FOLLOW BELOW INSTRUCTION
su - postgres -c psql
(or)
psql -U postgres -p 5432 -h localhost
# ->: create role NAME with createdb login password 'PASSWORD';
# > create role rails with createdb login password 'rails';
\du (check its existence)
\q (quit)


# RAILS

docker volume create projectWS

sudo docker build -t "rails-env" -f ./rails-dockerfile .
sudo docker run --name "rails-server" -d -v /var/lib/docker/volumes/projectWS/_data:/volume -p 3000:3000 -it rails-env

# use DOCKER ATTACH CONTAINER_NAME to see its status.
# use "CTRL C" to KILL it.
# use "CTRL P Q" to detach and let it running.



# FTP
docker volume create ftpServer

sudo docker build -t "ftp-custom" -f ./ftp-dockerfile .
sudo docker run --name "ftp-server" -d -v /var/lib/docker/volumes/ftpServer/_data:/mnt/ruby -p 5000:5000 ftp-custom


