#!/bin/bash

# Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# # Manual action
# git config --global user.name "UserName"
# git config --global user.email "Email"
# git config --global init.defaultBranch main

# gnome shell extensions
extensions=(
	"caffeine"
	"clipboard-indicator (tudmotu)"
	"media controls"
	"openweather"
	"blur my shell"
	"just perfection"
	"vitals"
	"impatience"
	"bluetooth quick connect"
	"status area horizontal spacing"
	"color picker"
	"lock keys"
	"Notification Banner Reloaded"
	"No Titlebar When Maximized"
	"gTile"
)

# Install Gradience
flatpak install flathub com.github.GradienceTeam.Gradience

# Install Docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add Docker's offical GPG Key
echo \
	"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
	sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt-get update
# Install Docker packages and verify installation
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
# Add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER
# Log out and log back in to apply the group changes
docker run hello-world
# If sudo related errors come up, run this
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R


# Pipx
pipx ensurepath
sudo pipx ensurepath --global # optional to allow pipx actions with --global argument

# Posting
pipx install posting

# Install asdf, erlang and elixir
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
mkdir -p ~/.config/fish/completions
ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
asdf plugin add erlang
asdf plugin add elixir
asdf install erlang 23.3.4.20
asdf install elixir master-otp-23
