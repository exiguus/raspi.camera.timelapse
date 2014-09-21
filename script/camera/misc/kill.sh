#!/bin/sh
if [ "$1" = "" ] ; then
echo "error: no <SCRIPTNAME> given!"
exit
fi
if [ "$(ps ax | grep -v grep | grep -v kill.sh | grep $1)" != "" ] ; then
killall -g $1 > /dev/null 2>&1
else
echo "info: $1 is not running"
fi

