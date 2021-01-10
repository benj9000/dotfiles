#!/bin/bash

BASEDIR=$(dirname $0)

# download nerd fonts
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold/complete/Ubuntu%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular-Italic/complete/Ubuntu%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold-Italic/complete/Ubuntu%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
# update fonts cache
#fc-cache -f

# download urxvt extensions
wget -P ${BASEDIR}/urxvt/.urxvt/ext https://raw.githubusercontent.com/simmel/urxvt-resize-font/master/resize-font
wget -P ${BASEDIR}/urxvt/.urxvt/ext https://github.com/mina86/urxvt-tabbedex/raw/master/tabbedex

# clone some zsh package repos and the powerline theme repo
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${BASEDIR}/zsh/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search.git ${BASEDIR}/zsh/.zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${BASEDIR}/zsh/.zsh/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${BASEDIR}/zsh/.zsh/themes/powerlevel10k


# after everything has been fetched, stow to home directory
stow --dir ${BASEDIR} --target=$HOME -R fonts -n
stow --dir ${BASEDIR} --target=$HOME -R urxvt -n
# stow --dir ${BASEDIR} --target=$HOME -R vim -n
stow --dir ${BASEDIR} --target=$HOME -R zsh -n

