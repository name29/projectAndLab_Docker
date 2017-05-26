#!/bin/bash

find ./setup -type f -exec chmod +x {} \;
cd setup
./project.sh
./rails-env-setup.sh
cd /
