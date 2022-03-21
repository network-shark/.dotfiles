export ZSH=~/.zsh

export EDITOR="/usr/bin/vim"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Extend Autocomplete Search Path
fpath=($HOME/.zsh/lib/completions $fpath)

# Load and run compinit

autoload -U promptinit; promptinit

autoload -U compinit
compinit -i

#PATH=/usr/local/bin:/usr/local/sbin:$PATH
# Python AsyncIO Debugging
export PYTHONASYNCIODEBUG=1
export PYTHONTRACEMALLOC=1

# Go Path related exports
#export GOPATH=~/Projekte/Go
export PATH=$PATH:$GOPATH/bin

## pyenv configs
eval "$(pyenv init -)"
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$HOME/.pyenv/bin:$PATH"
# pyenv openssl fix / cryptography

#eval "$(pyenv virtualenv-init -)"
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#  fi
#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

unsetopt AUTO_NAME_DIRS

#export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.14/gems/vagrant-2.2.14/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
