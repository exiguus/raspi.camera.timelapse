#!/bin/sh
BASEDIR=/usr/local/sbin/camera
SCRIPTNAME=take.sh
TENEQ=$(date +"%M" | cut -c 2)

# reconnect wifi if necessery
#
#SCRIPTNAME=check-wifi.sh
#ISNOTRUNNING=$($SCRIPTDIR/kill-scripts.sh $SCRIPTNAME)
#if [ "$ISNOTRUNNING" = "info: $SCRIPTNAME is not running" ] ; then
#sudo $SCRIPTDIR/$SCRIPTNAME > /dev/null 2>&1
#fi

# every N0 || every N5 minutes
if [ $TENEQ = "0" ] || [ $TENEQ = "5" ] ; then
SCRIPTDIR=photo
else
SCRIPTDIR=video
fi

ISNOTRUNNING=$($BASEDIR/misc/kill.sh $BASEDIR/$SCRIPTDIR/$SCRIPTNAME)

if [ "$ISNOTRUNNING" = "info: $BASEDIR/$SCRIPTDIR/$SCRIPTNAME is not running" ] ; then
nice -n 5 $BASEDIR/$SCRIPTDIR/$SCRIPTNAME > /dev/null 2>&1
fi

