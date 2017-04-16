#!/bin/bash

# Make zsh the default shell
if [[ ! $(basename $SHELL) = 'zsh' && -e "/bin/zsh" ]]
then
    chsh -s /bin/zsh
fi

# Install prezto
if [ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]
then
    echo "Installing Prezto."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi
