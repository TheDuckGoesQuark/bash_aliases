#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -s "$SCRIPT_DIR"/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

ln -s "$SCRIPT_DIR"/.vimrc ~/.vimrc
ln -s "$SCRIPT_DIR"/.bash_aliases ~/.bash_aliases

