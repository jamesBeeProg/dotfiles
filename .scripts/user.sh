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

yay -S xdg-user-dirs
xdg-user-dirs-update

yay -S xorg-server xorg-xinit i3-gaps 
yay -S ttf-fira-code noto-fonts ttf-twemoji

yay -S rustup
rustup toolchain install stable beta nightly
yay -S alacritty google-chrome rofi visual-studio-code-bin starship feh maim xclip arandr

yay -S pulseaudio pulsemixer
pulseaudio --start
# note audio starts muted

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
