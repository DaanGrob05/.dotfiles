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

alias vim="~/./nvim.appimage"

alias gg="lazygit"

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
alias cat="batcat"
