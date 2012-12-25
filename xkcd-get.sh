#!/bin/bash
mkdir comics; cd comics
for i in {1..1150}; do
url=`lynx -dump http://www.xkcd.com/$i | grep jpg`
wget $url
done