# My dotfiles

for 
 - lf
 - urxvt
 - zsh
 
## Work in progress

There is still work to do, e.g. a vim config.

### Things I use: 

 - [lf (file manager)](https://github.com/gokcehan/lf)
 - [Ubunuto Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono)
 - urxvt (terminal emulator)
   - [urxvt-resize-font](https://github.com/simmel/urxvt-resize-font)
   - [urxvt-tabbedex](https://github.com/mina86/urxvt-tabbedex)
 - zsh (shell)
   - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
   - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
   - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
   - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   
### Installation

Requirements: [wget](https://www.gnu.org/software/wget/), [git](https://git-scm.com/), [stow](https://www.gnu.org/software/stow/)

This works for me, __but might not work for you__!
The install script will automatically download the fonts and stuff into the cloned repository's folder and create symbolic links in the current user's home directory (using stow). It will not verify that all requirements are met.

