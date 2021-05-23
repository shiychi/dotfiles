#!/bin/bash

DOTPATH=~/dotfiles
DOTURL='https://github.com/shiychi/dotfiles'

function install_pkg () {
  paru -S $1 --noconfirm
}

paru -Syy
install_pkg asdf-vm
install_pkg clang
install_pkg curl
install_pkg direnv
install_pkg dunst
install_pkg exa
install_pkg file
install_pkg fzf
install_pkg ghq
install_pkg git
install_pkg htop
install_pkg make
install_pkg mpv
install_pkg neofetch
install_pkg nvim
install_pkg python-pip
install_pkg ranger
install_pkg sudo
install_pkg tig
install_pkg unzip
install_pkg which
install_pkg zsh

if type "git" > /dev/null 2>&1; then
  if [ -d $DOTPATH ]; then
    cd $DOTPATH && git pull
  else
    git clone $DOTURL $DOTPATH
  fi
else
  echo -e "\e[31mError: require git\e[0m"
  exit 1
fi

$DOTPATH/bin/deploy.sh

# zsh
echo "Setup zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
zsh -c "zinit self-update"
zsh -c "fast-theme -t clean"
