# Arch Linux Setup Script

This repository contains a complete script to set up an Arch Linux system with **Hyprland**. It installs all essential tools, configurations, and programs to create a functional Linux desktop environment.

## Prerequisites

1. A freshly installed Arch Linux system.
2. Active internet connection.
3. Root access or a configured `sudo` user.

---

## Installation

### Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/arch-setup.git
   cd arch-setup
   ```

	2.	Make the main script executable:
      ```bash
      chmod +x main.sh
      ```

	3.	Run the setup script:
      ```bash
      ./main.sh
      ```

	4.	Reboot your system to apply all changes:
      ```bash
      sudo reboot
      ```
      


Common Issues
	•	Display Issues (NVIDIA):
Ensure you have installed the nvidia-dkms and egl-wayland packages. Check logs at:
```bash
~/.config/hypr/hyprland.log
```

	•	Missing Dependencies:
Run the following command to ensure all required packages are installed:
```bash
sudo pacman -S --needed base-devel git wget curl python python-pip
```


Logs

Hyprland logs can help diagnose issues:
```bash
cat ~/.config/hypr/hyprland.log
```

