if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f ~/.dotfiles/.private-dotfiles/aliases.sh
    source ~/.dotfiles/.private-dotfiles/aliases.sh
end

source ~/.dotfiles/aliases.sh
source ~/.dotfiles/fish_functions/index.fish
# source ~/.asdf/asdf.fish

set PATH /home/daan/.npm-global/bin/ $PATH
set PATH /home/daan/.cargo/bin $PATH
set PATH /home/daan/.local/bin $PATH
set PATH /usr/local/go/bin $PATH
set PATH /home/daan/go/bin $PATH
set PATH /.config/composer/vendor/bin $PATH
set PATH /home/daan/.local/share/bob/nvim-bin/ $PATH
set PATH /home/daan/bin $PATH

starship init fish | source

zoxide init fish | source

export EDITOR=nvim

if test -f ~/.dotfiles/.private-dotfiles/config.fish
    source ~/.dotfiles/.private-dotfiles/config.fish
end

