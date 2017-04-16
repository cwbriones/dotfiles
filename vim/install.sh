#!/bin/bash
set -euo pipefail
# IFS=$'\n\t'

# Run the plug install process
vim +PlugUpdate +qall

# Install YouCompleteMe
vimdir="$(dirname "$0")"
ycmdir="$vimdir/vim.symlink/bundle/YouCompleteMe"

# Symlink for neovim ourselves
mkdir -p "$HOME/.config"
ln -sf "$vimdir/vim.symlink" "$HOME/.config/nvim"

echo "Installing YouCompleteMe"
/usr/bin/env python $ycmdir/install.py \
    --tern-completer \
    --racer-completer \
    --gocode-completer \
    --clang-completer
