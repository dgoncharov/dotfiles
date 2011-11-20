#!/bin/bash

# This program mounts the specified device, creates a destination directory
# and copies all files from the mounted device to the created directory.
# This program is run by a udev rule when a camera flash drive is inserted.
# This program redirects all output to syslog.
# This program exits with zero on success, non zero on failure.

set -u
set -o pipefail

main()
{
    if [[ $# -ne 1 ]]
    then
        echo "usage: $0 <dev>"
        exit 1
    fi

    readonly local dev=$1

    mount ${dev} /mnt/usb
    if [[ $? -ne 0 ]]
    then
        echo "cannot mount ${dev}"
        exit 5
    fi

    readonly local dir=/home/dgoncharov/photo/$(date +%Y.%m.%d)
    mkdir -p ${dir}
    if [[ $? -ne 0 ]]
    then
        echo "cannot mkdir ${dir}"
        exit 10
    fi

    find /mnt/usb/ -type f -exec mv -nvf '{}' ${dir} \;
    chown -R dgoncharov:dgoncharov ${dir}
    chmod 554 ${dir}
    chmod 444 ${dir}/*
    umount /mnt/usb
}

main "$@" |& logger -tmvphoto

