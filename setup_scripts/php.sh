#!/bin/sh

sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php # Press enter to confirm.
sudo apt update

sudo apt install php8.4-cli php8.4-fpm
sudo apt install php8.4-common php8.4-{bcmath,bz2,curl,gd,gmp,intl,mbstring,opcache,readline,xml,zip,sqlite3,xdebug}

# Install completion files for artisan
curl -L --create-dirs -o ~/.config/fish/completions/artisan.fish https://github.com/adriaanzon/fish-artisan-completion/raw/master/completions/artisan.fish
curl -L --create-dirs -o ~/.config/fish/completions/php.fish https://github.com/adriaanzon/fish-artisan-completion/raw/master/completions/php.fish
curl -L --create-dirs -o ~/.config/fish/functions/artisan.fish https://github.com/adriaanzon/fish-artisan-completion/raw/master/functions/artisan.fish
