#!/usr/bin/env bash

GLWALL_BIN=~/.scripts/GLWall
SHADER=~/.config/hypr/wallpapers/shaders/balatro.glsl
WALLPAPER_DIR_PATH=~/.config/hypr/wallpapers/shaders

while [ -z "$(hyprctl monitors 2>/dev/null)" ]; do
  sleep 0.2
done

sleep 5

# Kill existing instances
pkill -f "$GLWALL_BIN"
pkill -f "mpvpaper"
# Commands to run
GLWALL_CLASS=glwall_1 "$GLWALL_BIN" "$SHADER" & # MONITOR 1
# GLWALL_CLASS=glwall_3 "$GLWALL_BIN" "$SHADER" # MONITOR 3
mpvpaper DP-3 -o "--glsl-shader=$WALLPAPER_DIR_PATH/balatroformpv.glsl --profile=low-latency --gpu-api=vulkan --loop" $WALLPAPER_DIR_PATH/black.mp4