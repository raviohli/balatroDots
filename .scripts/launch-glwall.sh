#!/usr/bin/env bash

GLWALL_BIN=~/.scripts/GLWall
SHADER=~/.config/hypr/wallpapers/shaders/balatro.glsl

# Kill existing instances
pkill -f "$GLWALL_BIN"
pkill -f "mpvpaper"
# Commands to run
GLWALL_CLASS=glwall_1 "$GLWALL_BIN" "$SHADER" & # MONITOR 1
# GLWALL_CLASS=glwall_3 "$GLWALL_BIN" "$SHADER" # MONITOR 3
mpvpaper DP-3 ~/.config/hypr/wallpapers/balatro.mp4 -o "--loop --no-audio --fs --no-osc --no-input-default-bindings --hwdec=auto-copy --no-config --no-msg-color --script-opts=osc-visibility=never --no-terminal --no-input-cursor --vf=scale=1280:-1:bilinear --framedrop=vo --profile=low-latency --gpu-api=vulkan" &
