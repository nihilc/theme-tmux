#!/usr/bin/env bash

#      

separator_left(){
    local color=$1
    local color_bg=00
    local style=$2
    local status=$3
    local isFirst=$4
    local spaced=${OPTIONS['status_spaced']}

    local sep=""

    if [ "$status" == "left" ]
    then
        [ "$spaced" == true ] && color_bg="bg"

        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"

        [ "$isFirst" == true ] && sep=""
    else
        [ "$isFirst" == true ] || [ "$spaced" == true ] && color_bg="bg"

        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
    fi

    echo "$sep"
}
separator_right(){
    local color=00
    local color_bg="bg"
    local style=$2
    local status=$3
    local isLast=$4
    local spaced=${OPTIONS['status_spaced']}

    local sep=""

    if [ "$status" == "left" ]
    then
        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
    else
        [ "$style" == "a" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
        [ "$style" == "b" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
        [ "$style" == "c" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
        [ "$style" == "d" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
    fi
    [ "$style" == "none" ] && sep="#[bg=${COLORS[$color_bg]}] "

    # Add with space in last left status module
    if [ "$status" == "left" ] && [ "$isLast" == true ]
    then
        end_space="#[bg=${COLORS[bg]}] "
        sep+=$end_space
    fi

    # Delete separator if isn't set spaced, except for the last in left status
    [ "$spaced" == false ] && [ "$isLast" == false ] && sep=""
    # Delete separator in last right status module
    [ "$status" == "right" ] && [ "$isLast" == true ] && sep=""

    echo "$sep"
}
separator_middle(){
    local color=$1
    local color_bg=00
    local style=$2
    local status=$3

    local sep=""

    case $style in
        "a")
            [ "$status" == "left" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
            [ "$status" == "right" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
            ;;
        "b")
            [ "$status" == "left" ] && sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]"
            [ "$status" == "right" ] && sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]"
            ;;
        "c") sep="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}]" ;;
        "d") sep="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}]" ;;
    esac

    echo "$sep"
}
