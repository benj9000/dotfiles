#!/bin/sh

# urls to extension files
RESIZE_FONT="https://raw.githubusercontent.com/simmel/urxvt-resize-font/master/resize-font"
TABBEDEX="https://github.com/mina86/urxvt-tabbedex/raw/master/tabbedex"

URXVT_EXT_URLS[0]=$RESIZE_FONT
URXVT_EXT_URLS[1]=$TABBEDEX

# file names behind the urls from above
URXVT_EXTS[0]=$(basename ${URXVT_EXT_URLS[0]})
URXVT_EXTS[1]=$(basename ${URXVT_EXT_URLS[1]})
