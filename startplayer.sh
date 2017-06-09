#!/bin/bash
export DISPLAY=:0.0
pwomxplayer --config pi -F clip udp://239.0.1.23:1234?buffer_size=1200000B
