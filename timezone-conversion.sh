#!/bin/bash
# Convert timezone from GMT to PST.
# Can be modified for different timezones by changing the TZ
# Usage: gmt2pst "2016-10-22 05:25:22"

gmt2pst() {
    if [ -z "$1" ]; then
        echo "Date Parameter is missing. It should be of format 2016-10-22 05:25:22" 
        exit 1
    else
        mydate=$1
    fi

    if date --version >/dev/null 2>&1 ; then
        TZ=PST8PDT date +"%m/%d/%Y %H:%M" -d "TZ=\"Etc/GMT\" ${mydate}"
        # TZ=PST8PDT date +"%Y-%m-%d %H:%M:%S" -d "TZ=\"Etc/GMT\" ${mydate:3:3} ${mydate%%/*} ${mydate:7:4} ${mydate#*:}"
    else
        TZ=PST8PDT date -j -f "%Y-%m-%d %H:%M:%S %Z" "${mydate} GMT" +"%Y-%m-%d %H:%M:%S"
    fi 
}