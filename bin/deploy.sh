#!/bin/bash
DOTPATH=~/dotfiles

function link_file () {
  if [ -f $2 ]; then
    rm -f $2
    echo -e "\e[31mError: There is a file with the same name ($2)\e[0m"
  fi

  ln -sf $1 $2
}

link_file $DOTPATH/.gitconfig ~/.gitconfig
link_file $DOTPATH/.gitignore_global ~/.gitignore_global
link_file $DOTPATH/.config/zsh/.zshenv ~/.zshenv
