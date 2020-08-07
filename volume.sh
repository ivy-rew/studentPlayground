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

get_current_volume() {
    percent=$(awk -F"[][]" '/dB/ {print $2}' <(amixer sget Master))
    echo "${percent//%}"
}

while true; do
current_volume=$(get_current_volume)
if [ $current_volume -gt 81 ]
then
    amixer sset -q Master 80%
    echo "Music is too loud!!! Set to 80%"
fi
sleep 1
done