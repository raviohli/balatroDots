
# balatroDots
![screenshot_2025-06-13_22-24-55](https://github.com/user-attachments/assets/e637aa57-0a31-4c33-8602-0049b9129964)
![screenshot_2025-06-13_22-25-36](https://github.com/user-attachments/assets/b4e5ba9c-a825-46ca-9c0e-260f318935e5)
![screenshot_2025-06-13_22-27-26](https://github.com/user-attachments/assets/2ba1dc8e-f5c4-48b3-9724-8ba32798fddf)

### The installation script is old and probably barely functional.
They will probably install some fonts and dependencies. Anything beyond that I am beyond lazy to set up automation for.
These dotfiles contain everything you need to have this configuration for yourself.

### Dependencies
These are found in the `install.sh`. A lot of them are almost certainly missing. Here they are:
pacman:

```bash
sudo pacman -S --needed waybar hyprland blueman btop ffmpeg grim slurp gamemode mpv nano fastfetch pavucontrol jq sddm wofi zsh openrgb wget glfw stb glew starship cmake meson cpio pkg-config git gcc hyprland
```
aur only:
```
yay -S cozette-otb
```

