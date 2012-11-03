#!/bin/bash

# This program mounts the specified device, creates a destination directory
# and moves all files from the mounted device to the created directory.
# This program is run by a udev rule when a camera flash drive is inserted.
# This program redirects all output to syslog.
# This program exits with zero on success, non zero on failure.

{
    set -u
    set -o pipefail

    echo "starting $BASHPID"

    if [[ $# -ne 1 ]]
    then
        echo "usage: $0 <dev>"
        exit 1
    fi

    readonly dev=$1

    echo "mounting ${dev} /mnt/usb"
    mount ${dev} /mnt/usb
    if [[ $? -ne 0 ]]
    then
        echo "cannot mount ${dev}"
        exit 5
    fi
    echo "mounted ${dev} /mnt/usb"

    readonly dir=/home/dgoncharov/photo/$(date +%Y.%m.%d)
    mkdir -p ${dir}
    if [[ $? -ne 0 ]]
    then
        echo "cannot mkdir ${dir}"
        exit 10
    fi

    find /mnt/usb/ -type f -exec mv -nv {} ${dir} \;
    umount /mnt/usb
    chown -R dgoncharov:dgoncharov ${dir}
    chmod 554 ${dir}
    chmod 444 ${dir}/*
    echo "$BASHPID finished"
    exit 0
# Detach to let the parent exit and udev continue.
} |& logger -tmvphoto &

exit 0
