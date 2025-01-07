#!/bin/bash

echo "Uninstalling tmux configuration..."

# Restore backup if it exists
if [ -f ~/.tmux.conf.backup ]; then
    echo "Restoring backup configuration..."
    mv ~/.tmux.conf.backup ~/.tmux.conf
else
    echo "Removing tmux configuration..."
    rm -f ~/.tmux.conf
fi

# Remove TPM and plugins
if [ -d ~/.tmux/plugins ]; then
    echo "Removing tmux plugins..."
    rm -rf ~/.tmux/plugins
fi

echo "Uninstallation complete!"
