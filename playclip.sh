#!/bin/bash
ffmpeg -re -i $1 -vcodec copy -f avi  -an udp://239.0.1.23:1234
