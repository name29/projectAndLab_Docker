#!/bin/sh -e

apt-get update
apt-get install build-essential imagemagick git -y

mkdir -p /opt/repo
cd /opt/repo
git clone https://github.com/name29/simpleFileTransfer.git
cd simpleFileTransfer
gcc server.cpp -Wall -o sft-server
mkdir -p /usr/local/bin
cp sft-server /usr/local/bin




