### Steam Install Script Arch Linux

#!/bin/bash

echo "Please go to /etc/pacman.conf and enable"
echo "multilib packages if you have not done so."

# This updates your system
sudo pacman -Syyu

#This installs the liberation font set
sudo pacman -Syyu ttf-liberation

#This updates your system.
sudo pacman -Syyu

#This installs steam
sudo pacman -S steam
