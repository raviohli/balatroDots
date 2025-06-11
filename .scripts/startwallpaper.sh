#!/bin/bash

#mpvpaper DP-1,DP-3 ~/.config/hypr/wallpapers/balatro.mp4 -o "--loop --no-audio --fs --no-osc --no-input-default-bindings --hwdec=auto --no-config --no-msg-color --script-opts=osc-visibility=never --no-terminal --no-input-cursor" &

mpvpaper DP-1,DP-3 ~/.config/hypr/wallpapers/balatro.mp4 -o "--loop --no-audio --fs --no-osc --no-input-default-bindings --hwdec=auto-copy --no-config --no-msg-color --script-opts=osc-visibility=never --no-terminal --no-input-cursor --vf=scale=1280:-1:bilinear --framedrop=vo --profile=low-latency" &



#mpvpaper DP-2 ~/.config/hypr/wallpapers/balatro-rotated.mp4 -o "--loop --no-audio --fs --no-osc --no-input-default-bindings --hwdec=auto --no-config --no-msg-color --script-opts=osc-visibility=never --no-terminal --no-input-cursor" &
#mpvpaper DP-3 ~/.config/hypr/wallpapers/balatro.mp4 -o "--loop --no-audio --fs --no-osc --no-input-default-bindings --hwdec=auto --no-config --no-msg-color --script-opts=osc-visibility=never --no-terminal --no-input-cursor"
#mpvpaper DP-2 ~/.config/hypr/wallpapers/balatro-rotated.mp4 \
 # --player-options="--no-mpris --no-osc --no-input-default-bindings --no-input-cursor --no-resume-playback --no-restore-session-playback --mute=yes --loop-file=inf --fs --hwdec=auto"
