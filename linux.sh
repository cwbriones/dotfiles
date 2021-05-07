#!/bin/bash
set -euo pipefail

if [ "$(uname)" != "Linux" ]; then
    echo "ERROR: script doesn't appear to be running on a linux system."
    echo "ERROR: sanity check failed."
    exit 1
fi

sudo apt-get --assume-yes install\
    fzf\
    neovim\
    python3-venv\
    ripgrep\
    tree
