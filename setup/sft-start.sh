#!/bin/bash

DIR="/mnt/ruby/workspace/p-l-ws/app/assets"

while [ -d "$DIR" ];
do
	echo "Waiting for directory $DIR"
	sleep 3
done

cd $DIR

/usr/local/bin/sft-server 5000 /scripts/sft-script.sh

