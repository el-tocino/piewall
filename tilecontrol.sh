#!/bin/bash
#
# control the player (startplayer.sh) on tiles
#

if [[ $# -lt 3 ]] ; then
    echo "Usage: $0 WALL action [options].
           start PIIP
           stop PIIP
           restart PIIP
           id PIIP
           reboot PIIP 
           assign PIIP TILEID
"
fi
PIWALL="$1"
shift
SSHUSER="pi"
SSHOPT="-o ConnectTimeout=10"
IPP="192.168.16.10"
STARTPLYR="'screen -mdS ${PIWALL} /home/pi/startplayer.sh'"
STOPPLYR="'screen -X -S ${PIWALL} quit'"
IDPLYR="'export DISPLAY=:0.0 ; leafpad /home/pi/playerid.txt'"
STOPID="sleep 60 && killall leafpad"
RBC="sudo reboot"
PACT="${1}" 
TILECMD1="sed -i /home/pi/.pitile -e 's/^id*/id="
shift

sshtile() {
echo "ssh ${SSHOPT} ${SSHUSER}@${IPP}$*"
ssh "${SSHOPT}"  "${SSHUSER}@${IPP}$*"
}

startplayer() {
if sshtile "${1}" "${STARTPLYR}" ; then
    echo "Started player in screen on Pi${1}."        
else 
    echo "Failed to start player on pi${1}!"
    return 161
fi

}

stopplayer() {
if sshtile "${1}" "${STOPPLYR}" ; then
  echo "Stopped screen on Pi${1}."
else
  if sshtile "${1}" "killall screen" ; then 
     echo "Stopped all screens on Pi${1}."
  else
    echo "Failed to stop player on Pi${1}!"
    return 162
  fi
fi
}

idplayer() {
if sshtile "${1}" "echo ${1} ${1} ${1} > /home/pi/playerid.txt" ; then
    if sshtile "${1}" "${IDPLYR}" ; then
         sshtile "${1}" "${STOPID}" 
    else
         echo "Unable to start leafpad on Pi${1}!"
         return 164
    fi
else
    echo "Unable to write ID file on Pi${1}!"
    return 164
fi
rm  /home/pi/playerid.txt
}

assign() {
if sshtile "${1}" "${TILECMD1}""$2" ; then
    echo "Assigned tile $1 the ID $2!"
else
    echo "Unable to assign tile $1 the ID $2!"
    return 168
fi

}

rebootpi() {
sshtile "${1}" "${RBC}"
}

while [[ $# -gt 0 ]] ; do
    if [[ "${1}" =~ ^(1|2|3|4|5|6)$ ]]; then
        PLYR="${1}"
        shift;
        case "${PACT}" in
            start) startplayer "${PLYR}" ;;
            stop) stopplayer "${PLYR}" ;;
            restart) stopplayer "${PLYR}" ; startplayer "${PLYR}" ;;
            id) idplayer "${PLYR}" ;;
            reboot) rebootpi "${PLYR}" ;;
            assign) assign "${PLYR}" "$1"; shift ;;
            *) echo "invalid argument ${PLYR}" ;;
        esac
    else
        echo "${1} needs to be a number from 1-6!"
        shift;
    fi
done
exit 0
