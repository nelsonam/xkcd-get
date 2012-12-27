#!/bin/bash
#makes a folder for the comicz
mkdir comics; cd comics
#gets the latest number
latest=`lynx -dump http://www.xkcd.com | grep Permanent | tr "/" "\n" | sed -n '4p'`
#gotta download 'em all!
for ((i=1;i<=latest;i++)); do
    #getting the url
    url=`lynx -dump http://www.xkcd.com/$i | grep http://imgs.xkcd.com/comics`
    wget $url -O "$i.jpg"
done
