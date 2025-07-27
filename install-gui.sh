#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Update the package database
echo "Updating package database..."
if ! sudo pacman -Syu --noconfirm; then
    handle_error "Failed to update package database."
fi

# Install Xorg server and related utilities
echo "Installing Xorg server and related utilities..."
if ! sudo pacman -S --needed --noconfirm xorg-server xorg-apps xorg-xinit xorg-xrandr; then
    handle_error "Failed to install Xorg server and utilities."
fi

# Install input driver for libinput
echo "Installing libinput driver..."
if ! sudo pacman -S --needed --noconfirm xf86-input-libinput; then
    handle_error "Failed to install libinput driver."
fi

# Uncomment to install NVIDIA drivers and utilities
# echo "Installing NVIDIA drivers and utilities..."
# if ! sudo pacman -S --needed --noconfirm nvidia nvidia-utils nvidia-settings; then
#     handle_error "Failed to install NVIDIA drivers and utilities."
# fi

# Install Mesa for open-source graphics drivers
echo "Installing Mesa..."
if ! sudo pacman -S --needed --noconfirm mesa; then
    handle_error "Failed to install Mesa."
fi

# Install KDE Plasma desktop environment
echo "Installing KDE Plasma..."
if ! sudo pacman -S --needed --noconfirm plasma-meta; then
    handle_error "Failed to install KDE Plasma."
fi

# Install additional applications
echo "Installing additional applications..."
if ! sudo pacman -S --needed --noconfirm networkmanager network-manager-applet konsole dolphin ark kate plasma-nm chromium flatpak timeshift numlockx micro; then
    handle_error "Failed to install additional applications."
fi

# Install SDDM display manager
echo "Installing SDDM..."
if ! sudo pacman -S --needed --noconfirm sddm; then
    handle_error "Failed to install SDDM."
fi

# Enable and start SDDM service
echo "Enabling and starting SDDM service..."
if ! sudo systemctl enable sddm; then
    handle_error "Failed to enable SDDM service."
fi

if ! sudo systemctl start sddm; then
    handle_error "Failed to start SDDM service."
fi

echo "Setup complete."
