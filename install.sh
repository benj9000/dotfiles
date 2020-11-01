#!/bin/bash

BASEDIR=$(dirname $0)

# clone powerline theme repo
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${BASEDIR}/zsh/.zsh/themes/powerlevel10k

# download nerd fonts
wget -P ${BASEDIR}/fonts/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P ${BASEDIR}/fonts/.fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# update fonts cache
#fc-cache -f

