#!/bin/bash
killall gpu-screen-recorder
sleep 1
gpu-screen-recorder -w DP-1 -f 30 -a "default_input|default_output" -q medium -ac opus -c mp4 -o $HOME/Videos/clips -r 300 -k h264
notify-send -a aurora "Clip Daemon Started"
