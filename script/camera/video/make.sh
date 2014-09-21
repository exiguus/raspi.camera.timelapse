#!/bin/sh
# build the video with mencoder
USR=pi
DEST=/home/pi/camera/videos
DIR=$(ls $DEST | tail -2 | head -1)
FILE="$DIR-timelapse.avi"


MENCODEROPTIONS="w=960:h=720:type=jpg:fps=15"

if [ ! -f "$DEST/$DIR/$FILE" ] && [ "$(pidof mencoder)" = "" ] ; then
cd $DEST/$DIR
sleep 3
mencoder -nosound mf://*.jpg -mf $MENCODEROPTIONS -ovc lavc -lavcopts vcodec=mpeg4:vbitrate=2160000:mbd=2:keyint=132:v4mv:vqmin=3:lumi_mask=0.07:dark_mask=0.2:mpeg_quant:scplx_mask=0.1:tcplx_mask=0.1:naq -o $DEST/$DIR/$FILE
sleep 3
chown $USR:$USR $DEST/$DIR/$FILE
fi

