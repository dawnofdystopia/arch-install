#!/bin/bash

# Disable systemd-resolved
sudo systemctl disable systemd-resolved

# Disable systemd-networkd
sudo systemctl disable systemd-networkd

# Enable NetworkManager
sudo systemctl enable NetworkManager

# Start NetworkManager immediately
sudo systemctl start --now NetworkManager

echo "Network configuration updated."
