#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing fish...'

brew install fish

echo 'Installing fisher...'

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fish -c $"fisher add starship/starship"
fish -c $"fisher add decors/fish-ghq"
fish -c $"fisher add jethrokuan/fzf"
fish -c $"fisher add jethrokuan/z"

if [ -f ~/.config/fish/config.fish ]; then
  rm ~/.config/fish/config.fish
fi

ln -s $DOTPATH/configs/fish/config.fish ~/.config/fish/config.fish
