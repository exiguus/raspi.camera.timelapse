#!/bin/sh
# take the photo and sync it remote
# via ssh authenication key
if [ "$1" = "" ] ; then
echo "error: no <SRC> given!"
exit
fi

#user@hostname:/path/to/push
REMOTEOWN=ownername
REMOTEUSER=username
REMOTEHOST=example.org
REMOTEDEST=/path/to/upload/the/files

rsync -az --owner=$REMOTEOWN --group=$REMOTEOWN --rsh="ssh " $1 $REMOTEUSER@$REMOTEHOST:$REMOTEDEST
sleep 10

