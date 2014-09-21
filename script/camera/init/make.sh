#!/bin/sh
BASEDIR=/usr/local/sbin/camera
SCRIPTNAME=make.sh
SCRIPTDIR=video

ISNOTRUNNING=$($BASEDIR/misc/kill.sh $BASEDIR/$SCRIPTDIR/$SCRIPTNAME)

if [ "$ISNOTRUNNING" = "info: $BASEDIR/$SCRIPTDIR/$SCRIPTNAME is not running" ] ; then
nice -n 15 $BASEDIR/$SCRIPTDIR/$SCRIPTNAME > /dev/null 2>&1
fi

