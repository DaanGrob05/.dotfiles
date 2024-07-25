#!/bin/bash

# Update and install
sudo apt update && sudo apt upgrade -y
sudo apt install git-all curl gcc ffmpeg ubuntu-restricted-extras libavcodec-extra ripgrep fd-find fzf xclip bat tmux gnome-tweaks gnome-shell-extensions -y

# Set up caps lock to be ctrl and both shift to be caps lock
gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps', 'shift:both_capslock', 'shift:both_capslock_cancel']"

# Flatpak
sudo apt install flatpak
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
	"refresh wifi connections"
	"bluetooth quick connect"
	"status area horizontal spacing"
	"color picker"
	"lock keys"
  "Hide Top Bar"
  "Notification Banner Reloaded"
  "No Titlebar When Maximized"
)

# Github SSH keg
ssh-keygen -t ed25519 -C "d.grob05@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub # Copy this output and add key in github

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# Node and NPM
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install nodejs -y

# Set NPM Global path
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >>~/.zshrc

# Bun
curl -fsSL https://bun.sh/install | bash
exec /usr/bin/zsh

# LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Github CLI
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg &&
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null &&
	sudo apt update &&
	sudo apt install gh -y#
gh extension install dlvhdr/gh-dash

# install rose pine kde theme
git clone git@github.com:ashbork/kde.git ~/rose-pine-kde/ # install settings > appearance > plasma style > install from file > select the .tar.gz file

# Bruno CLI
npm i -g @usebruno/cli#

# install fish shell
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
chsh -s ${which fish}

# Install Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Jagex Launcher and RuneLite
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --user --if-not-exists JagexLauncher https://jagexlauncher.flatpak.mcswain.dev/JagexLauncher.flatpakrepo
# Required for 32-bit compatibility. Jagex Launcher is 32-bit.
flatpak install --user flathub org.freedesktop.Platform.Compat.i386/x86_64/23.08
flatpak install --user flathub org.freedesktop.Platform.GL32.default/x86_64/23.08
# Install the launcher itself
flatpak install --user JagexLauncher com.jagex.Launcher
# Install RuneLite (if desired)
flatpak install --user JagexLauncher com.jagex.Launcher.ThirdParty.RuneLite

# Install zoxide
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Install Lazydocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Install Bob and neovim
cargo install --git https://github.com/MordechaiHadad/bob.git
bob use latest

# Install Gradience
flatpak install flathub com.github.GradienceTeam.Gradience

# Install Difftastic and set as git difftool
cargo install difftastic
git config --global diff.external difft

# Install Docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
  # Add Docker's offical GPG Key
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
  # Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
  # Install Docker packages and verify installation
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world

# Install N
curl -fsSL https://raw.githubusercontent.com/tj/n/master/bin/n | bash -s lts
# If you want n installed, you can use npm now.
npm install -g n
mkdir ~/.local
sudo rm -rf /usr/local/bin/node
