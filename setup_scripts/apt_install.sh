#!/bin/bash

# Update and install
sudo apt update && sudo apt upgrade -y
sudo apt install git-all curl gcc ffmpeg ubuntu-restricted-extras libavcodec-extra ripgrep fd-find fzf xclip bat tmux build-essential tmuxinator nodejs npm flatpak pipx protobuf-compiler python3 python3-tk python3-venv php php-cli php-mbstring php-pgsql php-mysql libapache2-mod-php -y
