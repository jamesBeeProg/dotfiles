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

git clone --bare https://github.com/jamesBeeProg/dotfiles.git $HOME/.dotfiles
logout

dotfiles config --local status.showUntrackedFiles no

yay -S xorg-server xorg-xinit i3-gaps ttf-fira-code

yay -S rustup
rustup toolchain install stable beta nightly
yay -S alacritty google-chrome dmenu visual-studio-code-bin

