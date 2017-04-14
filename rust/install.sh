#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if test ! $(which rustup)
then
    echo " Installing rustup for you."
    sh "$(curl -fsSL https://sh.rustup.rs)"
else
    echo " Updating rustup for you."
    rustup self update
fi

echo " Updating rust toolchains"
rustup update stable
rustup update nightly

# Update completion
rustup completions zsh > $(dirname $0)/_rustup
