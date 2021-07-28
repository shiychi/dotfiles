DOTPATH=~/dotfiles

## Deno
DENO_INSTALL=$HOME/.deno

# Cargo
if [ -f $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi

# asdf
source /opt/asdf-vm/asdf.sh

mkdir -p /tmp/$USER-zsh-completions/
if hash rustup 2>/dev/null; then
    rustup completions zsh > /tmp/$USER-zsh-completions/_rustup
fi

fpath=(
    /tmp/$USER-zsh-completions/
    $fpath)

if hash rustc 2>/dev/null; then
    fpath=($(rustc --print sysroot)/share/zsh/site-functions $fpath)
fi

## Command alias
alias ls="exa"
alias cat="bat"
alias vi="nvim"
alias lg="lazygit"
alias g="git"
alias rustcheck="RUSTFLAGS='-D warnings' cargo clippy && cargo fmt --all -- --check && cargo test"
alias linesSource='cat $(fd . "./src/" --type f) | wc -l';

# Use vim keybind
bindkey -v

# Change default editor to Neovim
export EDITOR=nvim

# prompt
export PURE_PROMPT_SYMBOL='%%'

function nvim-fzf() {
  local src=$(fd --type f | fzf)
  if [ -n "$src" ]; then
    BUFFER="nvim '$src'"
    zle accept-line
  fi
  zle -R -c
}

function ghq-fzf() {
  local src=$(ghq list | fzf)
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}

zle -N nvim-fzf
zle -N ghq-fzf

bindkey '^g' ghq-fzf
bindkey 'nf' nvim-fzf

# direnv
eval "$(direnv hook zsh)"

autoload bashcompinit
bashcompinit

autoload -U compinit
compinit -u

autoload -Uz colors
colors

gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

source ~/.config/zsh/plugins.zsh
