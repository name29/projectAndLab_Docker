#!/bin/sh

docker stop postgres-server
docker stop ftp-server
docker stop sfp-server
docker stop sft-server
docker stop rails-env

docker rmi postgres-custom --force
docker rmi ftp-custom --force
docker rmi sfp-custom --force
docker rmi sft-custom --force
docker rmi rails-env --force

docker container rm postgres-custom --force
docker container rm ftp-custom --force
docker container rm sfp-custom --force
docker container rm sft-custom --force
docker container rm rails-env --force

docker rmi base-sft --force
docker rmi base-rails --force
