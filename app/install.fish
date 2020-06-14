#!/usr/bin/env fish

switch $argv[1]
case "git-credential-helper"
  $DOTPATH/git-credential-helper/install.fish
case "node"
  $DOTPATH/node/install.fish
case "rust"
  $DOTPATH/rust/install.fish
case "deno"
  $DOTPATH/deno/install.fish
case "nvim"
  $DOTPATH/nvim/install.fish
end
