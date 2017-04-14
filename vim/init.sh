#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "$0")/.."
pwd -P

# ln -s vimrc ../.vimrc
# ln -s vimrc init.vim
#
# ln -s $(pwd) ~/.vim
# mkdir -p ~/.config
# ln -s $(pwd) ~/.config/neovim
#
# vim +PlugUpdate +qall
#
# cd bundle/YouCompleteMe
# ./install.py --tern-completer --racer-completer --gocode-completer --clang-completer
# cd ../..
