#!/bin/sh
URL=http//example.org/webpath
DEST=/home/pi/camera/photos
DIR=$(ls $DEST | tail -1)
FILE=$(ls $DEST/$DIR | tail -1)

SUBJECT="ERROR "
# Email To SMS gateways http://www.wut.de/e-57w11-10-apde-000.php or whatever
EMAIL="mail@example.org"
MESSAGE=" Photo not found @ $URL/$DIR/$FILE"

wget --spider --no-check-certificate -o /tmp/check.url.$FILE $URL/$DIR/$FILE > /dev/null
sleep 3

STATUS=$(grep -s "200 OK" /tmp/check.url.$FILE)

if [ "$STATUS" = "" ] ; then
# apt-get install mailutils
mail -s "$SUBJECT" "$EMAIL"<<EOM
$MESSAGE
EOM
fi
sleep 3
rm /tmp/check.url.$FILE

