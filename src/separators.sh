#!/usr/bin/env bash

#      

separator(){
    local color1=$1
    local color2=$2
    local style=$3
    local direction=$4

    local sep=""

    if [ "$direction" == "left" ]
    then
        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color2]},bg=${COLORS[$color1]}]"
    fi
    if [ "$direction" == "right" ]
    then
        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color2]},bg=${COLORS[$color1]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}]"
    fi

    echo "$sep"
}
