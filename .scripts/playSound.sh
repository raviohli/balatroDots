#!/bin/bash
SOUND_DIR="$HOME/.config/hypr/sounds/"
case "$1" in
    card1)
        SOUND="$SOUND_DIR/card1.ogg"
        ;;
    cardrand)
        random2=$((RANDOM % 2 * 2 + 1 ))
        SOUND="$SOUND_DIR/card$random2.ogg"
        ;;
    card3)
        SOUND="$SOUND_DIR/card3.ogg"
        ;;
    whoosh1)
        SOUND="$SOUND_DIR/whoosh1.ogg"
        ;;
    whoosh2)
        SOUND="$SOUND_DIR/whoosh2.ogg"
        ;;
    button)
        SOUND="$SOUND_DIR/button.ogg"
        ;;
    cancel)
        SOUND="$SOUND_DIR/cancel.ogg"
        ;;
    card3)
        SOUND="$SOUND_DIR/card3.ogg"
        ;;
    coin2)
        SOUND="$SOUND_DIR/coin2.ogg"
        ;;
    coin3)
        SOUND="$SOUND_DIR/coin3.ogg"
        ;;
    coin4)
        SOUND="$SOUND_DIR/coin4.ogg"
        ;;
    coin5)
        SOUND="$SOUND_DIR/coin5.ogg"
        ;;
    coin6)
        SOUND="$SOUND_DIR/coin6.ogg"
        ;;
    coin7)
        SOUND="$SOUND_DIR/coin7.ogg"
        ;;
    win)
        SOUND="$SOUND_DIR/win.ogg"
        ;;
    polychrome)
        SOUND="$SOUND_DIR/polychrome1.ogg"
        ;;
    coin-random)
        rand=$((RANDOM % 6 + 2)) # random num between 2 and 7
        SOUND="$SOUND_DIR/coin$rand.ogg"
        ;;
    generic)
        SOUND="$SOUND_DIR/generic1.ogg"
        ;;
    crumple)
        random=$((RANDOM % 5 + 1))
        SOUND="$SOUND_DIR/crumple$random.ogg"
        ;;
    *)
    echo "Unknown sound: $1" >&2
    exit 1
    ;;
esac

# play the sound
paplay "$SOUND" &
