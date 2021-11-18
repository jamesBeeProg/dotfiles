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

pacstrap /mnt base linux linux-firmware networkmanager grub efibootmgr intel-ucode && echo done > /dev/tty2

genfstab -U /mnt >> /mnt/etc/fstab; arch-chroot /mnt bash -c '
    passwd -d root; 
    grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
    grub-mkconfig -o /boot/grub/grub.cfg; 
    exit'; 
    reboot
