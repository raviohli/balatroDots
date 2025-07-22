#!/bin/bash

VOLUME_REDUCTION=0.5

for f in coin*.ogg
    do  [ -e "$f" ] || continue
    ffmpeg -i "$f" -af "volume=$VOLUME_REDUCTION" "quiet/${f%.ogg}.ogg"
done