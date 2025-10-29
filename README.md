# .dotfiles

# Install

```bash
git clone --recurse-submodules git@github.com:DaanGrob05/.dotfiles.git ~/.dotfiles
```

# Symlinks

```bash
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml

rm ~/.config/fish/config.fish
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish

ln -s ~/.dotfiles/ideavimrc ~/.ideavimrc

rm ~/.config/i3/config
ln -s ~/.dotfiles/i3config ~/.config/i3/config

rm ~/.config/i3status/config
ln -s ~/.dotfiles/i3status_config ~/.config/i3status/config

```

# Other Actions

```bash
# Load rose-pine.dconf for terminal styling
dconf load /org/gnome/terminal/legacy/profiles:/ < rose-pine.dconf
```
