#!/usr/bin/bash

SAVE_DIR="$HOME/Pictures/screenshots"

FILENAME="$SAVE_DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
notify-send "Screenshot saved and copied"
grim -g "0,0 2560x1440" "$FILENAME" && wl-copy < "$FILENAME"


