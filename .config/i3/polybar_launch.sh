#!/usr/bin/env bash

# 1. Terminate already running bar instances
# Use polybar-msg if you have IPC enabled, otherwise killall is the reliable hammer.
killall -q polybar

# 2. Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# 3. Launch Polybar
# Replace "main" with the actual name of your bar from your config file
echo "---" | tee -a /tmp/polybar.log
polybar >>/tmp/polybar.log 2>&1 &

echo "Bars launched..."
