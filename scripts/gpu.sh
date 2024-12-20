#!/bin/bash

# GPU Detection and Driver Installation

echo "Detecting your GPU..."
GPU=$(lspci | grep -E "VGA|3D" | awk '{print $5}' | head -n 1)

if echo "$GPU" | grep -qi "nvidia"; then
  echo "NVIDIA GPU detected. Installing NVIDIA drivers..."
  sudo pacman -S --needed --noconfirm nvidia-dkms nvidia-utils egl-wayland

  # Configure NVIDIA for Wayland
  echo "Configuring NVIDIA for Wayland..."
  sudo bash -c 'echo "__GLX_VENDOR_LIBRARY_NAME=nvidia" >> /etc/environment'
  sudo bash -c 'echo "WLR_NO_HARDWARE_CURSORS=1" >> /etc/environment'

  # Enable NVIDIA DRM
  echo "Enabling NVIDIA DRM..."
  sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& nvidia-drm.modeset=1/' /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg

  # Add NVIDIA modules to initramfs
  sudo sed -i 's/^MODULES=.*/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
  sudo mkinitcpio -P

  echo "NVIDIA driver setup complete. Please reboot your system after the installation."

elif echo "$GPU" | grep -qi "AMD"; then
  echo "AMD GPU detected. Installing AMD drivers..."
  sudo pacman -S --needed --noconfirm mesa vulkan-radeon libva-mesa-driver mesa-vdpau

  echo "AMD driver setup complete. No additional configuration required."

elif echo "$GPU" | grep -qi "Intel"; then
  echo "Intel GPU detected. Installing Intel drivers..."
  sudo pacman -S --needed --noconfirm mesa vulkan-intel libva-mesa-driver mesa-vdpau

  echo "Intel driver setup complete. No additional configuration required."

else
  echo "No supported GPU detected, or the GPU is not recognized."
  echo "Please ensure that your system has a compatible GPU."
fi
