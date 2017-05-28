#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html
/etc/init.d/apache2 start
/usr/local/bin/sft-server 5000 /scripts/sft-script.sh

