#!/usr/bin/env bash

declare -A OPTIONS=(
    ["status_space_between"]="$(get_opt "@theme_status_space_between" "true")"
    ["status_left_style"]="$(get_opt "@theme_status_left_style" "none")"
    ["status_right_style"]="$(get_opt "@theme_status_right_style" "none")"
    ["status_left_modules"]="$(get_opt "@theme_status_left_modules" "session")"
    ["status_right_modules"]="$(get_opt "@theme_status_right_modules" "user host date time")"
)

status_left(){
    local modules style

    modules=${OPTIONS["status_left_modules"]}
    style=${OPTIONS["status_left_style"]}

    read -r -a modules <<< "$modules"
    for i in "${!modules[@]}"
    do
        isFirst="false"
        isLast="false"
        # Check the index and find if is first or last
        [ "$i" == 0 ] && isFirst="true"
        [ $((i + 1)) == ${#modules[*]} ] && isLast="true"

        build_module "${modules[$i]}" "$style" "left" "$isFirst" "$isLast"
    done

}
status_right(){
    local modules style

    modules=${OPTIONS["status_right_modules"]}
    style=${OPTIONS["status_right_style"]}

    read -r -a modules <<< "$modules"
    for i in "${!modules[@]}"
    do
        isFirst="false"
        isLast="false"
        # Check the index and find if is first or last
        [ "$i" == 0 ] && isFirst="true"
        [ $((i + 1)) == ${#modules[*]} ] && isLast="true"

        build_module "${modules[$i]}" "$style" "right" "$isFirst" "$isLast"
    done
}
