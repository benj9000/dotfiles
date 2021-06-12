#!/bin/sh


#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                 fonts                                 ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# urls to font files
FONT_REGULAR_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf"
FONT_ITALIC_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular-Italic/complete/Ubuntu%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"
FONT_BOLD_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold/complete/Ubuntu%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf"
FONT_BOLD_ITALIC_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold-Italic/complete/Ubuntu%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf"

FONT_URLS[0]=$FONT_REGULAR_URL
FONT_URLS[1]=$FONT_ITALIC_URL
FONT_URLS[2]=$FONT_BOLD_URL
FONT_URLS[3]=$FONT_BOLD_ITALIC_URL

# file names behind the urls from above
FONTS[0]=$(basename ${FONT_URLS[0]} | sed 's/%20/ /g')
FONTS[1]=$(basename ${FONT_URLS[1]} | sed 's/%20/ /g')
FONTS[2]=$(basename ${FONT_URLS[2]} | sed 's/%20/ /g')
FONTS[3]=$(basename ${FONT_URLS[3]} | sed 's/%20/ /g')


#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                 urxvt                                 ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# urls to extension files
RESIZE_FONT="https://raw.githubusercontent.com/simmel/urxvt-resize-font/master/resize-font"
TABBEDEX="https://github.com/mina86/urxvt-tabbedex/raw/master/tabbedex"

URXVT_EXT_URLS[0]=$RESIZE_FONT
URXVT_EXT_URLS[1]=$TABBEDEX

# file names behind the urls from above
URXVT_EXTS[0]=$(basename ${URXVT_EXT_URLS[0]})
URXVT_EXTS[1]=$(basename ${URXVT_EXT_URLS[1]})


#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                  zsh                                  ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

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
