#!/usr/bin/bash

echo 'Updating dotfiles...'

builtin cd $DOTPATH
git pull
bash $DOTPATH/bin/install.sh

if type "apt" > /dev/null 2>&1; then
  echo 'Upgrading APT...'
  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
fi

if type "yum" > /dev/null 2>&1; then
  echo 'Upgrading YUM...'
  sudo yum update -y
  sudo yum upgrade -y
  sudo yum autoremove -y
fi

if type "pacman" > /dev/null 2>&1; then
  echo 'Upgrading Pacman...'
  sudo pacman -Syyu
  yay -Syyu
fi

echo 'Upgrading Homebrew...'

brew upgrade

