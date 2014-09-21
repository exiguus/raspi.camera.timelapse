#!/bin/sh
# make the picture and sync it remote
USR=pi
DEST=/home/pi/camera/photos
FILE=$(date +"%Y%m%d-%H")00
DIR=$(date +"%Y-%m-%d")
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
DAY=$(date +"%d")
HOUR=$(date +"%H")

LASTDIR=$(ls $DEST | tail -1)
LASTHOUR=$(ls $DEST/$DIR | tail -1 | cut -c 10-11)

RASPISTILLOPTIONS="-rot 90"
#RASPISTILLOPTIONS="-w 1920 -h 1280"
#RASPISTILLOPTIONS="--contrast 25 --brightness 55"
#RASPISTILLOPTIONS="--contrast 55 --brightness 54" ---is ok

if [ "$LASTDIR" != "$DIR" ] ; then
mkdir -p $DEST/$DIR
sleep 3
chown $USR:$USR $DEST/$DIR
fi

if [ "$(ls $DEST/$DIR | grep .jpg~)" != "" ] ; then
rm $DEST/$DIR/*.jpg~
fi

if [ "$(pidof raspistill)" = "" ] && [ "$LASTHOUR" != "$HOUR" ] ; then
raspistill $RASPISTILLOPTIONS -o $DEST/$DIR/$FILE.jpg
sleep 10
chown $USR:$USR $DEST/$DIR/$FILE.jpg
fi

