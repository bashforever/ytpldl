#!/bin/bash
# Script doing the following tasks
# downloadn playlist and storing mp3 as audio

# Parameters:
# $1 ... youtube-url (use parentheses!)

# globale Konstante
LOGFILE="ytdlpl.log"

VIDEO="$1"
WORKDIR="/home/yourname/Audiofiles"


# ====================== function getmovie =========================
getmovie () {
    cd "$WORKDIR"
    logtext "Looking for $VIDEO"

    youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" "$VIDEO"

}

# ===================== function logtext ======================================
# Parameter: Text der ins Logfile geschrieben werden soll
# function for writing text to logfile
logtext () {
   echo "`date`: " $1 2>&1 | tee -a $LOGFILE
}   

# ============================ MAIN ===================================

logtext  "==================  Starting ytac ==================  "
cd $WORKDIR
logtext "starting at dir: $WORKDIR"
getmovie

logtext "ytac finished!"

exit 0

# End of Main


# EOF
