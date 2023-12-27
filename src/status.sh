#!/usr/bin/env bash

status_left(){
    left_modules="$(get_opt "@theme_left_modules" "session")"
    read -r -a modules <<< "$left_modules"

    for module in "${modules[@]}"
    do
        build_module "$module"
    done

}
status_right(){
    right_modules="$(get_opt "@theme_right_modules" "user host date time")"
    read -r -a modules <<< "$right_modules"

    for module in "${modules[@]}"
    do
        build_module "$module"
    done
}
