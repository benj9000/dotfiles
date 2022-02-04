# Dotfiles

 - [lf (file manager)](https://github.com/gokcehan/lf)
 - [Ubunuto Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono) (font family)
 - [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) (terminal emulator)
   - [urxvt-resize-font](https://github.com/simmel/urxvt-resize-font)
   - [urxvt-tabbedex](https://github.com/mina86/urxvt-tabbedex)
 - [zsh](https://www.zsh.org/) (shell)
   - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
   - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
   - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
   - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   - [Oh My Zsh sudo plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)
   
## Installation

The `setup` bash script will automatically download the fonts, packages and stuff into the cloned repository's folder. It will thed create symbolic links in the current user's home directory (using stow). The following tools are used during the installation process:

 - [git](https://git-scm.com/)
 - [jq](https://stedolan.github.io/jq/)
 - [stow](https://www.gnu.org/software/stow/)
 - [wget](https://www.gnu.org/software/wget/)

