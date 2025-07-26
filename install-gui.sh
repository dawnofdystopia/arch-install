#!/bin/bash

# Update the package database
echo "Updating package database..."
sudo pacman -Syu --noconfirm

# Install Xorg server and related utilities
echo "Installing Xorg server and related utilities..."
sudo pacman -S --needed --noconfirm xorg-server xorg-apps xorg-xinit xorg-xrandr

# Install input driver for libinput
echo "Installing libinput driver..."
sudo pacman -S --needed --noconfirm xf86-input-libinput

# Uncomment to install NVIDIA drivers and utilities
#echo "Installing NVIDIA drivers and utilities..."
#sudo pacman -S --needed --noconfirm nvidia nvidia-utils nvidia-settings

# Install Mesa for open-source graphics drivers
echo "Installing Mesa..."
sudo pacman -S --needed --noconfirm mesa

# Install KDE Plasma desktop environment
echo "Installing KDE Plasma..."
sudo pacman -S --needed --noconfirm plasma-meta

# Install additional applications
echo "Installing additional applications..."
sudo pacman -S --needed --noconfirm networkmanager network-manager-applet konsole dolphin ark kate plasma-nm chromium flatpak micro

# Install SDDM display manager
echo "Installing SDDM..."
sudo pacman -S --needed --noconfirm sddm

# Enable and start SDDM service
echo "Enabling and starting SDDM service..."
sudo systemctl enable sddm
sudo systemctl start sddm

echo "Setup complete."
