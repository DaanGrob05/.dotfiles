if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.dotfiles/aliases.sh
source ~/.dotfiles/fish_functions/index.fish

set PATH /home/daan/.npm-global/bin/ $PATH
set PATH /home/daan/.cargo/bin $PATH
set PATH /home/daan/.local/bin $PATH
set PATH /usr/local/go/bin $PATH

starship init fish | source

zoxide init fish | source
