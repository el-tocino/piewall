# What

PiWall is a tool that splits video from a single controller across any number of raspberry pi devices.
We are using it to make the Crag Video Wall function.

# How

Use the Piwall instructions (below) to get piwall tools and libs installed on a master SD image for the pi's.  After master is created and tested, clone to other SD's and adjust networking as needed.

# Configuration

On initial SD installation, update and upgrade the apt packages.  
Each pi is assigned a static address corresponding to its positions on the crag wall plus 100.  This number represents the last octet of the IP address.  The controller would be ip .100.  
The pwlibs and pwomxplayer packages have to be installed.
The openssh-server package has to be enabled (installed and disabled by default)
The keyboard configuration has to be changed to EN_US ("Raspberry Pi Configuration")
pwomxplayer must be able to play on the pi a video file (currently Inception_hallway_fight.mp4). 

The piwall configuration (see Dotpiwall file) contains the layout. Each screen is considered a "tile". In order to make this simpler, for (6th monitor) configuration purposes, assume we have a 5x3 layout. 

| - | - | - | - | - |
--- | --- | --- | --- | ---
 11 | 12 | 13 | 14 | 15 
 21 | 22 | 23 | 24 | 25 
 31 | 32 | 33 | 34 | 35 


Our layout only uses the following (after we get sixth monitor):

| - | - | - | - | - |
--- | --- | --- | --- | ---
xx | xx | **13** | xx | xx
xx | **22** | xx | **24** | xx
**31** | xx | **33** | xx | **35**

The PiWall software determines which tile it is from a separate configuration file called "/home/pi/.pitile", which should look like the following:
 
> [tile]

> id=pi_YY
 
Where YY is the chosen tile name.

For Dinoslam, we're going to have a 2x5 layout.  

# Other info

The following should be added to the hosts file:
> 192.168.16.101 zero1

> 192.168.16.102 zero2

> 192.168.16.103 zero3

> 192.168.16.104 zero4

> 192.168.16.105 zero5

> 192.168.16.106 zero6

> 192.168.16.100 controller




# URLS

 - http://www.piwall.co.uk/information/installation
 - https://www.youtube.com/watch?v=68OdE9_-8fE
 - https://www.raspberrypi.org/downloads/raspbian/
 - https://groups.google.com/forum/?hl=en-GB#!searchin/piwall-users/config|sort:relevance/piwall-users/Hg7XOzt2CyA/uw_IN3En8hAJ







