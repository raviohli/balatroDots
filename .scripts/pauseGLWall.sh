#!/usr/bin/env bash

last_state="none"

while true; do
    if hyprctl clients -j | jq -e 'any(.[]; (.workspace.id == 1 or .workspace.id == 4) and .fullscreen != 0)' >/dev/null; then
        if [[ "$last_state" != "fullscreen" ]]; then
            pkill -SIGUSR1 GLWall
            last_state="fullscreen"
        fi
    else
        if [[ "$last_state" != "windowed" ]]; then
            pkill -SIGUSR2 GLWall
            last_state="windowed"
        fi
    fi
    sleep 1
done
