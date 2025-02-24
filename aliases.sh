alias update="sudo apt update && sudo apt upgrade -y && flatpak update"
alias cleanup="sudo apt autoremove && sudo apt autoclean"
alias uac="update && cleanup"

alias nordvpn-pause="nordvpn d && sleep 300 && nordvpn c netherlands"
alias nordC="nordvpn c netherlands"
alias nordD="nordvpn d"

alias docker-stop='docker ps -aq | xargs docker stop'

alias a="artisan"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'

alias ca="cargo"

alias src="source ~/.dotfiles/config.fish"

alias vim="nvim"

alias gg="lazygit"
alias lad="lazydocker"

alias nvimconfig="cd ~/.config/nvim && vim . && cd -"

alias cw="cd ~/coding/codewars/"
alias lc="cd ~/coding/leetcode/"
alias cod="cd ~/coding/"

alias ghcreateinit="git add . && git commit -m \"Commit before first push to Github\" && gh repo create --private --push --source ."
alias ghcreate="gh repo create --private --push --source ."

alias fman="compgen -c | fzf | xargs -r fman"
alias fd="fdfind"
# alias cdall="cd $(fdfind -t d | fzf)"

alias bat="batcat"

alias sp="cd ~/BigBridge/SmartPeak/"

alias dote="cd ~/.dotfiles && vim . && cd -"
alias dotu="cd ~/.dotfiles && git pull"

alias c="z" # easier to type than z and is close to cd

alias doco="docker-compose"

alias sail="./vendor/bin/sail"
alias a="artisan"

alias gsw="git switch"

alias m="bin/magento"

alias mk="minikube"
alias k="kubectl"

alias np="N_PREFIX=$HOME/.local n"

alias mux="tmuxinator"

alias gocli="golangci-lint"

alias prc="gh pr checkout"

alias discamera="sudo modprobe -r uvcvideo"
alias encamera="sudo modprobe uvcvideo"
