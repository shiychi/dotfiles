#!/usr/bin/env fish

echo 'Installing Neovim...'
brew install nvim --HEAD
pip3 install pynvim

echo 'Installing dein...'
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
rm ./install.sh

echo 'Installing Neovim configs...'
if test -d ~/.config/nvim
  rm -r ~/.config/nvim
end
ln -s $DOTPATH/configs/nvim/ ~/.config/
