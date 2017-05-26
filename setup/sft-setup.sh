#!/bin/sh -e

apt-get update
apt-get install imagemagick wget -y

mkdir -p /usr/local/bin
cd /usr/local/bin
wget -O sft-server https://github.com/name29/simpleFileTransfer/blob/master/sft-server?raw=true
chmod +x sft-server





