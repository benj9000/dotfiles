#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                              zsh config                               ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                             Window title                              ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

case $TERM in
  (*xterm* | *rxvt*)

    # Write some info to terminal title.
    # This is seen when the shell prompts for input.
    function precmd {
      printf "\033]0; $PWD\007"
    }

    # Write command and args to terminal title.
    # This is seen while the shell waits for a command to complete.
    function preexec {
      printf "\033]0;%s\a" "$1"
    }

  ;;
esac

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                Prompt                                 ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz promptinit
promptinit
source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                History                                ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                              Navigation                               ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Directory navigation
setopt AUTO_CD                  # Change directory by typing directory name.
setopt CD_SILENT                # Never print the directory after a cd (or an implied one).
# Directory stack
setopt AUTO_PUSHD               # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS        # Do not store duplicates in the stack.
setopt PUSHD_SILENT             # Do not print the directory stack after pushd or popd.
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                              Keybindings                              ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Load aliases
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                              Completion                               ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Add folder with all completion functions
fpath=(~/.zsh/completions $fpath)

# Use modern completion system
autoload -Uz compinit && compinit
_comp_options+=(globdots)       # With hidden files

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                Python                                 ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Source file with functions about virtual environments
[ -f ~/.zsh/python-env.zsh ] && source ~/.zsh/python-env.zsh

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                             lf integration                            ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

# Source lfcd
# (a patched lf call that auto-cds into the last visited directory after quitting lf)
[ -f ~/.zsh/lfcd.zsh ] && source ~/.zsh/lfcd.zsh

#   ╔═══════════════════════════════════════════════════════════════════════╗
#   ║                                Plugins                                ║
#   ╚═══════════════════════════════════════════════════════════════════════╝

[ -f ~/.zsh/plugins/ohmyzsh-sudo-plugin/sudo.plugin.zsh ] && source ~/.zsh/plugins/ohmyzsh-sudo-plugin/sudo.plugin.zsh

[ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-execute     # Use Ctrl+Space to execute suggestion

# Source zsh-syntax-highlighting.zsh AT THE END of .zshrc
[ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Source zsh-history-substring-search.zsh AFTER zsh-syntax-highlighting.zsh
[ -f ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ] && source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up      # Use arrow key up to search
bindkey '^[[B' history-substring-search-down    # Use arrow key down to search
bindkey -M vicmd 'k' history-substring-search-up    # Use 'k' key to search in vi mode
bindkey -M vicmd 'j' history-substring-search-down  # Use 'j' key to search in vi mode

