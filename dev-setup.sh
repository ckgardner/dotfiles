#!/bin/bash

set -e  # Exit script if any command fails

# Check if Node.js is already installed
if ! command -v node &> /dev/null; then
  # Check if NVM is installed
  if ! command -v nvm &> /dev/null; then
    # Install NVM if not installed
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
    # Source NVM to use it immediately
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi

  # Install the latest LTS version of Node.js
  echo "Installing the latest LTS version of Node.js..."
  nvm install --lts
else
  echo "Node.js is already installed"
fi

# Success message
echo "You now have the best development environment ever!"

