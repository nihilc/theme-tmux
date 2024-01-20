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
fi }

main(){

    declare -A OPTIONS=(
        ["flavour"]="$(get_opt "@theme_flavour" "catppuccin_mocha")"

        ["style"]="$(get_opt "@theme_style" "none")"
        ["style_left"]="$(get_opt "@theme_style_left")"
        ["style_right"]="$(get_opt "@theme_style_right")"
        ["style_window"]="$(get_opt "@theme_style_window")"

        ["spaced"]="$(get_opt "@theme_spaced" "true")"
        ["spaced_left"]="$(get_opt "@theme_spaced_left")"
        ["spaced_right"]="$(get_opt "@theme_spaced_right")"

        ["modules_left"]="$(get_opt "@theme_modules_left" "session")"
        ["modules_right"]="$(get_opt "@theme_modules_right" "user host date time")"
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
    done < "${PLUGIN_DIR}/colors/${OPTIONS[flavour]}"

    source "$PLUGIN_DIR/src/modules.sh"
    source "$PLUGIN_DIR/src/status.sh"
    source "$PLUGIN_DIR/src/separators.sh"

    # Set opts
    tmux set -gq status-fg "${COLORS[fg]}"
    tmux set -gq status-bg "${COLORS[bg]}"

    tmux set -gq pane-border-style fg="${COLORS[00]}"
    tmux set -gq pane-active-border-style fg="${COLORS[02]}"

    tmux set -gq status-left-length 200
    tmux set -gq status-left "$(status_left)"

    tmux set -gq status-right-length 200
    tmux set -gq status-right "$(status_right)"

    tmux setw -gq window-status-separator ""
    tmux setw -gq window-status-format "$(status_window "default")"
    tmux setw -gq window-status-current-format "$(status_window "current")"
}

main
