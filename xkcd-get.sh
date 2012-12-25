#!/bin/bash
mkdir comics; cd comics
for i in {1..1151}; do
url=`lynx -dump http://www.xkcd.com/$i | grep http://imgs.xkcd.com/comics`
wget $url
done
