#!/bin/env sh

# meanings of exit codes:
# 0 - handler found, output preview
# 1 - no handler found, output the file path

file_path="$1"
file_extension="${file_path##*.}"
file_extension_lower="$(echo "$file_extension" | tr '[:upper:]' '[:lower:]')"
mime_type="$(file -b -L --mime-type "$file_path")"

# set preview for specific files
case "$file_path" in
    */.bashrc | */lfrc | */.profile | */.zprofile | */.zshenv | */.zshrc)
        if [ -x "$(which highlight)" ]; then
            highlight -O ansi -S sh --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
esac

# set preview for specific file extensions
case "$file_extension_lower" in
    # TODO add if there are file extensions to handle
esac

# set preview for specific mime types
case "$mime_type" in
    text/* | application/json)
        if [ -x "$(which highlight)" ]; then
            highlight -O ansi --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
    image/* | audio/* | video/*)
        if [ -x "$(which mediainfo)" ]; then
            mediainfo "$1"
        fi
        exit 0
        ;;
    application/pdf)
        if [ -x "$(which pdftotext)" ]; then
            pdftotext -layout "$1" -
        fi
        exit 0
        ;;
esac

echo "$1"
echo "No preview."
exit 1
