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

    [ "$style" == "none" ] && white_space="#[bg=${COLORS[bg]}] "
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

    [ "$style" == "none" ] && white_space="#[bg=${COLORS[bg]}] "
    echo "$white_space$show_modules"
}

status_window(){
    local state=$1
    local justify style spaced

    justify="${OPTIONS[justify]}"

    # Global style
    style="${OPTIONS[style]}"
    # Check for side style
    [ "$justify" == "left" ] && style="${OPTIONS[style_left]:=${OPTIONS[style]}}"
    [ "$justify" == "right" ] && style="${OPTIONS[style_right]:=${OPTIONS[style]}}"
    # Check for specific style
    style="${OPTIONS[style_window]:=$style}"

    # Global spaced
    spaced="${OPTIONS[spaced]}"
    # Check for side spaced
    [ "$justify" == "left" ] && spaced="${OPTIONS[spaced_left]:=${OPTIONS[spaced]}}"
    [ "$justify" == "right" ] && spaced="${OPTIONS[spaced_right]:=${OPTIONS[spaced]}}"
    # Check for specific spaced
    spaced="${OPTIONS[spaced_window]:=$spaced}"

    build_window "$state" "$style" "$spaced" "$justify"
}
