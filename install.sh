#!/bin/bash

BASEDIR=$(dirname $0)

source external-files.sh

echo "   ╔═══════════════════════════════════════════════════════════════════════╗"
echo "   ║                         Installing fonts...                           ║"
echo "   ╚═══════════════════════════════════════════════════════════════════════╝"

FONT_NUMBER=${#FONTS[@]}

FONT_DEST=$BASEDIR/fonts/.fonts  # the path for the fonts
mkdir -p $FONT_DEST

for (( i=0; i<$FONT_NUMBER; i++)); do
    if [ ! -f "$FONT_DEST/${FONTS[$i]}" ]; then
        wget -P "$BASEDIR/fonts/.fonts" "${FONT_URLS[$i]}"
    else 
        echo "$FONT_DEST/${FONTS[$i]} already exists. Nice!"
    fi
done

echo "   ╔═══════════════════════════════════════════════════════════════════════╗"
echo "   ║                    Installing urxvt extensions...                     ║"
echo "   ╚═══════════════════════════════════════════════════════════════════════╝"

EXT_NUMBER=${#URXVT_EXTS[@]}

EXT_DEST=$BASEDIR/urxvt/.urxvt/ext  # the path for the extensions
mkdir -p $EXT_DEST

for (( i=0; i<$EXT_NUMBER; i++)); do
    if [ ! -f "$EXT_DEST/${URXVT_EXTS[$i]}" ]; then        
        wget -P "$EXT_DEST" "${URXVT_EXT_URLS[$i]}"
    else 
        echo "$EXT_DEST/${URXVT_EXTS[$i]} already exists. Nice"
    fi
done

echo "   ╔═══════════════════════════════════════════════════════════════════════╗"
echo "   ║                      Installing zsh packages...                       ║"
echo "   ╚═══════════════════════════════════════════════════════════════════════╝"

PACKAGE_NUMBER=${#ZSH_PACKAGES[@]}

PACKAGE_DEST=$BASEDIR/zsh/.zsh  # the path for the zsh packages
mkdir -p $PACKAGE_DEST

for (( i=0; i<$PACKAGE_NUMBER; i++)); do
    if [ ! -d "$PACKAGE_DEST/${ZSH_PACKAGES[$i]}" ]; then
        echo "DOWNLOAD $PACKAGE_DEST/${ZSH_PACKAGES[$i]}"     
        git clone --depth=1 "${ZSH_PACKAGE_URLS[$i]}" "$PACKAGE_DEST/${ZSH_PACKAGES[$i]}" 
    else 
        echo "$PACKAGE_DEST/${ZSH_PACKAGES[$i]} already exists. Performing pull!"
        git -C "$PACKAGE_DEST/${ZSH_PACKAGES[$i]}" pull --ff-only
    fi
done

echo "   ╔═══════════════════════════════════════════════════════════════════════╗"
echo "   ║                              Stowing...                               ║"
echo "   ╚═══════════════════════════════════════════════════════════════════════╝"
stow --dir ${BASEDIR} --target=$HOME -R fonts
stow --dir ${BASEDIR} --target=$HOME -R lf
stow --dir ${BASEDIR} --target=$HOME -R rofi
stow --dir ${BASEDIR} --target=$HOME -R urxvt
# stow --dir ${BASEDIR} --target=$HOME -R vim
stow --dir ${BASEDIR} --target=$HOME -R xresources
stow --dir ${BASEDIR} --target=$HOME -R zsh

