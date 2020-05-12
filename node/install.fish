#!/usr/bin/env fish

echo 'Installing Node.js(n package)...'

brew install n
sudo n latest

echo 'Installing Yarn...'
sudo npm i -g yarn
