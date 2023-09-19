#!/usr/bin/env bash

mod_user(){
    local fg=$1
    local bg=$c_black1
    local icon="$(get_opt "@theme_user_icon" "")"
    local text="$(get_opt "@theme_user_text" "$(whoami)")"

    built_mod "$fg" "$bg" "$icon" "$text"
}
mod_host(){
    local fg=$1
    local bg=$c_black1
    local icon="$(get_opt "@theme_host_icon" "")"
    local text="$(get_opt "@theme_host_text" "#H")"

    built_mod "$fg" "$bg" "$icon" "$text"
}
mod_date(){
    local fg=$1
    local bg=$c_black1
    local icon="$(get_opt "@theme_date_icon" "")"
    local text="$(get_opt "@theme_date_text" "%Y-%m-%d")"

    built_mod "$fg" "$bg" "$icon" "$text"
}
mod_time(){
    local fg=$1
    local bg=$c_black1
    local icon="$(get_opt "@theme_time_icon" "")"
    local text="$(get_opt "@theme_time_text" "%H:%M")"

    built_mod "$fg" "$bg" "$icon" "$text"
}

status_right(){
    local c_user="$(get_opt "@theme_user_color" "$c_10")"
    local c_host="$(get_opt "@theme_host_color" "$c_04")"
    local c_date="$(get_opt "@theme_date_color" "$c_12")"
    local c_time="$(get_opt "@theme_time_color" "$c_07")"

    echo "$(sep_up $c_bg $c_user)$(mod_user $c_user)$(sep_up_doble $c_black1 $c_host)$(mod_host $c_host)$(sep_up_doble $c_black1 $c_date)$(mod_date $c_date)$(sep_up_doble $c_black1 $c_time)$(mod_time $c_time)"
}
