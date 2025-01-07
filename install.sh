#!/bin/bash

REPO_URL="https://github.com/herschel21/tmux-configuration/archive/refs/heads/main.zip"
DOWNLOAD_DIR="temp_files/"
ZIP_FILE="$DOWNLOAD_DIR/main.zip"
BACKUP_DIR="$HOME/tmux_backup"
CONFIG_FILE="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"

# Print colorful messages
print_message() {
    echo -e "\e[1;34m$1\e[0m"
}

# Ensure the backup and download directories exist
mkdir -p "$BACKUP_DIR"
mkdir -p "$DOWNLOAD_DIR"

# Check system and install dependencies
print_message "Installing dependencies..."
if command -v apt-get &> /dev/null; then
    # For Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y tmux git curl
elif command -v pacman &> /dev/null; then
    # For Arch Linux
    sudo pacman -Syu
    sudo pacman -S --noconfirm tmux git curl
elif command -v dnf &> /dev/null; then
    # For Fedora
    sudo dnf install -y tmux git curl
elif command -v brew &> /dev/null; then
    # For macOS
    brew install tmux git curl
else
    print_message "Unsupported package manager. Please install tmux manually."
    exit 1
fi

# Backup existing tmux configuration if it exists
if [ -f "$CONFIG_FILE" ]; then
    print_message "Backing up existing tmux configuration..."
    mv "$CONFIG_FILE" "$BACKUP_DIR/tmux.conf.backup"
fi

# Download and install TPM if not already installed
if [ ! -d "$TPM_DIR" ]; then
    print_message "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Download configuration files
print_message "Downloading tmux configuration..."
curl -L "$REPO_URL" -o "$ZIP_FILE"

# Unzip and install configuration
print_message "Installing configuration files..."
unzip "$ZIP_FILE" -d "$DOWNLOAD_DIR"
cp "$DOWNLOAD_DIR/tmux-configuration-main/tmux.conf" "$CONFIG_FILE"

# Install plugins
print_message "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"

# Clean up downloaded files
print_message "Cleaning up..."
rm -rf "$DOWNLOAD_DIR" "$ZIP_FILE"

print_message "Installation complete! Please restart tmux or run: tmux source $CONFIG_FILE"

# Additional instructions
print_message "\nInstallation Notes:"
print_message "1. If you're inside tmux, press prefix + I to install plugins"
print_message "2. To start using the configuration, either:"
print_message "   - Start a new tmux session with: tmux"
print_message "   - Or reload your existing session with: tmux source $CONFIG_FILE"
print_message "\nEnjoy your new tmux configuration! 🚀"
