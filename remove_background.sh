#!/bin/bash
IMAGE=$1
SUFFIX=$2
echo "converting ${IMAGE}.${SUFFIX}"
convert ${IMAGE}.${SUFFIX} \( +clone -fx 'p{10,10}' \) -compose Difference -composite -modulate 1,0   ${IMAGE}_difference.png
convert ${IMAGE}.${SUFFIX} ${IMAGE}_difference.png -compose Copy_Opacity -composite ${IMAGE}_trans.png

# At this point the entire image is too transparent, but the background is removed..
# We will clone the image over an over, and combine them to get the image itself back with a good opacity. 

for i in {1..20}
do
  convert ${IMAGE}_trans.png  +clone  -background none   -flatten   ${IMAGE}_trans.png
  sleep 0.1
done
