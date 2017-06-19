#!/bin/sh
# sattap - Send a thing to a place
set -e

imageshack(){
    out=upl.tmp.`date +%s`
    echo "Uploading: $1"
    curl -H Expect: -F fileupload="@$1" -F xml=yes -# "http://www.imageshack.us/index.php" > /tmp/$out 2>&1

    if [ `cat /tmp/$out | grep image_link | wc -l` -lt 1 ]; then
        notify-send "Error: $1"
    else
        cat /tmp/$out | tr -d " " | grep image_link | grep -o  http[^\<]* | xclip -selection clipboard
        notify-send "Uploaded! Paste from clipboard."
    fi
    #rm /tmp/$out
}
SCP_HOST='merail.ca'
SCP_PATH='/var/www/virtual/merail.ca/img'
HTTP_URL="http://img.merail.ca/"

FILENAME=`date | md5sum | head -c 8`.png
FILEPATH=/tmp/$FILENAME

import $FILEPATH
scp $FILEPATH ${SCP_HOST}:$SCP_PATH
#imageshack $FILEPATH
rm $FILEPATH

echo -n $HTTP_URL$FILENAME | xclip -selection clipboard
notify-send "Uploaded to $HTTP_URL$FILENAME"
