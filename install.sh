#!/usr/bin/env sh

dotfiles=$HOME/.dotfiles
zsh_dir=$dotfiles/.zsh
zshrc=$dotfiles/.zshrc
fzf_dir=$HOME/.fzf
zlogin=$dotfiles/.zlogin
vimrc=$dotfiles/.vimrc
vim_dir=$dotfiles/.vim
tmux_conf=$dotfiles/.tmux.conf
gitignore=$dotfiles/.gitignore

echo "Installing/Updating dotfiles...\n"

if [ ! -e $dotfiles/.git ]; then
  echo "Cloning dotfiles\n"
  git clone https://github.com/network-shark/.dotfiles.git $dotfiles
else
  echo "Updating dotfiles\n"
  cd $dotfiles && git pull
  echo "Download & Update Submodules\n"
  cd $dotfiles && git submodule init && git submodule update
fi


if [ ! -e $fzf_dir ]; then
  echo "Installing FZF"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  yes | ~/.fzf/install
else
  echo "FZF Alrady installed"

echo "Creating Symlinks in $Home environment"

## ZSH
[[ ! -e $HOME/.zsh ]] && ln -s $zsh_dir $HOME/.zsh \
  || echo ".zsh already exists..."

[[ ! -e $HOME/.zshrc ]] && ln -s $zshrc $HOME/.zshrc \
  || echo ".zshrc already exists..."

[[ ! -e $HOME/.zlogin ]] && ln -s $zlogin $HOME/.zlogin \
  || echo ".zlogin already exists..."

## VIM
[[ ! -e $HOME/.vim ]] && ln -s $vim_dir $HOME/.zsh \
  || echo ".vim already exists..."

[[ ! -e $HOME/.vimrc ]] && ln -s $vimrc $HOME/.vimrc \
  || echo ".vimrc already exists..."

## TMUX
[[ ! -e $HOME/.tmux.conf ]] && ln -s $tmux_conf $HOME/.tmux.conf \
  || echo ".tmux.conf already exists..."



