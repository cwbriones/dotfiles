#!/usr/bin/env fish

if not test -e "~/.config/nvim/autoload/plug.vim"
    echo "plug.vim not found, downloading."
    curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

# Run the plug install process
echo "Running +PlugUpdate neovim"
nvim +PlugUpdate +qall
echo "Running +PlugUpdate vim"
vim +PlugUpdate +qall

# Symlink neovim configs to vim locations
safelink $HOME/.config/nvim/init.vim $HOME/.vimrc
safelink $HOME/.config/nvim $HOME/.vim

# Create a virtualenv so that we don't have to install neovim everywhere.
set -q neovim_venv || set neovim_venv "neovim"
if not test -e "$virtualenv_wrapper_dir/$neovim_venv/bin/python"
    echo "Creating virtualenv for neovim."
    cd $virtualenv_wrapper_dir
    python3 -m venv $neovim_venv
    source $neovim_venv/bin/activate.fish
    pip3 install neovim
    deactivate
    cd -
end
