#!/bin/sh -e

sudo apt-get install build-essentials imagemagick git -y

mkdir -p /opt/repo
cd /opt/repo
git clone https://github.com/name29/simpleFileTransfer.git
cd simpleFileTransfer
gcc server.cpp -Wall -o sfp-server
mkdir -p /usr/local/bin
cp sfp-server /usr/local/bin




