# Dotfiles

## Tools and plugins covered

 - [lf](https://github.com/gokcehan/lf) (file manager)
   - file previews with the `previewer.sh` script (see below)
   - recycle bin with [trash-cli](https://github.com/andreafrancia/trash-cli)
 - [streamlink](https://streamlink.github.io/)
   - [mpv](https://mpv.io/) as default video player
 - [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html) (terminal emulator)
   - [keyboard-select](https://github.com/muennich/urxvt-perls)
   - [urxvt-resize-font](https://github.com/simmel/urxvt-resize-font)
   - [urxvt-tabbedex](https://github.com/mina86/urxvt-tabbedex)
 - [zathura](https://pwmt.org/projects/zathura) (PDF viewer)
 - [zsh](https://www.zsh.org/) (shell)
   - [powerlevel10k](https://github.com/romkatv/powerlevel10k)
   - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
   - [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
   - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
   - [Oh My Zsh sudo plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)

## Scripts

  - `previewer.sh` 
    - file previews in the terminal with (if installed):
      - [highlight](http://www.andre-simon.de/doku/highlight/highlight.php)
      - [mediainfo](https://mediaarea.net/en/MediaInfo/)
      - [pdftotext from poppler-utils](https://poppler.freedesktop.org)

## Other assets

 - [Ubunuto Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono/) (font family)
   
## Installation

The `setup` bash script will automatically download the fonts, packages and stuff into the cloned repository's folder. It will then create symbolic links in the current user's home directory (using stow).

The following tools are used during the installation process:

 - [git](https://git-scm.com/)
 - [jq](https://stedolan.github.io/jq/)
 - [stow](https://www.gnu.org/software/stow/)
 - [wget](https://www.gnu.org/software/wget/)

