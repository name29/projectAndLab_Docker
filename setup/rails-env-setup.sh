#!/bin/bash

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

ORANGE='\033[0;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'
printf "\n${ORANGE}This script will install the last Ruby and Rails version${NC}\n\n"

curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && sudo apt-get install -y nodejs

gem install rails

rails -v

sudo apt-get -y autoremove && apt-get -y clean && apt-get -y autoclean

printf "\n${GREEN}Ok! All is done. Check the OUTPUT above.${NC}\n\n"

printf "\n${CYAN}Launching Rails Server in production mode${NC}\n\n"

cd /workspace/p-l-ws/

export PROJWS_HOST="172.17.0.2"
RAILS_ENV=production rails db:create
RAILS_ENV=production rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK=1
echo "Removing old pid"
rm /volume/workspace/p-l-ws/tmp/pids/server.pid
RAILS_ENV=production rails s
