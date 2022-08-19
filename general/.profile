#!/bin/env sh

# include user's private bin to $PATH if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# export some environment variables for default applications
if [ -x "$(command -v kitty)" ]; then
    TERMINAL="$(command -v kitty)"
elif [ -x "$(command -v urxvt)" ]; then
    TERMINAL="$(command -v urxvt)"
elif [ -x "$(command -v xterm)" ]; then
    TERMINAL="$(command -v xterm)"
fi
export TERMINAL

if [ -x "$(command -v nvim)" ]; then
    VISUAL="$(command -v nvim)"
elif [ -x "$(command -v vim)" ]; then
    VISUAL="$(command -v vim)"
fi
export VISUAL

if [ -x "$(command -v nvim)" ]; then
    EDITOR="$(command -v nvim)"
elif [ -x "$(command -v vim)" ]; then
    EDITOR="$(command -v vim)"
fi
export EDITOR

# if [ -x "$(command -v less)" ]; then
#     PAGER="$(command -v less)"
# fi
PAGER=/usr/bin/less  # less is aliased so `command -v` does not work
export PAGER

if [ -x "$(command -v chromium)" ]; then
    BROWSER="$(command -v chromium)"
elif [ -x "$(command -v firefox)" ]; then
    BROWSER="$(command -v firefox)"
fi
export BROWSER

# automatically start X if not using a display manager (login manager)
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi
