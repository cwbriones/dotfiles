#!/usr/bin/env fish

if test -e "~/.vim/autoload/plug.vim"
    echo "plug.vim not found, downloading."
    curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
end

# Run the plug install process
echo "Running +PlugUpdate neovim"
nvim +PlugUpdate +qall
echo "Running +PlugUpdate vim"
vim +PlugUpdate +qall

# Symlink for neovim ourselves
mkdir -p "$HOME/.config"
ln -sf "$vimdir/vim.symlink" "$HOME/.config/nvim"

# Create a virtualenv so that we don't have to install neovim everywhere.

# FIXME: virtualenv needs to be installed.
# set NEOVIM_VENV "neovim"
# if not test -e "$VIRTUALENVWRAPPER_DIR/$NEOVIM_VENV/bin/python"
#     echo "Creating virtualenv for neovim."
#     cd $VIRTUALENVWRAPPER_DIR
#     virtualenv -p python3 $NEOVIM_VENV
#     source $NEOVIM_VENV/bin/activate.fish
#     pip3 install neovim
#     deactivate
#     cd -
# end
