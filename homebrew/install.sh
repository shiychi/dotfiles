#!/bin/bash

if [ test -d $HOME/.linuxbrew ]; then
  :
else
  git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
  mkdir ~/.linuxbrew/bin
  ln -sfv ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
fi

if [ -f $HOME/.profile ]; then
  sed -e '$a export PATH="$HOME/.linuxbrew/bin:$PATH"' $HOME/.profile -i
else
  echo export PATH="$HOME/.linuxbrew/bin:$PATH" > $HOME/.profile
fi

export PATH="$HOME/.linuxbrew/bin:$PATH"

## Not WSL
shopt -s nocasematch
if [ ! "`uname -a | grep 'microsoft'`" ]; then
  brew install docker
  brew install docker-compose
fi

brew install git
brew install gcc
brew install curl
brew install bat
brew install exa
brew install fd
