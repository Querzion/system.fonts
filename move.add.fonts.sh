#!/bin/bash

# Change to the full path
FOLDER="$HOME/system.fonts"
# path to fonts
FROM="$FOLDER/fonts"  
# Most common fonts folder to use.
TO="$HOME/.local/share/fonts"

# Check if the FROM directory exists
if [ ! -d "$FROM" ]; then
    echo "Source directory $FROM does not exist."
    exit 1
fi

moveFonts() {
    # Ensure the target directory exists
    mkdir -p "$TO"

    # Moving the fonts
    mv "$FROM"/* "$TO"
}

indexFonts() {

}

getNerdFonts() {
    # Clone the entire repository
    git clone https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts

    # Copy the necessary fonts from the cloned repository
    cp -r /tmp/nerd-fonts/patched-fonts/* "$TO"

    # Clean up
    rm -rf /tmp/nerd-fonts

    # Refresh the font cache
    fc-cache -fv
}

moveFonts
#getNerdFonts

# Check if the directory exists
if [ -d "$FOLDER" ]; then
    # Remove the directory and its contents
    rm -r "$FOLDER"
    echo "Directory $FOLDER and its contents have been removed."
else
    echo "Directory $FOLDER does not exist."
fi
