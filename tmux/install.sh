#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing tmux'
brew install tmux

echo 'Installing tmux configs...'
if [ -f ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
ln -s $DOTPATH/configs/tmux/.tmux.conf ~/.tmux.conf

sudo bash -c "echo `which tmux` | sudo tee -a /etc/shells"

if [ ! $SHELL = $(which tmux) ]; then
  echo "You need to change the default shell to $(which tmux)"
fi

if [ -f ~/.tmux.session.conf ]; then
  rm ~/.tmux.session.conf
fi
ln -s $DOTPATH/configs/tmux/.tmux.session.conf ~/.tmux.session.conf
