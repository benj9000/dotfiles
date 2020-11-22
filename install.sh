#!/bin/bash

BASEDIR=$(dirname $0)

# clone powerline theme repo
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${BASEDIR}/zsh/.zsh/themes/powerlevel10k

# download nerd fonts
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold/complete/Ubuntu%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Regular-Italic/complete/Ubuntu%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/UbuntuMono/Bold-Italic/complete/Ubuntu%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
# update fonts cache
#fc-cache -f

