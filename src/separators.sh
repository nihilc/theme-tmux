#!/usr/bin/env bash

#      

separator_left(){
    echo "#[bg=${COLORS[bg]}] "
}
separator_right(){
    echo "#[bg=${COLORS[bg]}] "
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
