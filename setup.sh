#!/bin/bash

set -e  # Exit script if any command fails

# Check if Oh My Zsh is already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # Install Oh My Zsh if not installed
  echo "Installing 'Oh My Zsh'"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "'Oh My Zsh' is already installed"
fi

# Update 'zsh-syntax-highlighting' plugin
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "Updating zsh-syntax-highlighting..."
  cd "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" || exit
  git pull
else
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi

# Update 'zsh-autosuggestions' plugin
if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo "Updating zsh-autosuggestions..."
  cd "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" || exit
  git pull
else
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

# Copy .zshrc from dotfiles to the user's home directory
if [ -f "$HOME/dotfiles/dotfiles/.zshrc" ]; then
  if [ -f "$HOME/.zshrc" ]; then
    printf "The file .zshrc already exists in your home directory. Do you want to overwrite it? (y/n) "
    read -k 1 -r
    echo    # move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      exit 1
    fi
  fi
  echo "Copying .zshrc to home directory..."
  cp "$HOME/dotfiles/dotfiles/.zshrc" "$HOME/.zshrc"
else
  echo "dotfiles/.zshrc does not exist. Make sure the dotfiles repo is cloned in the $HOME directory"
  echo "Current working directory: $(pwd)"
fi

# Install Powerline fonts
if [ ! -d "$HOME/fonts" ]; then
  echo "Installing Powerline fonts..."
  git clone https://github.com/powerline/fonts.git --depth=1 "$HOME/fonts"
  "$HOME/fonts/install.sh"
  rm -rf "$HOME/fonts"
else
  echo "Powerline fonts are already installed"
fi

# Source the .zshrc file to apply the changes to the current session
source "$HOME/.zshrc"

# Function to fetch and display ASCII art
display_ascii_art() {
  clear

  # URL of the ASCII art
  ascii_art_url="http://artscene.textfiles.com/vt100/shuttle.vt"

  # Fetch ASCII art content using curl
  ascii_art=$(curl -s "$ascii_art_url")

  # Display the fetched ASCII art with a delay using sleep
  while IFS= read -r line; do
    echo "$line"
    sleep 0.005 # Adjust the sleep duration to control the animation speed
  done <<< "$ascii_art"

  echo "Remember to set the font of your terminal to a Powerline font"
}

# Display the ASCII art if successful
display_ascii_art