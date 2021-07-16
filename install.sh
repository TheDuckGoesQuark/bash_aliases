#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Symlink configuration files
ln -s "$SCRIPT_DIR"/.gitignore ~/.gitignore
ln -s "$SCRIPT_DIR"/.vimrc ~/.vimrc
ln -s "$SCRIPT_DIR"/.bash_aliases ~/.bash_aliases
ln -s "$SCRIPT_DIR"/.bash_aliases ~/.bash_aliases

# Configure git
git config --global core.excludesfile ~/.gitignore
git config --global user.name "Jordan Mackie"
git config --global user.email "jordan@gravitysketch.com"
