#!/bin/bash

DOTPATH=~/dotfiles

export PATH="$HOME/.linuxbrew/bin:$PATH"

echo 'Installing tmux'
brew install tmux

echo 'Installing tpm'
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo 'Installing tmux config...'
/bin/bash $DOTPATH/bin/link.sh $DOTPATH/.config/tmux/.tmux.conf ~/.tmux.conf

if ! sudo grep zsh /etc/shells; then
  sudo bash -c "echo `which zsh` | sudo tee -a /etc/shells"
fi

if [ ! "$SHELL" = $(which zsh) ]; then
  echo "You need to change the default shell to $(which zsh)"
fi

/bin/bash $DOTPATH/bin/link.sh $DOTPATH/.config/tmux/.tmux.session.conf ~/.tmux.session.conf
