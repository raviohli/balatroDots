#!/bin/bash

# Path to your sound playing script
SOUND_SCRIPT="$HOME/.scripts/playSound.sh"
SOUND_NAME="card1"  # Change this to whatever sound you want to play
SOUND_ALT="card3"

# Function to handle cleanup on script exit
cleanup() {
    echo "Stopping Hyprland listener..."
    kill $SOCAT_PID 2>/dev/null
    exit 0
}

# Set up signal handlers
trap cleanup SIGINT SIGTERM

# Check if we're running in Hyprland
if [[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]]; then
    echo "Error: HYPRLAND_INSTANCE_SIGNATURE not set. Are you running this in Hyprland?"
    exit 1
fi

# Build socket path and check if it exists
SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"
if [[ ! -S "$SOCKET_PATH" ]]; then
    echo "Error: Hyprland socket not found at: $SOCKET_PATH"
    echo "Available sockets in $XDG_RUNTIME_DIR/hypr/:"
    ls -la "$XDG_RUNTIME_DIR/hypr/" 2>/dev/null || echo "No $XDG_RUNTIME_DIR/hypr/ directory found"
    exit 1
fi

echo "Starting Hyprland window close listener..."
echo "Socket path: $SOCKET_PATH"
echo "Press Ctrl+C to stop"

# Connect to Hyprland's event socket and listen for events
socat -u UNIX-CONNECT:"$SOCKET_PATH" - | while read -r line; do
    # Parse the event line (format: event>>data)
    event=$(echo "$line" | cut -d'>' -f1)
    
    # check if it's a window open event
    if [[ "$event" == "openwindow" ]]; then
        window_address=$(echo "$line" | cut -d'>' -f3)
        echo "Window  opened: $window_address"

        #execute sound script with sound name
        if [[ -x "$SOUND_SCRIPT" ]]; then
            "$SOUND_SCRIPT" "$SOUND_NAME" &
        else
            echo "sound script not found"
        fi
    fi
    # Check if it's a window close event
    if [[ "$event" == "closewindow" ]]; then
        window_address=$(echo "$line" | cut -d'>' -f3)
        echo "Window closed: $window_address"
        
        # Execute your sound script with sound name
        if [[ -x "$SOUND_SCRIPT" ]]; then
            "$SOUND_SCRIPT" "$SOUND_ALT" &
        else
            echo "Sound script not found or not executable: $SOUND_SCRIPT"
        fi
    fi
done &

SOCAT_PID=$!
wait $SOCAT_PID