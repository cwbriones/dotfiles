#!/bin/bash

cd bundle/YouCompleteMe
./install.py --tern-completer --racer-completer --gocode-completer --clang-completer
cd ../..

ln -s vimrc ../.vimrc
ln -s vimrc init.vim

ln -s $(pwd) ~/.vim
mkdir -p ~/.config
ln -s $(pwd) ~/.config/neovim
