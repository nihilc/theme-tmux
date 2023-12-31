#!/usr/bin/env bash

declare -A MODULES
MODULES=(
    ["session_icon"]="$(get_opt "@theme_module_session_icon" "")"
    ["session_color"]="$(get_opt "@theme_module_session_color" "01")"
    ["session_text"]="$(get_opt "@theme_module_session_text" "#S")"

    ["user_icon"]="$(get_opt "@theme_module_user_icon" "")"
    ["user_color"]="$(get_opt "@theme_module_user_color" "02")"
    ["user_text"]="$(get_opt "@theme_module_user_text" "$(whoami)")"

    ["host_icon"]="$(get_opt "@theme_module_host_icon" "")"
    ["host_color"]="$(get_opt "@theme_module_host_color" "03")"
    ["host_text"]="$(get_opt "@theme_module_host_text" "#H")"

    ["date_icon"]="$(get_opt "@theme_module_date_icon" "")"
    ["date_color"]="$(get_opt "@theme_module_date_icon" "04")"
    ["date_text"]="$(get_opt "@theme_module_date_text" "%Y-%m-%d")"

    ["time_icon"]="$(get_opt "@theme_module_time_icon" "")"
    ["time_color"]="$(get_opt "@theme_module_time_icon" "05")"
    ["time_text"]="$(get_opt "@theme_module_time_text" "%H:%M")"
)

build_module(){
    local mod_name=$1
    local style=$2
    local status=$3
    local isFirst=$4
    local isLast=$5

    local color_bg mod_icon mod_color mod_text show_icon show_text show_sep_left show_sep_right show_sep_middle

    color_bg=00

    mod_icon=${MODULES[${mod_name}_icon]}
    mod_color=${MODULES[${mod_name}_color]}
    mod_text=${MODULES[${mod_name}_text]}

    show_sep_left="$(separator_left "$mod_color" "$style" "$status" "$isFirst")"
    show_sep_right="$(separator_right "$mod_color" "$style" "$status" "$isLast")"
    show_sep_middle="$(separator_middle "$mod_color" "$style" "$status")"

    show_icon="#[fg=${COLORS[$color_bg]},bg=${COLORS[$mod_color]}] $mod_icon "
    show_text="#[fg=${COLORS[$mod_color]},bg=${COLORS[$color_bg]}] $mod_text "

    echo "$show_sep_left$show_icon$show_sep_middle$show_text$show_sep_right"
}
