#!/bin/bash
#makes a folder for the comicz
mkdir comics; cd comics
#gets the latest number
latest=`wget -O- http://www.xkcd.com | grep Permanent | tr "/" "\n" | sed -n '4p'`
#gotta download 'em all!
for ((i=1;i<=latest;i++)); do
    #getting the link (and other junk)
    link=`wget -O- http://www.xkcd.com/$i | grep http://imgs.xkcd.com/comics`
    #getting the URL
    url=`echo $link|grep -o 'src="[^"]*"'|sed -e 's/src="\([^"]*\)"/\1/'`
    alttext=`echo $link|grep -o 'alt="[^"]*"'|sed -e 's/alt="\([^"]*\)"/\1/'`
    wget $url -O "$i.jpg"
    echo "$i: $alttext" >> alttext.txt
done
