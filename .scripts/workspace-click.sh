#!/bin/bash

workspaces=$(hyprctl -j workspaces)

if [ -n "$1" ]; then
    hyprctl dispatch workspace "$1"
    ~/.scripts/playSound.sh coin-random
    exit
fi
hyprctl dispatch workspace "$ws"
$HOME/.scripts/playSound.sh coin-random