#!/bin/bash  

clear

echo "Press any key to continue. Ctrl + C to cancel."  
read -n 1 -s -r # wait key press

# check yay
if command -v yay &> /dev/null; then  
    echo "Yay found! Installing packages"
else  
    echo "Yay not found. Installing yay"
    cd ~
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    echo "Yay installed! Installing packages"
fi  

yay -S hyprland kitty mpv qmmp qt5ct qt6ct kvantum-qt5 ttf-jetbrains-mono-nerd eog dracula-rofi-git zen-browser-bin rofi waybar thunar thunar-volman gvfs gvfs-mtp lxappearance nwg-look materia-gtk-theme papirus-icon-theme polkit-kde-agent sddm brightnessctl pavucontrol xdg-user-dirs hyprnotify fish kvantum kvantum qt5 kvantum-theme-materia bibata-cursor-theme-bin wlogout swaylock hyprshot playerctl pipewire pipewire-jack pipewire-alsa pipewire-audio pipewire-pulse wireplumber
cp -rf ~/hyprdots/config/* ~/.config
sudo systemctl enable sddm
xdg-user-dirs-update

echo "Installation finished. Please reboot your system."
