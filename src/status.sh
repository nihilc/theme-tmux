#!/usr/bin/env bash

status_left(){
    local modules style show_modules

    modules=${OPTIONS["status_left_modules"]}
    style=${OPTIONS["status_left_style"]}

    read -r -a modules <<< "$modules"
    for i in "${!modules[@]}"
    do
        isFirst=false
        isLast=false
        # Check the index and find if is first or last
        [ "$i" == 0 ] && isFirst=true
        [ $((i + 1)) == ${#modules[*]} ] && isLast=true

        show_modules+="$(build_module "${modules[$i]}" "$style" "left" "$isFirst" "$isLast")"
    done

    echo "$show_modules"
}
status_right(){
    local modules style show_modules

    modules=${OPTIONS["status_right_modules"]}
    style=${OPTIONS["status_right_style"]}

    read -r -a modules <<< "$modules"
    for i in "${!modules[@]}"
    do
        isFirst=false
        isLast=false
        # Check the index and find if is first or last
        [ "$i" == 0 ] && isFirst=true
        [ $((i + 1)) == ${#modules[*]} ] && isLast=true

        show_modules+="$(build_module "${modules[$i]}" "$style" "right" "$isFirst" "$isLast")"
    done

    echo "$show_modules"
}
