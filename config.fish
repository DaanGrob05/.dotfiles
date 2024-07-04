if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.dotfiles/aliases.sh
source ~/.dotfiles/fish_functions/index.fish

if test -f ~/.dotfiles/.private-dotfiles/config.fish
    source ~/.dotfiles/.private-dotfiles/config.fish
end

set PATH /home/daan/.npm-global/bin/ $PATH
set PATH /home/daan/.cargo/bin $PATH
set PATH /home/daan/.local/bin $PATH
set PATH /usr/local/go/bin $PATH
set PATH /home/daan/go/bin $PATH
set PATH /.config/composer/vendor/bin $PATH
set PATH /home/daan/.local/share/bob/nvim-bin/ $PATH

starship init fish | source

zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
