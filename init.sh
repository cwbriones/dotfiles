#!/bin/bash

cd bundle/youcompleteme
./install.py
cd ../..

ln -s vimrc ../.vimrc
ln -s vimrc init.vim
