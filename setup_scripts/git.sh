#!/bin/bash

sudo apt update
sudo apt install software-properties-common # enables add-apt-repository command
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
