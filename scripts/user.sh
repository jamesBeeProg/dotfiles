pacman -S sudo

useradd -m -G wheel USERNAME
passwd USERNAME
export EDITOR=nano && visudo
logout

pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

sudo pacman -S zsh
chsh -s /bin/zsh
logout