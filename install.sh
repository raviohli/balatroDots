#/bin/bash

# Install dependencies

sudo pacman -S --needed waybar hyprland blueman btop ffmpeg grim slurp gamemode mpv nano fastfetch \
pavucontrol jq sddm wofi zsh openrgb wget glfw stb glew

# This will be well commented for your reading pleasure (and mine)

# Installing fonts
echo "Installing font - Cozette\n"
wget https://github.com/the-moonwitch/Cozette/releases/download/v.1.29.0/cozette.bdf 
echo "Installing font - Gohu Nerd Font\n"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Gohu.zip
echo "\n Unzipping font Gohu"
unzip Gohu.zip -d tempGohu

 -d "~/.local/share/fonts" ] && echo "~/.local/share/fonts exists" || sudo mkdir -p ~/.local/share/fonts
# Test if /usr/share/fonts/TTF exists, create if not
[ -d "/usr/share/fonts/TTF" ] && echo "/usr/share/fonts/TTF exists" || sudo mkdir -p /usr/share/fonts/TTF 
# Ask for root to install nerd font in proper directory
sudo cp tempGohu/Gohu* /usr/share/fonts/TTF

# Clean temp font directory
rm -rf gohuFont
# Remake font cache
fc-cache -fv

# Install dependencies



# Move things that need to be moved to where they need to be moved
mv .scripts ~/.scripts
cp -R .config ~/.config
