#!/usr/bin/env bash
# Bootstrap script for systems that have not yet installed fish.
#
# This should do the minimal amount of work to allow us to then
# place our setup in bootstrap.fish.
#
set -euo pipefail

echo "First things first - configuring macOS"
# bash "$(dirname $0)/mac.sh"
echo "✓ macOS is configured."

if test ! $(which brew); then
  echo "Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "✓ brew is installed."

if test ! $(which fish); then
  echo "Installing fish for you."
  brew update
  brew install fish
fi
echo "✓ Fish is installed."

exec fish "$(dirname $0)/bootstrap.fish"
