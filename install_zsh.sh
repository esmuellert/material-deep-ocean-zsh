#!/bin/bash

# Check if script is run with root privileges
if [ "$(id -u)" -eq 0 ]; then
    echo "Please run this script as a regular user, not as root"
    exit 1
fi

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install required packages
install_requirements() {
    echo "Installing required packages..."
    if command_exists apt-get; then
        sudo apt-get update
        sudo apt-get install -y zsh curl wget git
    elif command_exists yum; then
        sudo yum update
        sudo yum install -y zsh curl wget git
    elif command_exists pacman; then
        sudo pacman -Syu
        sudo pacman -S --noconfirm zsh curl wget git
    else
        echo "Could not find package manager. Please install zsh, curl, wget, and git manually."
        exit 1
    fi
}

# Check for zsh
if ! command_exists zsh; then
    echo "Zsh is not installed. Installing now..."
    install_requirements
fi

# Backup existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Backing up existing .zshrc..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
echo "Installing plugins..."

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}/plugins/zsh-autosuggestions"
fi

# Download theme and configuration
echo "Downloading theme and configuration..."
wget https://raw.githubusercontent.com/esmuellert/material-deep-ocean-zsh/main/.zshrc -O "$HOME/.zshrc"
wget https://github.com/esmuellert/material-deep-ocean-zsh/raw/main/material_deep_ocean.zsh-theme -O "${ZSH_CUSTOM}/themes/material_deep_ocean.zsh-theme"

# Set zsh as default shell if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Attempting to change default shell to zsh..."
    if chsh -s "$(which zsh)"; then
        echo "Successfully changed default shell to zsh"
    else
        echo "Failed to change shell automatically. Please run the following command manually:"
        echo "    sudo chsh -s $(which zsh) $USER"
        echo "You may be prompted for your password."
    fi
fi

echo "Installation completed successfully!"
echo "If you had to change your shell manually, please log out and log back in for the changes to take effect."
