#!/bin/bash

name=$(dialog --inputbox "Whats your name?" 10 30 2>&1 >/dev/tty)
age=$(dialog --inputbox "Whats your age?" 10 30 2>&1 >/dev/tty)
city=$(dialog --inputbox "Where do you live?" 10 30 2>&1 >/dev/tty)
dialog --infobox "Name is $name, is $age old and lives in $city" 10 30
#echo $name