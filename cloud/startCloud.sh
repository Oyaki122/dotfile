#!/bin/sh

rclone mount GoogleP: ~/cloud/googleP/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
rclone mount GoogleK: ~/cloud/googleK/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
rclone mount GoogleKRA: ~/cloud/googleKRA/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
rclone mount OneDriveP: ~/cloud/onedriveP/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
rclone mount OneDriveK: ~/cloud/onedriveK/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full

