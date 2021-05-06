#!/bin/bash

BASEDIR=$(dirname $0)

# unstow all symbolic links from home directory
stow --dir ${BASEDIR} --target=$HOME -D fonts
stow --dir ${BASEDIR} --target=$HOME -D lf
stow --dir ${BASEDIR} --target=$HOME -D rofi
stow --dir ${BASEDIR} --target=$HOME -D urxvt
stow --dir ${BASEDIR} --target=$HOME -D vim
stow --dir ${BASEDIR} --target=$HOME -D xresources
stow --dir ${BASEDIR} --target=$HOME -D zsh

