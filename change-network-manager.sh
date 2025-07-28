#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Disable iwd
echo "Disabling iwd..."
if ! sudo systemctl disable iwd; then
    handle_error "Failed to disable iwd."
fi

# Disable systemd-resolved
echo "Disabling systemd-resolved..."
if ! sudo systemctl disable systemd-resolved; then
    handle_error "Failed to disable systemd-resolved."
fi

# Disable systemd-networkd
echo "Disabling systemd-networkd..."
if ! sudo systemctl disable systemd-networkd; then
    handle_error "Failed to disable systemd-networkd."
fi

# Enable NetworkManager
echo "Enabling NetworkManager..."
if ! sudo systemctl enable NetworkManager; then
    handle_error "Failed to enable NetworkManager."
fi

# Start NetworkManager immediately
echo "Starting NetworkManager..."
if ! sudo systemctl start --now NetworkManager; then
    handle_error "Failed to start NetworkManager."
fi

echo "Network configuration updated."

# add /etc/NetworkManager/conf.d/wifi-powersave.conf and write in it:
# [connection]
# wifi.powersave=2
