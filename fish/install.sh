#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

brew install fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

`which fish` fisher add rafaelrinaldi/pure

rm ~/.config/fish/config.fish
cat $DOTPATH/fish/config.fish > ~/.config/fish/config.fish

## RHEL
if type "yum" > /dev/null 2>&1; then
  echo `which fish` | sudo tee -a /etc/shells
fi

sudo chsh -s `which fish`
