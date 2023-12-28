#!/usr/bin/env bash

status_left(){
    local modules style

    modules="$(get_opt "@theme_status_left_modules" "session")"
    style="$(get_opt "@theme_status_left_style" "none")"

    read -r -a modules <<< "$modules"
    for module in "${modules[@]}"
    do
        build_module "$module" "$style" "left"
    done

}
status_right(){
    local modules style

    modules="$(get_opt "@theme_status_right_modules" "user host date time")"
    style="$(get_opt "@theme_status_right_style" "none")"

    read -r -a modules <<< "$modules"
    for module in "${modules[@]}"
    do
        build_module "$module" "$style" "right"
    done
}
