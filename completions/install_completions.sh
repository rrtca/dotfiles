#!/bin/bash

# Script to install shell completions

# Create necessary directories
mkdir -p ~/.config/fish/completions
mkdir -p ~/.bash_completion.d

# Install fish completions
echo "Installing fish completions..."
cp fish/* ~/.config/fish/completions/

# Install bash completions
echo "Installing bash completions..."
cp bash/* ~/.bash_completion.d/

# Add bash completion sourcing to bashrc if not already present
if ! grep -q "source ~/.bash_completion.d/\*" ~/.bashrc; then
    echo "# Source custom completions" >> ~/.bashrc
    echo "for f in ~/.bash_completion.d/*; do source \$f; done" >> ~/.bashrc
    echo "Added bash completion sourcing to ~/.bashrc"
fi

echo "Completions installed successfully!"
echo "Please restart your shell or source your rc files to enable the new completions." 