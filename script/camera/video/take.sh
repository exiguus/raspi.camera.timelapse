#!/bin/sh
USR=pi
DEST=/home/pi/camera/videos
FILE=$(date +"%Y%m%d-%H%M")
DIR=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
DAY=$(date +"%d")
HOUR=$(date +"%H")


LASTDIR=$(ls $DEST | tail -1)
LASTFILE=$(ls $DEST/$LASTDIR | tail -1)
RASPISTILLOPTIONS="-rot 90 -w 960 -h 720"
# RASPISTILLOPTIONS="-w 720 -h 960 -rot 270 --contrast 25 --brightness 55"

if [ "$LASTDIR" != "$DIR" ] ; then
mkdir -p $DEST/$DIR
sleep 3
chown $USR:$USR $DEST/$DIR
fi

if [ "$(ls $DEST/$DIR | grep .jpg~)" != "" ] ; then
rm $DEST/$DIR/*.jpg~
fi

if [ "$(pidof raspistill)" = "" ] && [ "$LASTFILE" != "$FILE.jpg" ] ; then
raspistill $RASPISTILLOPTIONS -o $DEST/$DIR/$FILE.jpg
sleep 10
chown $USR:$USR $DEST/$DIR/$FILE.jpg
fi

