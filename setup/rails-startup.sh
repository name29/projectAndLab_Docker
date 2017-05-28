#!/bin/bash

cd /workspace

if [ -d "p-l-ws" ]; then
	cd p-l-ws
	git pull
else
	git clone https://marcosanfilippo@bitbucket.org/marcosanfilippo/p-l-ws.git
	cd p-l-ws
fi
bundle install

export PROJWS_HOST="172.17.0.2"
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
rm tmp/pids/server.pid
RAILS_ENV=production rails s
