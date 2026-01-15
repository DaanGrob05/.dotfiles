#!/bin/bash

# Install N
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
# Source before continuing
npm install -g n
np lts
sudo rm -rf /usr/local/bin/node
sudo apt remove nodejs npm
