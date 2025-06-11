#!/bin/bash

playerctl --follow metadata --format '{{status}}|{{artist}}|{{title}}' 2>/dev/null | while IFS='|' read -r status artist title; do
    # Escape markup chars
    safe_artist=$(echo "$artist" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e "s/'/\&apos;/g" -e 's/\"/\&quot;/g')
    safe_title=$(echo "$title" | sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e "s/'/\&apos;/g" -e 's/\"/\&quot;/g')

    if [[ "$status" == "Playing" ]]; then
        echo "{\"text\": \"$safe_artist - $safe_title\", \"class\": \"Playing\"}"
    elif [[ "$status" == "Paused" ]]; then
        echo "{\"text\": \"$safe_artist - $safe_title\", \"class\": \"Paused\"}"
    else
        echo "{\"text\": \"\", \"class\": \"\"}"
    fi
done
