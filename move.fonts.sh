#!/bin/bash

# Full path to the git clone folder.
FROM="$HOME/system.fonts/fonts"  # Change to the full path
# Most common fonts folder to use.
TO="$HOME/.local/share/fonts"

# Check if the FROM directory exists
if [ ! -d "$FROM" ]; then
    echo "Source directory $FROM does not exist."
    exit 1
fi

# Ensure the target directory exists
mkdir -p "$TO"

# Moving the fonts
mv "$FROM"/* "$TO"

# Clone the entire repository
git clone https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts

# Copy the necessary fonts from the cloned repository
cp -r /tmp/nerd-fonts/patched-fonts/* "$TO"

# Clean up
rm -rf /tmp/nerd-fonts

# Refresh the font cache
fc-cache -fv


