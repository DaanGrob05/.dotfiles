# .dotfiles

# Install

```bash
git clone --recurse-submodules git@github.com:DaanGrob05/.dotfiles.git ~/.dotfiles
```

````

# Symlinks

```bash
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml

rm ~/.config/fish/config.fish
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish

````
