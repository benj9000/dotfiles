#!/bin/env bash

generate_filepath() {
    local folder="$1"
    local datetime
    datetime="$(date +%Y%m%d%H%M%S)"
    local filename="${datetime}-screenshot.png"
    local filepath="$folder$filename"
    echo "$filepath"
}

take_screenshot_all() {
    local filepath="$1"
    maim "$filepath"
    echo "$filepath"
}

take_screenshot_active_window() {
    local filepath="$1"
    maim -i "$(xdotool getactivewindow)" "$filepath"
    echo "$filepath"
}

take_screenshot_selection() {
    local filepath="$1"
    maim -s "$filepath"
    echo "$filepath"
}

take_screenshot() {
    local option="$1"
    local folder="$2"
    local filepath
    filepath="$(generate_filepath "$folder")"

    case "$option" in
        "all")
            take_screenshot_all "$filepath"
            ;;
        "window")
            take_screenshot_active_window "$filepath"
            ;;
        "selection")
            take_screenshot_selection "$filepath"
            ;;
        *)
            notify-send --urgency=critical "Screenshot error!" "Invalid option $option."
            exit 1
            ;;
    esac

    notify-send --urgency=normal "Screenshot saved:" "$filepath"
    exit 0
}

option="$1"
folder="$HOME/images/screenshots/"
take_screenshot "$option" "$folder"
