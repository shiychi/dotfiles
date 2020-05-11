#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing fish...'

brew install fish

echo 'Installing fisher...'

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fish -c $"fisher add rafaelrinaldi/pure"

if [ -f ~/.config/fish/config.fish ]; then
  rm ~/.config/fish/config.fish
fi

cat $DOTPATH/fish/config.fish > ~/.config/fish/config.fish

sudo bash -c "echo `which fish` | sudo tee -a /etc/shells"

if [ ! $SHELL = $(which fish) ]; then
  echo "You need to change the default shell to $(which fish)"
fi
