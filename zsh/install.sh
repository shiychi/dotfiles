#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing zsh...'

brew install zsh

echo 'Installing zinit...'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

echo 'Install zsh configs...'
if [ -d ~/.config/zsh/ ]; then
  rm -rf ~/.config/zsh/
fi

$DOTPATH/bin/link.sh $DOTPATH/configs/zsh/ ~/.config/
$DOTPATH/bin/link.sh $DOTPATH/configs/zsh/.zshenv ~/.zshenv

zsh -c "zinit self-update"

