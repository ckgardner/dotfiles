# dotfiles

This project is a basic configuration of dotfiles that are helpful for starting any new environment.

## Setup Script (setup.sh)

The setup.sh script automates the setup of a new shell environment. Here's a brief overview of its functions:

1. Installs Oh My Zsh or updates it if already installed
2. Installs the following plugins or updates them if already installed

- `zsh-syntax-highlighting`
- `zsh-autosuggestions`

3. Copies .zshrc file: The script copies the .zshrc file from the dotfiles directory to the user's home directory, prompting for overwrite if necessary.
4. Installs Powerline fonts
5. Sources the .zshrc file: The script sources the .zshrc file to apply the changes to the current shell session.
6. Displays ASCII art: If all previous steps are successful, the script fetches and displays ASCII art from a specified URL.

## .zshrc

The .zshrc file is a configuration file for the Z shell. It contains configuration options for the shell such as aliases, functions, plugins, themes, and more.

### Oh My ZSH

[Oh My Zsh](https://ohmyz.sh/) is an open-source framework for managing Zsh configurations. It comes with a bunch of features out of the box and is a great way to get started with Zsh.

## .vimrc

The .vimrc file is a configuration file for Vim. It contains configuration options for the Vim editor such as syntax highlighting, line numbers, and more.

## Dev Setup

As an added bonus, I've added the `dev-setup.sh` script to install NodeJS through NVM.
