export ZSH=~/.zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file ($ZSH/lib/*.zsh) source $config_file

# Extend Autocomplete Search Path
fpath=($HOME/.zsh/lib/completions $fpath)

# Load and run compinit

autoload -U promptinit; promptinit
#prompt pure

autoload -U compinit
compinit -i

PATH=/usr/local/bin:/usr/local/sbin:$PATH


# Go Path related exports
export GOPATH=~/Projekte/Go
export PATH=$PATH:$GOPATH/bin



## pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

PYTHON_PACKAGES = $(pip3 show powerline-status | grep Location: | awk '{print $2}')

if [ -f `which powerline-daemon` ]; then
   powerline-daemon -q
   POWERLINE_BASH_CONTINUATION=1
   POWERLINE_BASH_SELECT=1
   . $PYTHON_PACKAGES/powerline/bindings/zsh/powerline.zsh
fi
