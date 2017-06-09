# What

PiWall is a tool that splits video from a single controller across any number of raspberry pi devices.

# How

Use the Piwall instructions (below) to get piwall tools and libs installed on a master image for the pi's.  After master is created and tested, clone to other microSD's and adjust networking as needed.

# Configuration

On initial SD installation, update and upgrade the apt packages.  
The pwlibs and pwomxplayer packages have to be installed.
The openssh-server package has to be enabled (installed and disabled by default)
The keyboard configuration has to be changed to EN_US ("Raspberry Pi Configuration") if you're on a US keyboard.
pwomxplayer must be able to play on the pi a video file. 

The piwall configuration (see Dotpiwall file) contains the layout. Each screen is considered a "tile". Assume we have a 5x3 layout. 

| col1 | col2 | col3 | col4 | col5 |
--- | --- | --- | --- | ---
 11 | 12 | 13 | 14 | 15 
 21 | 22 | 23 | 24 | 25 
 31 | 32 | 33 | 34 | 35 

And let's say we want to only use certain displays:

| - | - | - | - | - |
--- | --- | --- | --- | ---
xx | xx | **13** | xx | xx
xx | **22** | xx | **24** | xx
**31** | xx | **33** | xx | **35**

The PiWall software determines which tile it is from a separate configuration file called "/home/pi/.pitile", which should look like the following:
 
> [tile]

> id=pi_YY
 
Where YY is the chosen tile name.

# Other info

The networking dependencies can make or break you.  The tile id's can also cause problems; be sure they're all unique. Pi zero w's over wifi can work, but will be very limited in the relative quality/resolution you can pass them.

# These tools

Most are quick and dirty for the event this was used at.  Any of these that connect to tiles, rely on ssh.  I used a private lan with passwordless ssh keys, your choices should be appropriate to venue and relative security.  

"tilecontrol.sh" is the most important, it can stop/start/restart/reboot/assign/id a tile, individually or en masse.
"startall.sh" is self-explanatory.
"stopallsh" is as well. 
"playclip.sh" is used to play a clip one time.
"loopclip.sh" is used to replay a clip for a length of time.

# URLS

 - http://www.piwall.co.uk/information/installation
 - https://www.youtube.com/watch?v=68OdE9_-8fE
 - https://www.raspberrypi.org/downloads/raspbian/
 - https://groups.google.com/forum/?hl=en-GB#!searchin/piwall-users/config|sort:relevance/piwall-users/Hg7XOzt2CyA/uw_IN3En8hAJ







