#!/bin/bash

# Ping Google once, timeout after 2 seconds, and extract the time
ping=$(ping -c 1 8.8.8.8 | grep 'time=' | sed 's/.*time=\([0-9.]*\).*/\1/')

if [ -z "$ping" ]; then
    echo "󰲛  Offline" # Icon for no connection
else
    # Round to nearest whole number
    printf "󰓅 %0.f ms\n" "$ping"
fi
