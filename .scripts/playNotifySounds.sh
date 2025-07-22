#!/bin/bash

SOUND1_FILE="$HOME/.config/hypr/sounds/multhit1.ogg"
SOUND2_FILE="$HOME/.config/hypr/sounds/multhit2.ogg"
SOUND3_FILE="$HOME/.config/hypr/sounds/win.ogg"
#notification timestamps
declare -a notifyTimes=()

# function to clean up old timestamps
cleanup_old_timestamps() {
    local now
    now=$(date +%s)
    local new_times=()
    for t in "${notify_times[@]}"; do
        if (( now - t <= 10 )); then
            new_times+=("$t")
        fi
    done
    notify_times=("${new_times[@]}")
}
# main loop: monitor for notify signal and react

dbus-monitor "interface='org.freedesktop.Notifications',member='Notify'" |
while read -r line; do
    if echo "$line" | grep -q "member=Notify"; then
        now=$(date +%s)
        notify_times+=("$now")
        cleanup_old_timestamps

        count=${#notify_times[@]}

        if (( count >= 5 )); then
            paplay "$SOUND3_FILE" &
        elif (( count >= 2 )); then
            paplay "$SOUND2_FILE" &
        else
            paplay "$SOUND1_FILE" &
        fi
    fi
done