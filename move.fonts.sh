#! /bin/bash

# git clone folder.
FROM="~/system.fonts/fonts"  # Change this depending on where you did the git clone
# Most common fonts folder to use.
TO="~/.local/share/fonts"

# Moving the fonts
sudo mv $FROM/* $TO
