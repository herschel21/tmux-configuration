#!/bin/bash

# install.sh
set -e

echo "Installing tmux configuration..."

# Check if tmux is installed
if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux is not installed. Installing tmux..."
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y tmux
    elif command -v brew >/dev/null 2>&1; then
        brew install tmux
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y tmux
    else
        echo "Error: Package manager not supported. Please install tmux manually."
        exit 1
    fi
fi

# Create backup of existing tmux configuration
if [ -f ~/.tmux.conf ]; then
    echo "Backing up existing tmux configuration..."
    mv ~/.tmux.conf ~/.tmux.conf.backup
fi

# Install TPM if not already installed
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    echo "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Copy tmux configuration
echo "Copying tmux configuration..."
cp .tmux.conf ~/.tmux.conf

# Install plugins
echo "Installing tmux plugins..."
~/.tmux/plugins/tpm/bin/install_plugins

echo "Installation complete! Please restart tmux or source the configuration with 'tmux source ~/.tmux.conf'"
