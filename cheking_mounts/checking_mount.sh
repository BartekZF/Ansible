#!/bin/bash

touch /home/cloud_user/checking_mounts.log

MOUNTPOINT1="/some/mount-point"

log = /home/cloud_user/checking_mounts.log

if cat /proc/mounts | grep ${MOUNTPOINT1} > /dev/null; then
        echo "${MOUNTPOINT1} already mounted." >> log
        exit 0
fi

# If above did not exit
mount ${MOUNTPOINT1}

if [ $? -eq 0 ]; then
        echo "${MOUNTPOINT1} has been mounted." >> log
else
        # Mounting failed, send email
        echo "Mounting of ${MOUNTPOINT1} failed."  >> log 
fi

exit