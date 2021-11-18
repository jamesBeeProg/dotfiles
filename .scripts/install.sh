# Partiton the disk
parted /dev/sda
mklabel gpt
mkpart ESP fat32 1MiB 513MiB
set 1 boot on
mkpart primary ext4 513MiB 100%
quit

# Format the parititons
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2


# Mount them
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# Install base and kernal packages
pacstrap /mnt base linux linux-firmware  

# Save mount layout
genfstab -U /mnt >> /mnt/etc/fstab

# Change into the computer
arch-chroot /mnt

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
pacman -S nano
nano /etc/locale.gen
en_US.UTF-8 UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Setup time
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc

# Set root password
passwd

# Exit and reboot
exit
reboot

