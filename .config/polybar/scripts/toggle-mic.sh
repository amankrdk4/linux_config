#!/bin/bash

# Get the default microphone source (excluding monitor sources)
MIC_NAME=$(pactl list sources | grep 'Name: ' | grep -v monitor | awk '{print $2}' | head -n 1)

# Get current mute state
STATE=$(pactl get-source-mute "$MIC_NAME")

# Toggle mute
if [[ $STATE == *"yes" ]]; then
    pactl set-source-mute "$MIC_NAME" 0
else
    pactl set-source-mute "$MIC_NAME" 1
fi

