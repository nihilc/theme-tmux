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

    white_space="#[bg=${COLORS[bg]}] "
    echo "$show_modules$white_space"
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

    white_space="#[bg=${COLORS[bg]}] "
    echo "$white_space$show_modules"
}

status_window(){
    local style index text color color_bg

    style=${OPTIONS["window_style"]}
    color=${OPTIONS["window_color_default"]}
    color_bg=${OPTIONS["window_color_default_bg"]}

    index=${OPTIONS["window_index"]}
    text=${OPTIONS["window_text"]}

    sep_l=""
    sep_r=""
    sep_m=""

    show_index="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}] $index "
    show_text="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}] $text "

    show_sep_l=""
    show_sep_r=""
    show_sep_m=""

    echo "$show_sep_l$show_index$show_sep_m$show_text$show_sep_r"
}
status_window_active(){
    local style index text color color_bg

    style=${OPTIONS["window_style"]}
    color=${OPTIONS["window_color_current"]}
    color_bg=${OPTIONS["window_color_current_bg"]}

    index=${OPTIONS["window_index"]}
    text=${OPTIONS["window_text"]}

    show_sep_l=""
    show_sep_r=""
    show_sep_m=""

    show_index="#[fg=${COLORS[$color_bg]},bg=${COLORS[$color]}] $index "
    show_text="#[fg=${COLORS[$color]},bg=${COLORS[$color_bg]}] $text "

    echo "$show_sep_l$show_index$show_sep_m$show_text$show_sep_r"
}
