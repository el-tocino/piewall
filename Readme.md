# What

PiWall is a tool that splits video from a single controller across any number of raspberry pi devices. This repo is just support tools for an install of pi wall. See url's below for more.

# How

Use the Piwall instructions (linked below) to get piwall tools and libs installed on a master image for the pi's.  After master is created and tested, clone to other microSD's and adjust networking as needed. 

# Configuration

On initial SD installation, update and upgrade the apt packages.  
The pwlibs and pwomxplayer packages have to be installed.
The openssh-server package has to be enabled (installed and disabled by default)
The keyboard configuration has to be changed to EN_US ("Raspberry Pi Configuration") if you're on a US keyboard.
pwomxplayer must be able to play on the pi a video file. 
Strongly recommend ssh keys (passwordless) for ease of use and bad security.  

The piwall configuration (see Dotpiwall file) contains the layout. Each screen is considered a "tile". Assume we have a 5x3 layout. 

| col1 | col2 | col3 | col4 | col5 |
--- | --- | --- | --- | ---
 11 | 12 | 13 | 14 | 15 
 21 | 22 | 23 | 24 | 25 
 31 | 32 | 33 | 34 | 35 

The PiWall software determines which tile it is from a separate configuration file called "/home/pi/.pitile", which should look like the following:
 
> [tile]

> id=pi_YY
 
Where YY is the chosen tile name.

# Other info

The networking dependencies can make or break you.  The tile id's can also cause problems; be sure they're all unique. Pi zero w's over wifi can work, but will be very limited in the relative quality/resolution you can pass them.

# These tools

Most are quick and dirty for the event this was used at.  Any of these that connect to tiles, rely on ssh.  I used a private lan with passwordless ssh keys, your choices should be appropriate to venue and relative security.  Most are meant to be run on the controller only.

"tilecontrol.sh" is the most important, it can stop/start/restart/reboot/assign/id a tile, individually or en masse.

"startall.sh" and "stopall.sh" just bulk start/stop tiles (6 in my case).

"playclip.sh" is used to play a clip one time.

"loopclip.sh" is used to replay a clip for a length of time.

The one tile-based script:
"startplayer.sh" is used on the tiles to initiate the player.

# URLS

 - http://www.piwall.co.uk/information/installation
 - https://www.youtube.com/watch?v=68OdE9_-8fE
 - https://www.raspberrypi.org/downloads/raspbian/
 - https://groups.google.com/forum/?hl=en-GB#!searchin/piwall-users/config|sort:relevance/piwall-users/Hg7XOzt2CyA/uw_IN3En8hAJ

# TODO

Add a slideshow player for still pics. 

