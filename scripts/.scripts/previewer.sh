#!/bin/env sh

# set preview for specific files and file extensions
# (append an exit command to avoid multiple matches)
case "$1" in
    *lfrc|*.zprofile|*.zshenv|*.zshrc)
        if [ -x "$(which highlight)" ]; then 
            highlight -O ansi -S sh --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
esac

# set preview for specific mime types
case "$(file -b -L --mime-type "$1")" in
    text/*|application/json)
        if [ -x "$(which highlight)" ]; then 
            highlight -O ansi --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        ;;
    image/*|audio/*|video/*)
        if [ -x "$(which mediainfo)" ]; then 
            mediainfo "$1"
        else
            echo "$1"
        fi
        ;;
    application/pdf)
        if [ -x "$(which pdftotext)" ]; then 
            pdftotext -layout "$1" -
        else
            echo "$1"
        fi
        ;;
    *)
        echo "$1"
        ;;
esac

