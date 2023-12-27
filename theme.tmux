#!/usr/bin/env bash

PLUGIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

get_opt(){
    local option value default
    option="$1"
    default="$2"
    value=$(tmux show-option -gqv "$option")
    if [ -n  "$value" ]
    then
        if [ "$value" == "null" ]
        then
            echo ""
        else
            echo "$value"
        fi
    else
        echo "$default"
    fi
}
built_mod(){
    local color1=$1
    local color2=$2
    local icon=$3
    local text=$4

    echo "#[fg=$color2,bg=$color1] $icon $(sep_up "$color1" "$color2")#[fg=$color1,bg=$color2] $text "
}
main(){
    # Get flavor
    theme="$(get_opt "@theme_flavor" "catppuccin_mocha")"

    declare -A COLORS
    # Load colors
    # https://github.com/dylanaraps/pure-sh-bible#parsing-a-keyval-file
    while IFS='=' read -r key val; do
        # Skip over lines containing comments.
        # (Lines starting with '#').
        [ "${key##\#*}" ] || continue

        # '$key' stores the key.
        # '$val' stores the value.
        eval "COLORS[$key]"="$val"
    done < "${PLUGIN_DIR}/colors/${theme}"

    source "$PLUGIN_DIR/src/modules.sh"
    source "$PLUGIN_DIR/src/status.sh"

    # Set opts
    tmux set -gq status-fg "${COLORS[fg]}"
    tmux set -gq status-bg "${COLORS[bg]}"

    tmux set -gq pane-border-style fg="${COLORS[00]}"
    tmux set -gq pane-active-border-style fg="${COLORS[02]}"

    tmux set -gq status-left-length 100
    tmux set -gq status-left "$(status_left)"

    tmux set -gq status-right-length 100
    tmux set -gq status-right "$(status_right)"

    # tmux setw -gq window-status-separator ""
    # tmux setw -gq window-status-format "$(status_window)"
    # tmux setw -gq window-status-current-format "$(status_window_active)"
}

main
