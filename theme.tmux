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

main(){

    declare -A OPTIONS=(
        ["theme_flavour"]="$(get_opt "@theme_flavour" "catppuccin_mocha")"
        ["status_spaced"]="$(get_opt "@theme_status_spaced" "true")"

        ["status_left_style"]="$(get_opt "@theme_status_left_style" "none")"
        ["status_left_modules"]="$(get_opt "@theme_status_left_modules" "session")"

        ["status_right_style"]="$(get_opt "@theme_status_right_style" "none")"
        ["status_right_modules"]="$(get_opt "@theme_status_right_modules" "user host date time")"
    )

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
    done < "${PLUGIN_DIR}/colors/${OPTIONS[theme_flavour]}"

    source "$PLUGIN_DIR/src/modules.sh"
    source "$PLUGIN_DIR/src/status.sh"
    source "$PLUGIN_DIR/src/separators.sh"

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
