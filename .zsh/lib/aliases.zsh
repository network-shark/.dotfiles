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

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection


alias less='bat'
alias more='bat'
