#!/bin/bash

log_path= "<Path to log>"
touch ${log_path}/checking_mounts.log

MOUNTPOINT1="<Path to mount>"
#MOUNTPOINT2="<Path to mount>"

SOURCEPOINT1="Source path"
#SOURCEPOINT2=""

SECRETS="<path_to_credentials>" 

LOG = ${log_path}/checking_mounts.log
#### MOUNTPOINT 1 ###

#Checking if file system is already mounted, if not it will use SOURCEPOINT1 and it will mount it in MOUNTPOINT1. Log will be available in LOG
if cat /proc/mounts | grep ${MOUNTPOINT1} > /dev/null; then
        echo $(date) ": ${MOUNTPOINT1} already mounted." >> ${LOG}
else
        mount -t cifs -o credentials=${SECRETS} ${SOURCEPOINT1} ${MOUNTPOINT1}
        echo $(date) ": ${MOUNTPOINT1} has been mounted." >> ${LOG}
fi

#### MOUNTPOINT 2 ###
#Checking if file system is already mounted, if not it will use SOURCEPOINT2 and it will mount it in MOUNTPOINT2. Log will be available in LOG
# if cat /proc/mounts | grep ${MOUNTPOINT2} > /dev/null; then
#         echo $(date) ": ${MOUNTPOINT2} already mounted." >> ${LOG}
# else
#         mount -t cifs -o credentials=${SECRETS} ${SOURCEPOINT2} ${MOUNTPOINT2}
#         echo $(date) ": ${MOUNTPOINT2} has been mounted." >> ${LOG}
# fi

exit