#!/usr/bin/env bash

VIDEO_WALLPAPER="$HOME/.config/hypr/wallpapers/balatro.mp4"
IMAGE_WALLPAPER="$HOME/.config/hypr/wallpapers/static.jpg"
OUTPUTS="DP-1,DP-3"

is_fullscreen() {
    hyprctl activewindow -j | jq -e '.fullscreen == true' &>/dev/null
}

start_mpvpaper() {
    mpvpaper "$OUTPUTS" "$VIDEO_WALLPAPER" -o "--loop --no-audio --fs --no-osc --no-input-default-bindings --hwdec=auto-copy --no-config --no-msg-color --script-opts=osc-visibility=never --no-terminal --no-input-cursor --vf=scale=1280:-1:bilinear --framedrop=vo --profile=low-latency" &
}

start_hyprpaper() {
    killall hyprpaper 2>/dev/null
    hyprpaper &
    sleep 0.5  # let hyprpaper init
    hyprctl hyprpaper wallpaper "$OUTPUTS,$IMAGE_WALLPAPER"
}

stop_all_wallpapers() {
    killall mpvpaper 2>/dev/null
    killall hyprpaper 2>/dev/null
}

current_mode="none"

while true; do
    if is_fullscreen && [[ "$current_mode" != "image" ]]; then
        stop_all_wallpapers
        start_hyprpaper
        current_mode="image"
    elif ! is_fullscreen && [[ "$current_mode" != "video" ]]; then
        stop_all_wallpapers
        start_mpvpaper
        current_mode="video"
    fi
    sleep 1
done
