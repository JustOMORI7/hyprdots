#!/bin/bash  

clear

echo "Press any key to continue. Ctrl + C to cancel."  
read -n 1 -s -r # wait key press

# check paru
if command -v paru &> /dev/null; then  
    echo "paru found! Installing packages..."
else  
    echo "paru not found. Installing paru..."
    cd ~
    git clone https://aur.archlinux.org/paru-bin.git
    cd paru-bin
    makepkg -si
    echo "paru installed! Installing packages..."
fi  

paru -S --noconfirm hyprland fastfetch kitty mpv swaybg grim slup bluez bluez-utils blueman qt6ct kvantum-qt5 ttf-jetbrains-mono-nerd eog dracula-rofi-git floorp-bin rofi waybar thunar thunar-volman gvfs gvfs-mtp lxappearance nwg-look materia-gtk-theme papirus-icon-theme polkit-kde-agent sddm brightnessctl pavucontrol xdg-user-dirs hyprnotify fish kvantum kvantum-theme-materia bibata-cursor-theme-bin wlogout swaylock hyprshot playerctl pipewire pipewire-jack pipewire-alsa pipewire-audio pipewire-pulse wireplumber ttf-cascadia-mono-nerd

echo "Copying configuration files..."

rm -rf ~/.config/kitty ~/.config/hypr ~/.config/gtk-2.0 ~/.config/gtk-3.0 ~/.config/Kvantum ~/.config/nwg-look ~/.config/waybar ~/.config/qt6ct ~/.config/rofi ~/.config/fastfetch
cp -rf ~/hyprdots/config/* ~/.config

mkdir -p ~/.local/share/rofi/themes
mv ~/.config/squared-nord.rasi ~/.local/share/rofi/themes/squared-nord.rasi

sudo systemctl enable sddm
sudo systemctl enable bluetooth
xdg-user-dirs-update

mkdir -p ~/Pictures/Wallpapers
cp ~/hyprdots/assets/wallpaper-1.jpg ~/Pictures/Wallpapers/

rm -rf ~/paru-bin

echo "Installation finished. Please reboot your system."
