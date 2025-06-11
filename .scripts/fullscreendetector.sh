#!/bin/bash
if hyprctl clients -j | jq -e 'any(.[]; .fullscreen != 0)' >/dev/null; then
    echo "A client is fullscreen"
else
    echo "No fullscreen client"
fi