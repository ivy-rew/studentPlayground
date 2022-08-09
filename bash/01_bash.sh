#!/bin/bash
read -p "name: " name
read -p "age: " age
read -p "city: " city

myfunction() {
    echo "person $name is $age years old and lives in $city"
}

myfunction
