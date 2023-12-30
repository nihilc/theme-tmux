#!/usr/bin/env bash

status_left(){
    local modules style

    modules="$(get_opt "@theme_status_left_modules" "session")"
    style="$(get_opt "@theme_status_left_style" "none")"

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

    modules="$(get_opt "@theme_status_right_modules" "user host date time")"
    style="$(get_opt "@theme_status_right_style" "none")"

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
