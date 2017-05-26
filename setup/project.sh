#!/bin/bash
git clone https://marcosanfilippo@bitbucket.org/marcosanfilippo/p-l-ws.git
cd /
mkdir -p /workspace
mv setup/p-l-ws/ ../workspace/
cd /workspace/p-l-ws/
bundle install
cd /
