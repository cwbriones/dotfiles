#!/bin/bash
set -euo pipefail
# IFS=$'\n\t'

# Run the plug install process
echo "Running +PlugUpdate neovim"
nvim +PlugUpdate +qall
echo "Running +PlugUpdate vim"
vim +PlugUpdate +qall

# Symlink for neovim ourselves
mkdir -p "$HOME/.config"
ln -sf "$vimdir/vim.symlink" "$HOME/.config/nvim"

# Create a virtualenv so that we don't have to install neovim everywhere.

NEOVIM_VENV="neovim"

if ! [[ -e "$VIRTUALENVWRAPPER_DIR/$NEOVIM_VENV/bin/python" ]]; then
    echo "Creating virtualenv for neovim."
    cd $VIRTUALENVWRAPPER_DIR
    virtualenv -p python3 $NEOVIM_VENV
    source $NEOVIM_VENV/bin/activate
    pip3 install neovim
    deactivate
    cd -
fi
