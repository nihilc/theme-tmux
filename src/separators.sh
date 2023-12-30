#!/usr/bin/env bash

#      

separator_left(){
    local color=$1
    local style=$2
    local status=$3
    local isFirst=$4

    local sep=""

    if [ "$status" == "left" ]
    then
        [ "$style" == "a" ] && sep="#[fg=${COLORS[black1]},bg=${COLORS[$color]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[black1]},bg=${COLORS[$color]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[black1]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[black1]},bg=${COLORS[$color]}]"

        [ "$isFirst" == "true" ] && sep=""
    else
        [ "$isFirst" == "true" ] && bg="bg" || bg="black1"

        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$bg]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$bg]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$bg]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$bg]},bg=${COLORS[$color]}]"
    fi

    echo "$sep"
}
separator_right(){
    local color=$1
    local style=$2
    local status=$3
    local isLast=$4

    local sep=""

    if [ "$status" == "left" ] && [ "$isLast" == "true" ]
    then
        color="black1"
        bg="bg"

        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$bg]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$bg]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$bg]},bg=${COLORS[$color]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$bg]}]"

        end_space="#[bg=${COLORS[bg]}] "
        sep+=$end_space
    fi

    echo "$sep"
}
separator_middle(){
    local color=$1
    local style=$2
    local status=$3

    local sep=""

    case $style in
        "a")
            [ "$status" == "left" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[black1]}]"
            [ "$status" == "right" ] && sep="#[fg=${COLORS[black1]},bg=${COLORS[$color]}]"
            ;;
        "b")
            [ "$status" == "left" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[black1]}]"
            [ "$status" == "right" ] && sep="#[fg=${COLORS[black1]},bg=${COLORS[$color]}]"
            ;;
        "c") sep="#[fg=${COLORS[black1]},bg=${COLORS[$color]}]" ;;
        "d") sep="#[fg=${COLORS[$color]},bg=${COLORS[black1]}]" ;;
    esac

    echo "$sep"
}
