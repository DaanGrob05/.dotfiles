if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.dotfiles/aliases.sh

set PATH /home/daan/.npm-global/bin/ $PATH

starship init fish | source
