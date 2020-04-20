#!/bin/bash

DOTPATH=~/dotfiles/
DOTURL=https://github.com/mtiyz/dotfiles.git

if type "apt" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    apt install sudo
  fi
  sudo apt install build-essential curl file git
fi

if type "yum" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    yum install sudo
  fi
  sudo yum groupinstall 'Development Tools'
  sudo yum install curl file git
  sudo yum install libxcrypt-compat
fi

if type "apk" > /dev/null 2>&1; then
  if type "sudo" > /dev/null 2>&1; then
    apk add sudo
  fi
  sudo apk add bash build-base curl file git gzip libc6-compat ncurses ruby ruby-dbm ruby-etc ruby-irb ruby-json
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
/bin/bash ./node/install.sh
