#!/bin/bash

# Update the package database
echo "Updating package database..."
sudo pacman -Syu

# Install Xorg server and related utilities
echo "Installing Xorg server and related utilities..."
sudo pacman -S --needed xorg-server xorg-apps xorg-xinit xorg-xrandr

# Install input driver for libinput
echo "Installing libinput driver..."
sudo pacman -S --needed xf86-input-libinput

# Install NVIDIA drivers and utilities
echo "Installing NVIDIA drivers and utilities..."
sudo pacman -S --needed nvidia nvidia-utils nvidia-settings

# Install Mesa for open-source graphics drivers
echo "Installing Mesa..."
sudo pacman -S --needed mesa

# Install KDE Plasma desktop environment
echo "Installing KDE Plasma..."
sudo pacman -S --needed plasma-meta

# Install additional applications
echo "Installing additional applications..."
sudo pacman -S --needed networkmanager konsole dolphin ark kate plasma-nm chromium flatpak micro

# Install SDDM display manager
echo "Installing SDDM..."
sudo pacman -S --needed sddm

# Enable and start SDDM service
echo "Enabling and starting SDDM service..."
sudo systemctl enable sddm
sudo systemctl start sddm

echo "Setup complete."
