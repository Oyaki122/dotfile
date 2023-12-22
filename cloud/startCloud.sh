#!/bin/sh

mountRclone() {
  rclone mount $1: $2\
    --daemon\
    --cache-dir\
    ~/.local/var/rclone\
    --vfs-cache-mode full\
    --vfs-cache-max-age 1w\
    --vfs-cache-max-size 64G\
    --write-back-cache
}

mountRclone GoogleP ~/cloud/googleP/
mountRclone GoogleK ~/cloud/googleK/
mountRclone GoogleKRA ~/cloud/googleKRA/
mountRclone OneDriveP ~/cloud/onedriveP/
mountRclone OneDriveK ~/cloud/onedriveK/

# rclone mount GoogleP: ~/cloud/googleP/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
# rclone mount GoogleK: ~/cloud/googleK/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
# rclone mount GoogleKRA: ~/cloud/googleKRA/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
# rclone mount OneDriveP: ~/cloud/onedriveP/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full
# rclone mount OneDriveK: ~/cloud/onedriveK/ --daemon --cache-dir ~/.local/var/rclone --vfs-cache-mode full

