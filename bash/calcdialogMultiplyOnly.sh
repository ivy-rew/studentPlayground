#!/bin/bash

number1=$(dialog --inputbox "Number 1" 10 30 2>&1 >/dev/tty)
number2=$(dialog --inputbox "What do you want to multiply $number1 with?" 10 30 2>&1 >/dev/tty)

dialog --infobox "The result is $(($number1*$number2))" 10 30