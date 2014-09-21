#!/bin/sh
BASEDIR=/usr/local/sbin/camera
SCRIPTNAME=sync.sh
TENEQ=$(date +"%M" | cut -c 1)


if [ $TENEQ = "2" ] ; then
SCRIPTDIR=video
SRC=/home/pi/camera/videos/
else
SCRIPTDIR=photo
SRC=/home/pi/camera/photos
fi


ISNOTRUNNING=$($BASEDIR/misc/kill.sh $BASEDIR/$SCRIPTDIR/$SCRIPTNAME)

if [ "$ISNOTRUNNING" = "info: $BASEDIR/$SCRIPTDIR/$SCRIPTNAME is not running" ] ; then
nice -n 10 $BASEDIR/$SCRIPTDIR/$SCRIPTNAME $SRC
fi

