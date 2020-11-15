#! /bin/bash

cp -r ~/.cache/dein/repos/github.com/Shougo/dein.vim .
rm -rf ~/.cache/dein/repos/github.com/*
mkdir ~/.cache/dein/repos/github.com/Shougo/
mv dein.vim/ ~/.cache/dein/repos/github.com/Shougo/
