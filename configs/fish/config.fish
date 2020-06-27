set DOTPATH ~/dotfiles

## WSL
switch (pwd)
case "/mnt/c/Users/*"
  cd
end

## Deno
set DENO_INSTALL $HOME/.deno

## Environment variable
set -x GPG_TTY (tty)
set -x PATH $HOME/.linuxbrew/bin $PATH
set -x PATH $HOME/.linuxbrew/sbin $PATH
set -x PATH /usr/local/opt/ruby/bin $PATH
set -x PATH $DENO_INSTALL/bin $PATH

source $HOME/.cargo/env

## Prompt color
set red c47081
set pure_color_primary eb36eb
set pure_color_success 36cdeb
set pure_color_warning d37e2e
set fish_color_command ababab
set fish_color_param ababab
set fish_color_error c47081

# Dot command
alias dot="$DOTPATH/app/dot.fish"

## Command alias
alias ls="exa"
alias g="git"

# Starship
starship init fish | source
