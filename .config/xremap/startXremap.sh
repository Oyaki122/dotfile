#!/usr/bin/env bash

if [ -x /home/oyaki/.local/bin/xremap ]; then
    xhost +SI:localuser:xremap
    xremap  "/home/oyaki/.config/xremap/config.yml" --device /dev/input/event4 &
fi


