#!/bin/bash

git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
mkdir ~/.linuxbrew/bin
ln -sfv ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin

if [ -f $HOME/.profile ]; then
  sed -e '$a export PATH="$HOME/.linuxbrew/bin:$PATH"' $HOME/.profile -i
else
  echo export PATH="$HOME/.linuxbrew/bin:$PATH" > $HOME/.profile
fi

export PATH="$HOME/.linuxbrew/bin:$PATH"

brew install git
brew install gcc
brew install sudo
brew install curl
brew install bat
brew install exa
