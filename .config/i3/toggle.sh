#!/bin/bash

# Ensure jq is installed
command -v jq >/dev/null 2>&1 || { echo "jq not installed"; exit 1; }

# Get the currently focused workspace
current_ws=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

# Toggle between workspace 1 and 2
if [ "$current_ws" = "1" ]; then
    i3-msg workspace 2
else
    i3-msg workspace 1
fi

