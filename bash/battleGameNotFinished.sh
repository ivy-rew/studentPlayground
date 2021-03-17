#!/bin/bash

healthPlayer1=100
healthPlayer2=100

while [ $healthPlayer1 -gt 0 ] || [ $healthPlayer2 -gt 0 ]; do
    echo "Player 1 has $healthPlayer1 health. Do you want to boost your atack(1) or defense(2)?"
    read option
    player1Damage=$((RANDOM % 15))
    player1Defense=$((RANDOM % 5))
    if [ $option -eq 1 ]; then
        ((player1Damage+=10))
    elif [ $option -eq 2 ];then
        ((player1Defense+=5))
    else
        exit
    fi
    player2Damage=$((RANDOM % 15))
    player2Defense=$((RANDOM % 5))
    if [ $(($player2Defense - $player1Damage)) -gt 0 ]; then
        echo "Player 2 blocked the attack!"
    else
        ((healthPlayer2-=player1Damage))
        echo "Player 2 lost $player1Damage health. His health is $healthPlayer2"
    fi

    echo "Player 2 has $healthPlayer2 health. Do you want to boost your atack(1) or defense(2)?"
    read option
    player2Damage=$((RANDOM % 15))
    player2Defense=$((RANDOM % 5))
    if [ $option -eq 1 ]; then
        ((player2Damage+=10))
    elif [ $option -eq 2 ];then
        ((player2Defense+=5))
    else
        exit
    fi
    player1Damage=$((RANDOM % 15))
    player1Defense=$((RANDOM % 5))
    if [ $(($player1Defense - $player2Damage)) -gt 0 ]; then
        echo "Player 1 blocked the attack!"
    else
        ((healthPlayer1-=player2Damage))
        echo "Player 1 lost $player1Damage health. His health is $healthPlayer1"
    fi
done
if [ $healthPlayer1 -lt 0 ]; do
    echo "Player 2 wins with $healthPlayer2 health!!!"
elif [ $healthPlayer2 -lt 0 ]; do
    echo "Player 1 wins with $healthPlayer1 health!!!"
fi