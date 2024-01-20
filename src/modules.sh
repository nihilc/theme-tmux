#!/usr/bin/env bash

declare -A MODULES
MODULES=(
    ["session_icon"]="$(get_opt "@theme_module_session_icon" "")"
    ["session_text"]="$(get_opt "@theme_module_session_text" "#S")"
    ["session_color1"]="$(get_opt "@theme_module_session_color1" "01")"
    ["session_color2"]="$(get_opt "@theme_module_session_color2" "00")"

    ["user_icon"]="$(get_opt "@theme_module_user_icon" "")"
    ["user_text"]="$(get_opt "@theme_module_user_text" "$(whoami)")"
    ["user_color1"]="$(get_opt "@theme_module_user_color1" "02")"
    ["user_color2"]="$(get_opt "@theme_module_user_color2" "00")"

    ["host_icon"]="$(get_opt "@theme_module_host_icon" "")"
    ["host_text"]="$(get_opt "@theme_module_host_text" "#H")"
    ["host_color1"]="$(get_opt "@theme_module_host_color1" "03")"
    ["host_color2"]="$(get_opt "@theme_module_host_color2" "00")"

    ["date_icon"]="$(get_opt "@theme_module_date_icon" "")"
    ["date_text"]="$(get_opt "@theme_module_date_text" "%Y-%m-%d")"
    ["date_color1"]="$(get_opt "@theme_module_date_color1" "04")"
    ["date_color2"]="$(get_opt "@theme_module_date_color2" "00")"

    ["time_icon"]="$(get_opt "@theme_module_time_icon" "")"
    ["time_text"]="$(get_opt "@theme_module_time_text" "%H:%M")"
    ["time_color1"]="$(get_opt "@theme_module_time_color1" "05")"
    ["time_color2"]="$(get_opt "@theme_module_time_color2" "00")"

    ["window_default_icon"]="$(get_opt "@theme_window_default_icon" "#I#F")"
    ["window_default_text"]="$(get_opt "@theme_window_default_text" "#W")"
    ["window_default_color1"]="$(get_opt "@theme_window_default_color1" "15")"
    ["window_default_color2"]="$(get_opt "@theme_window_default_color2" "08")"

    ["window_current_icon"]="$(get_opt "@theme_window_current_icon" "#I#F")"
    ["window_current_text"]="$(get_opt "@theme_window_current_text" "#W")"
    ["window_current_color1"]="$(get_opt "@theme_window_current_color1" "06")"
    ["window_current_color2"]="$(get_opt "@theme_window_current_color2" "00")"
)

build_module(){
    local mod_name=$1
    local style=$2
    local status=$3
    local isFirst=$4
    local isLast=$5
    local isSpaced=$6

    local icon text color1 color2 color_bg sep_l sep_m sep_r

    icon=${MODULES[${mod_name}_icon]}
    text=${MODULES[${mod_name}_text]}

    color1=${MODULES[${mod_name}_color1]}
    color2=${MODULES[${mod_name}_color2]}
    color_bg='bg'

    # Build style separators spaced
    if [ "$status" == "left" ]
    then
        sep_l="$(separator "$color_bg" "$color1" "$style" "right")"
        sep_m="$(separator "$color1" "$color2" "$style" "right")"
        sep_r="$(separator "$color2" "$color_bg" "$style" "right")"
    fi
    if [ "$status" == "right" ]
    then
        sep_l="$(separator "$color1" "$color_bg" "$style" "left")"
        sep_m="$(separator "$color2" "$color1" "$style" "left")"
        sep_r="$(separator "$color_bg" "$color2" "$style" "left")"
    fi
    if [ "$style" == "none" ] && [ "$isLast" == false ]
    then
        sep_l=""
        sep_m=""
        sep_r="#[bg=${COLORS[$color_bg]}] "
    fi

    # Rebuild separators for not spaced
    if [ "$isSpaced" == false ]
    then
        # rebuild left with right colors
        if [ "$status" == "left" ]
        then
            sep_l="$(separator "$color2" "$color1" "$style" "right")"
        fi
        if [ "$status" == "right" ] && [ "$isFirst" == false ]
        then
            sep_l="$(separator "$color1" "$color2" "$style" "left")"
        fi
        # remove right separator
        [ "$isLast" == false ] && sep_r=""
    fi

    # Delete separator in the extremes
    [ "$status" == "left" ] && [ "$isFirst" == true ] && sep_l=""
    [ "$status" == "right" ] && [ "$isLast" == true ] && sep_r=""

    show_icon="#[fg=${COLORS[$color2]},bg=${COLORS[$color1]}] $icon "
    show_text="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}] $text "

    echo "$sep_l$show_icon$sep_m$show_text$sep_r"
}
