#!/bin/bash

get_cpu_usage() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     get_linux_cpu_usage;;
        Darwin*)    get_macos_cpu_usage;;
    esac
}

get_macos_cpu_usage() {
    echo $(ps -A -o %cpu | awk '{s+=$1} END {print s}')
}

get_linux_cpu_usage() {
    # Get the first line with aggregate of all CPUs
    cpu_now=($(head -n1 /proc/stat))
    # Get all columns but skip the first (which is the "cpu" string)
    cpu_sum="${cpu_now[@]:1}"
    # Replace the column seperator (space) with +
    cpu_sum=$((${cpu_sum// /+}))
    # Get the delta between two reads
    cpu_delta=$((cpu_sum - cpu_last_sum))
    # Get the idle time Delta
    cpu_idle=$(( cpu_now[4] - cpu_last[4]))
    # Calc time spent working
    cpu_used=$((cpu_delta - cpu_idle))
    # Calc percentage
    cpu_usage=$((100 * cpu_used / cpu_delta))
    # Keep this as last for our next read
    cpu_last=("${cpu_now[@]}")
    cpu_last_sum=$cpu_sum
    echo $cpu_usage
}

if [ "$1" != "TEST" ]; then
    while true; do
        get_cpu_usage
        sleep 1
    done
elif [ "$1" != "ONCE" ]; then
    get_cpu_usage
fi
