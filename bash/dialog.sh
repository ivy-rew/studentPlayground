#!/bin/bash

. volume.sh TEST
. cpuUsage.sh TEST

cpu_usageUi() {
    (
    while :
    do
    get_cpu_usage
    sleep 2
    done 
    ) | 
    dialog --title "CPU usage" --gauge "CPU usage" 10 100 0
}

volumeUi(){
    volume=$(dialog --title "Sound" --rangebox "Current volume" 5 60 0 100 $(get_volume) 2>&1 >/dev/tty)
    set_volume $volume
}

if [[ "$1" != "test" ]]; then
    choice=$(dialog --menu "Dialog menu" 0 0 0 1 "cpu usage" \
        2 "volume" \
        2>&1 >/dev/tty)
    case $choice in
    1) cpu_usageUi ;;
    2) volumeUi ;;
    esac
fi
