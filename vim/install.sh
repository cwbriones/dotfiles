#!/bin/bash
set -euo pipefail
# IFS=$'\n\t'

# Run the plug install process
echo "Running +PlugUpdate"
vim +PlugUpdate +qall

# Install YouCompleteMe
vimdir="$(dirname "$0")"
ycmdir="$vimdir/vim.symlink/bundle/YouCompleteMe"

# Symlink for neovim ourselves
mkdir -p "$HOME/.config"
ln -sf "$vimdir/vim.symlink" "$HOME/.config/nvim"

# FIXME:
# 1. Install fzf
# 2. Update deoplete and install for vi
# 3. Install neovim in a virtualenv
