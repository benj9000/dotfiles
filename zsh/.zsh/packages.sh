#!/bin/sh

# urls to package repositories
POWERLEVEL10K="https://github.com/romkatv/powerlevel10k.git"
ZSH_SYNTAX_HIGHLIGHTING="https://github.com/zsh-users/zsh-syntax-highlighting.git"
ZSH_HISTORY_SUBSTRING_SEARCH="https://github.com/zsh-users/zsh-history-substring-search.git"
ZSH_AUTOSUGGESTIONS="https://github.com/zsh-users/zsh-autosuggestions.git"

ZSH_PACKAGE_URLS[0]=$POWERLEVEL10K
ZSH_PACKAGE_URLS[1]=$ZSH_SYNTAX_HIGHLIGHTING
ZSH_PACKAGE_URLS[2]=$ZSH_HISTORY_SUBSTRING_SEARCH
ZSH_PACKAGE_URLS[3]=$ZSH_AUTOSUGGESTIONS

# file names behind the urls from above
ZSH_PACKAGES[0]=$(basename ${ZSH_PACKAGE_URLS[0]} | cut -f 1 -d '.')
ZSH_PACKAGES[1]=$(basename ${ZSH_PACKAGE_URLS[1]} | cut -f 1 -d '.')
ZSH_PACKAGES[2]=$(basename ${ZSH_PACKAGE_URLS[2]} | cut -f 1 -d '.')
ZSH_PACKAGES[3]=$(basename ${ZSH_PACKAGE_URLS[3]} | cut -f 1 -d '.')
