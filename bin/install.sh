#!/bin/bash

DOTPATH=~/dotfiles
DOTURL=https://github.com/mtiyz/dotfiles.git

if type "apt" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    :
  else
    apt install sudo -y
  fi
  sudo apt install build-essential curl file git -y
fi

if type "yum" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    :
  else
    yum install sudo -y
  fi
  sudo yum groupinstall 'Development Tools' -y
  sudo yum install curl git m4 ruby bzip2-devel curl-devel expat-devel ncurses-devel zlib-devel openssl-devel which -y
  sudo yum install texinfo -y
  sudo yum install libxcrypt-compat -y
  sudo yum install util-linux-user -y
  sudo yum install perl-ExtUtils-MakeMaker -y
fi

if type "pacman" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    :
  else
    pacman -Sy --noconfirm
    pacman -S sudo --noconfirm
  fi
  sudo pacman -Sy --noconfirm
  sudo pacman -S curl --noconfirm
  sudo pacman -S file --noconfirm
  sudo pacman -S git --noconfirm
  sudo pacman -S gcc --noconfirm
  sudo pacman -S glibc --noconfirm
  sudo pacman -S make --noconfirm
  sudo pacman -S which --noconfirm
fi

if type "git" > /dev/null 2>&1; then
  if [ -d $DOTPATH ]; then
    cd $DOTPATH && git pull
  else
    git clone $DOTURL $DOTPATH
  fi
else
  echo "Require git"
  exit 1
fi

cd $DOTPATH
/bin/bash ./homebrew/install.sh
/bin/bash ./fish/install.sh
$HOME/.linuxbrew/bin/fish
