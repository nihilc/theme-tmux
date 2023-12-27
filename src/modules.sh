#!/usr/bin/env bash

declare -A MODULES
MODULES=(
    ["session_icon"]="$(get_opt "@theme_mod_session_icon" "")"
    ["session_color"]="$(get_opt "@theme_mod_session_color" "01")"
    ["session_text"]="$(get_opt "@theme_mod_session_text" "#S")"

    ["user_icon"]="$(get_opt "@theme_mod_user_icon" "")"
    ["user_color"]="$(get_opt "@theme_mod_user_color" "02")"
    ["user_text"]="$(get_opt "@theme_mod_user_text" "$(whoami)")"

    ["host_icon"]="$(get_opt "@theme_mod_host_icon" "")"
    ["host_color"]="$(get_opt "@theme_mod_host_color" "03")"
    ["host_text"]="$(get_opt "@theme_mod_host_text" "#H")"

    ["date_icon"]="$(get_opt "@theme_mod_date_icon" "")"
    ["date_color"]="$(get_opt "@theme_mod_date_icon" "04")"
    ["date_text"]="$(get_opt "@theme_mod_date_text" "%Y-%m-%d")"

    ["time_icon"]="$(get_opt "@theme_mod_time_icon" "")"
    ["time_color"]="$(get_opt "@theme_mod_time_icon" "05")"
    ["time_text"]="$(get_opt "@theme_mod_time_text" "%H:%M")"
)

build_module(){
    local mod_name=$1
    local mod_icon=${MODULES[${mod_name}_icon]}
    local mod_color=${MODULES[${mod_name}_color]}
    local mod_text=${MODULES[${mod_name}_text]}

    echo "#[fg=${COLORS[black1]},bg=${COLORS[$mod_color]}] $mod_icon #[fg=${COLORS[$mod_color]},bg=${COLORS[black1]}] $mod_text "
}
