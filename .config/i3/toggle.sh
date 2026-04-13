#!/bin/sh

# File to store the toggle state
STATE_FILE="/tmp/i3_toggle_state"

# Read the last state; default to 1 if file doesn't exist
if [ -f "$STATE_FILE" ]; then
    LAST_STATE=$(cat "$STATE_FILE")
else
    LAST_STATE=1
fi

# Toggle logic
if [ "$LAST_STATE" = "1" ]; then
    i3-msg workspace 2
    echo 2 > "$STATE_FILE"
else
    i3-msg workspace 1
    echo 1 > "$STATE_FILE"
fi
