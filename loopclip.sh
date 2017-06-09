#!/bin/bash
if [[ $# -ne 2 ]] ; then
    echo "usage: $0 clip minutestorun"
    exit 1
fi

if [[ -f $1 ]] ; then
    echo "Can't read file $1!"
    exit 2
fi

starttime=$(date +%s )
in_seconds=$(($2 * 60))
mintime=$(( $in_seconds + $starttime))
while [[ ${mintime} -gt $(date +%s) ]] ; do
    ffmpeg -re -i "$1" -vcodec copy -f avi  -an udp://239.0.1.23:1234
done

exit 0
