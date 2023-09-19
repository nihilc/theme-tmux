#!/usr/bin/env bash

mod_session(){
    local fg="#{?client_prefix,$2,$1}"
    local bg=$c_black1
    local icon="$(get_opt "@theme_session_icon" "")"
    local text="$(get_opt "@theme_session_text" "#S")"

    built_mod "$fg" "$bg" "$icon" "$text"
}

status_left(){
    local c_session="$(get_opt "@theme_session_color" "$c_01")"
    local c_session_active="$(get_opt "@theme_session_color_active" "$c_03")"

    echo "$(mod_session "$c_session" "$c_session_active")$(sep_up "$c_black1" "$c_bg")"
}
