#!/bin/bash

# Search for fish and install if missing
FISH_SHELL=$(which fish)
if [ -z "$FISH_SHELL" ]; then
    echo "Fish is not installed. Installing fish..."
    pacman -S fish fastfetch --noconfirm
    FISH_SHELL=$(which fish)
    echo "Changing shell for current user"
    chsh -s $FISH_SHELL

    # Specify the file path for fish config
    FILE_PATH="$HOME/.config/fish/config.fish"
    if [ -z "$FILE_PATH" ]; then
        echo "Fish is not installed corectly or is corrupted"
        exit 1
    else
        echo "Installing fastfetch"
        # Use sed to insert a line after line 1
        sed -i '2a fastfetch' "$FILE_PATH"
    fi
    echo "Fish has been set as the default shell for the current user."
else
    echo "$FISH_SHELL"
    echo "Fish is already installed."
    exit 0
fi

# Add fish to the list of valid shells if not present
#echo $FISH_SHELL | tee -a /etc/shells
