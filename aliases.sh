alias update="sudo apt update && sudo apt upgrade -y && flatpak update"
alias cleanup="sudo apt autoremove && sudo apt autoclean"
alias uac="update && cleanup"

alias docker-stop='docker ps -aq | xargs docker stop'

alias ca="cargo"

alias src="source ~/.dotfiles/config.fish"

alias vim="nvim"
alias v="nvim"

alias gg="lazygit"
alias lad="lazydocker"

alias ghcreateinit="git add . && git commit -m \"Commit before first push to Github\" && gh repo create --private --push --source ."
alias ghcreate="gh repo create --private --push --source ."

alias fman="compgen -c | fzf | xargs -r fman"
alias fd="fdfind"

alias bat="batcat"

alias nvimconfig="cd ~/.config/nvim && vim . && cd -"
alias dote="cd ~/.dotfiles && vim && cd -"

alias mk="minikube"
alias k="kubectl"

alias np="N_PREFIX=$HOME/.local n"

alias mux="tmuxinator"

alias gocli="golangci-lint"

alias prc="gh pr checkout"

alias bt="bluetoothctl"
