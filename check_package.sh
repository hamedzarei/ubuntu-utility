#!/usr/bin/env bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
#echo "enter your package name"
#read name
name=$1

dpkg -s $name &> /dev/null

if [ $? -ne 0 ]

    then
        echo "installing $name"
        sudo apt-get update
        sudo apt-get install $name

    else
#        printf    "$name xE2\x9C\x94"
        /usr/bin/printf "$name $GREEN\xE2\x9C\x94$NC\n"
fi