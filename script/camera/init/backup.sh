#!/bin/sh
BASEDIR=/usr/local/sbin/camera
SCRIPTNAME=backup.sh
TENEQ=$(date +"%M" | cut -c 2)

if [ $TENEQ = "0" ] ; then
SCRIPTDIR=photo
else
SCRIPTDIR=video
fi

ISNOTRUNNING=$($BASEDIR/misc/kill.sh $BASEDIR/$SCRIPTDIR/$SCRIPTNAME)

if [ "$ISNOTRUNNING" = "info: $BASEDIR/$SCRIPTDIR/$SCRIPTNAME is not running" ] ; then
nice -n 15 $BASEDIR/$SCRIPTDIR/$SCRIPTNAME
fi

