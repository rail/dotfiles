#!/bin/sh
# sattap - Send a thing to a place
set -e
 
imageshack(){
    out=upl.tmp.`date +%s`
    echo "Uploading: $1"
    curl -H Expect: -F fileupload="@$1" -F xml=yes -# "http://www.imageshack.us/index.php" > /tmp/$out 2>&1

    if [ `cat /tmp/$out | grep image_link | wc -l` -lt 1 ]; then
        ok "Error: $1"
    else 
        cat /tmp/$out | tr -d " " | grep image_link | grep -o  http[^\<]* | xclip -selection clipboard
        ok "Uploaded! Paste from clipboard."
    fi
    #rm /tmp/$out
}
SCP_HOST='people.mozilla.com'
SCP_PATH='~/public_html/sattap/'
HTTP_URL="http://people.mozilla.org/~raliiev/sattap/"
 
FILENAME=`date | md5sum | head -c 8`.png
FILEPATH=/tmp/$FILENAME
 
import $FILEPATH
scp $FILEPATH ${SCP_HOST}:$SCP_PATH
#imageshack $FILEPATH
rm $FILEPATH
 
echo $HTTP_URL$FILENAME | xclip -selection clipboard
ok "Uploaded to $HTTP_URL$FILENAME"

