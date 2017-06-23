#!/bin/bash

echo "" > /etc/resolv.conf

echo "nameserver 130.192.3.21" >> /etc/resolv.conf
echo "nameserver 130.192.3.24" >> /etc/resolv.conf
echo "nameserver 130.192.3.103" >> /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

if [ -d "p-l-ws" ]; then
	cd p-l-ws
	git pull
else
	git clone https://marcosanfilippo@bitbucket.org/marcosanfilippo/p-l-ws.git
	cd p-l-ws
fi
bundle install
bundle update

export PROJWS_HOST="172.17.0.2"
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
RAILS_ENV=production rails db:seed

rm tmp/pids/server.pid
RAILS_ENV=production rails s
