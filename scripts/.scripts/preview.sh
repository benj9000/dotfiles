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
        if [ -x "$(command -v highlight)" ]; then
            highlight -O ansi -S sh --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
esac

# set preview for specific file extensions
case "$file_extension_lower" in
    nfo)
        if [ -x "$(command -v highlight)" ]; then
            highlight -O ansi -S xml --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
    rasi)
        if [ -x "$(command -v highlight)" ]; then
            highlight -O ansi -S css --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
esac

# set preview for specific mime types
case "$mime_type" in
    inode/directory)
        ls -lah "$1"
        exit 0
        ;;
    text/* | application/json)
        if [ -x "$(command -v highlight)" ]; then
            highlight -O ansi --stdout --quiet --force "$1"
        else
            less "$1"
        fi
        exit 0
        ;;
    image/* | audio/* | video/*)
        if [ -x "$(command -v mediainfo)" ]; then
            mediainfo "$1"
            exit 0
        fi
        ;;
    application/pdf)
        if [ -x "$(command -v pdftotext)" ]; then
            pdftotext -layout "$1" -
            exit 0
        fi
        ;;
    application/zip)
        if [ -x "$(command -v unzip)" ]; then
            unzip -l "$1"
            exit 0
        fi
        ;;
    application/gzip | application/x-xz)
        if [ -x "$(command -v tar)" ]; then
            tar -tf "$1"
            exit 0
        fi
        ;;
    application/x-7z-compressed)
        if [ -x "$(command -v 7z)" ]; then
            7z l "$1"
            exit 0
        fi
        ;;
esac

echo "$1"
echo
echo "No preview."
exit 1
