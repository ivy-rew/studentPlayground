#!/bin/bash

# to get information about volume
# amixer sget Master

# send this data to awk and find line with defined strin (db)
# awk '/dB/' <(amixer sget Master)
# output: Mono: Playback 50 [57%] [-27.75dB] [on]

# get the value that we want 
# awk '/dB/ {print $4}' <(amixer sget Master)
# output: [57%]

# we dont want the brackets right? remove them
# awk -F"[][]" '/dB/ {print $2}' <(amixer sget Master)
# output: 57%

# -F sets separators. syntax: -F"[this_must_be_your_value]"

maxVol=80
targetVol=50
control="Master"

get_volume() {
    percent=$(awk -F"[][]" '/dB/ {print $2}' <(amixer sget $control))
    echo "${percent//%}"
}

set_volume() {
    amixer sset -q $control "$1%"
}

check_volume() {
    current_volume=$(get_volume)
    if [ $current_volume -gt $maxVol ]
    then
        set_volume $targetVol
        echo "Music is too loud!!! Set to 80%"
        espeak -v "de" "Mir ist das zu laut"
    fi
}

while true; do
    check_volume
    sleep 1
done