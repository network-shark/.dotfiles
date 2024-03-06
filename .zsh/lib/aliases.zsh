alias ll='ls -la'
alias lh='ls -lah'
alias ...='cd ../..'
alias now='date +%s'
alias dotfiles='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

alias cat='bat'


alias less='bat'
alias more='bat'
