#!/bin/bash

LAYOUT="$HOME/.config/wlogout/layout"
STYLE="$HOME/.config/wlogout/style.css"

# If wlogout is not running, launch it
if ! pgrep -x wlogout > /dev/null; then
    wlogout --no-span \
        --protocol layer-shell \
        --layout "$LAYOUT" \
        --css "$STYLE" \
        --buttons-per-row 3 \
        --column-spacing 50 \
        --row-spacing 50 \
        --margin-top 290 \
        --margin-bottom 290 \
        --margin-left 300 \
        --margin-right 300
else
    pkill wlogout
fi