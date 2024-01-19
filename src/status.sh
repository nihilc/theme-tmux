#!/usr/bin/env bash

status_left(){
    local modules style spaced show_modules

    modules=${OPTIONS["modules_left"]}
    # check if is set specific style or use global
    style="${OPTIONS[style_left]:=${OPTIONS[style]}}"
    spaced="${OPTIONS[spaced_left]:=${OPTIONS[spaced]}}"

    read -r -a modules <<< "$modules"
    for i in "${!modules[@]}"
    do
        isFirst=false
        isLast=false
        # Check the index and find if is first or last
        [ "$i" == 0 ] && isFirst=true
        [ $((i + 1)) == ${#modules[*]} ] && isLast=true

        show_modules+="$(build_module "${modules[$i]}" "$style" "left" "$isFirst" "$isLast" "$spaced")"
    done

    white_space="#[bg=${COLORS[bg]}] "
    echo "$show_modules$white_space"
}
status_right(){
    local modules style spaced show_modules

    modules=${OPTIONS["modules_right"]}
    # check if is set specific style or use global
    style="${OPTIONS[style_right]:=${OPTIONS[style]}}"
    spaced="${OPTIONS[spaced_right]:=${OPTIONS[spaced]}}"

    read -r -a modules <<< "$modules"
    for i in "${!modules[@]}"
    do
        isFirst=false
        isLast=false
        # Check the index and find if is first or last
        [ "$i" == 0 ] && isFirst=true
        [ $((i + 1)) == ${#modules[*]} ] && isLast=true

        show_modules+="$(build_module "${modules[$i]}" "$style" "right" "$isFirst" "$isLast" "$spaced")"
    done

    white_space="#[bg=${COLORS[bg]}] "
    echo "$white_space$show_modules"
}

status_window(){
    local state=$1
    local style index text color1 color2 color_bg

    # check if is set specific style or use global
    style="${OPTIONS[style_window]:=${OPTIONS[style]}}"

    color1=${OPTIONS["window_color_${state}"]}
    color2=${OPTIONS["window_color_${state}_bg"]}
    color_bg="bg"

    index=${OPTIONS["window_index"]}
    text=${OPTIONS["window_text"]}

    sep_l="$(separator "$color_bg" "$color1" "$style" "right" )"
    sep_m="$(separator "$color1" "$color2" "$style" "right" )"
    sep_r="$(separator "$color2" "$color_bg" "$style" "right" )"

    white_space="#[bg=${COLORS[bg]}] "
    [ "$style" == "none" ] && sep_r=$white_space

    show_index="#[fg=${COLORS[$color2]},bg=${COLORS[$color1]}] $index "
    show_text="#[fg=${COLORS[$color1]},bg=${COLORS[$color2]}] $text "

    echo "$sep_l$show_index$sep_m$show_text$sep_r"
}
