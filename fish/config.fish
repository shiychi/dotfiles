set DOTPATH = ~/dotfiles

## WSL
switch (pwd)
case '/mnt/c/Users/*'
  cd
end

## Environment variable
set -x GPG_TTY (tty)
set -x PATH $HOME/.linuxbrew/bin $PATH
set -x PATH /usr/local/opt/ruby/bin $PATH

## Prompt color
set pure_color_primary 60c79f
set pure_color_success 78d32e
set pure_color_warning d37e2e
set fish_color_command f5e751
set fish_color_host f5e751
set fish_color_param f5e751

## Command alias
alias ls='exa'
alias g='git'

## cd + ls
function cd
    builtin cd $argv; and ls
end
