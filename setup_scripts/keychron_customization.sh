#!/bin/bash

# Enable keychron customization
sudo usermod -aG input $USER
sudo gnome-text-editor /etc/udev/rules.d/99-keychron.rules
# Write the following text inside (unomment first):
# KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="09a0", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
# Reload rules and trigger them
sudo udevadm control --reload-rules
sudo udevadm trigger
