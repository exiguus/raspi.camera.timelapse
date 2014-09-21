#!/bin/sh
# mount samba dir to backup videos and clear hdd from older files and directories

SOURCE=/home/pi/camera/videos
DEST=/mnt/path
HOSTNAME=$(hostname)
# max AGE before remove
AGE=7


# MOUNTING
MOUNT=//address/path
USR=device/username
PWD=password

MOUNTED=$(mount | grep -o $DEST | tail -1)
if [ "$MOUNTED" != "$DEST" ] ; then
mount -t cifs -o nounix,user=$USR,password=$PWD,rw,file_mode=0777,dir_mode=0777 $MOUNT $DEST
sleep 10
fi

MOUNTED=$(mount | grep -o $DEST | tail -1)
if [ "$MOUNTED" = "$DEST" ] ; then
rsync -az $SOURCE $DEST/$HOSTNAME
umount $DEST
sleep 5
FD=`find $SOURCE -type d -mtime +$AGE `
if [ "" != "$FD" ]; then
RM=`rm -rf $FD`
fi
fi

