#!/bin/sh
# sattap - Send a thing to a place
set -e

SCP_HOST='img.lgtm.ca'
SCP_PATH='/home/www/img.lgtm.ca'
HTTP_URL="https://img.lgtm.ca/"

FILENAME=`date | md5sum | head -c 8`.png
FILEPATH=/tmp/$FILENAME

import $FILEPATH
scp $FILEPATH ${SCP_HOST}:$SCP_PATH
rm $FILEPATH

echo -n $HTTP_URL$FILENAME | xclip -selection clipboard
notify-send "Uploaded to $HTTP_URL$FILENAME"
