#!/bin/bash
ping -c 1 -W 1 8.8.8.8 | grep -oP 'time=\K\d+' | awk '{print $1 " ms"}' || echo "OFF"
