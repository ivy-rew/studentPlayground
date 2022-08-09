#!/bin/bash

read -p "How many random numbers do you want to generate?: " numberOfNumbers

echo "Your generated numbers are:"
for n in `seq $numberOfNumbers`;
do
    echo (( RANDOM % 100 ))
done
