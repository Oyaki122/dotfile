!/usr/bin/env bash
if [ -x /usr/local/bin/xkeysnail ]; then
    xhost +SI:localuser:xkeysnail
    xkeysnail  "/home/oyaki/.config/xkeysnail/config.py" --device "/dev/input/event4" &
fi

