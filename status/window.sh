#!/usr/bin/env bash

mod_window(){
    local fg=$1
    local bg=$2
    local icon="$(get_opt "@theme_window_icon" "#I")"
    local text="$(get_opt "@theme_window_text" "#W")"

    built_mod "$fg" "$bg" "$icon" "$text"
}
mod_window_active(){
    local fg=$1
    local bg=$2
    local icon="$(get_opt "@theme_window_active_icon" "#I")"
    local text="$(get_opt "@theme_window_active_text" "#W")"

    built_mod "$fg" "$bg" "$icon" "$text"
}

status_window(){
    local c_window_fg="$(get_opt "@theme_window_fg" "$c_black1")"
    local c_window_bg="$(get_opt "@theme_window_bg" "$c_black0")"

    echo "$(sep_up "$c_bg" "$c_window_fg")$(mod_window "$c_window_fg" "$c_window_bg")$(sep_up "$c_window_bg" "$c_bg")"
}
status_window_active(){
    local c_window_fg="$(get_opt "@theme_window_active_fg" "$c_13")"
    local c_window_bg="$(get_opt "@theme_window_active_bg" "$c_black1")"
    local c_window_zoom="$(get_opt "@theme_window_active_zoom" "$c_14")"
    local c_window_color="#{?window_zoomed_flag,$c_window_zoom,$c_window_fg}"

    echo "$(sep_up "$c_bg" "$c_window_color")$(mod_window_active "$c_window_color" "$c_window_bg")$(sep_up "$c_window_bg" "$c_bg")"
}
