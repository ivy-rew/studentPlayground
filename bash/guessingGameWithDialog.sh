#!/bin/bash


gameLoop() {
    number=$(( RANDOM % 100))
    guessNumber=101
    guessAmount=0
    while [ "$guessNumber" != "$number" ]; do
        guessNumber=$(dialog --inputbox "Guess the number? $number" 10 30 2>&1 >/dev/tty)
        if [ "$guessNumber" -gt "$number" ]; then
            dialog --msgbox "that is too high" 10 30 
        elif [ "$guessNumber" -lt "$number" ]; then
            dialog --msgbox "that is too low" 10 30 
        fi
        ((guessAmount++))
    done
    dialog --msgbox "Correct! the number was $number. your number was $guessNumber you guessed it in $guessAmount tries" 10 30 
    restartGame=$(dialog --yesno "Want to restart the game?" 10 30 2>&1 >/dev/tty)
    case $? in
        0) gameLoop;;
        1) exit;;
    esac
}

gameLoop
