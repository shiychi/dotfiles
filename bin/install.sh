#!/bin/bash

function choise {
  while true; do
    echo -n "$1 [Y/n]: "
    read ANS
    case $ANS in
      [Yy]*)
        return 0;;
      [Nn]*)
        return 1;;
      *)
        ;;
    esac
  done
}

if choise "Do you want to start install"; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Quit" && exit 0
fi
