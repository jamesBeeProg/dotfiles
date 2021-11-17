parted /dev/sda
mklabel gpt
mkpart ESP fat32 1MiB 513MiB
set 1 boot on
mkpart primary ext4 513MiB 100%
quit

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt base linux linux-firmware networkmanager grub efibootmgr intel-ucode

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

echo cpwdtoast > /etc/hostname

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

passwd

exit
reboot

systemctl enable NetworkManager.service
systemctl start NetworkManager.service

pacman -S nano
nano /etc/locale.gen
en_US.UTF-8 UTF-8
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc --utc
