#!/bin/bash

# Set hostname
echo cpwdtoast > /etc/hostname

# Setup boot loader
pacman -S grub efibootmgr intel-ucode
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

# Setup network
pacman -S networkmanager
systemctl enable NetworkManager.service

# Setup locale
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Setup time
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc

# Setup sudo
passwd -d root
echo 'ALL ALL=(ALL:ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo

# Clean up
rm /step2.sh
exit
