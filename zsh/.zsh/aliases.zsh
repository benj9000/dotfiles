alias -g ...='../..'
alias -g ....='../../..'

alias ls='ls --human-readable --color=auto --group-directories-first'
alias l='ls -1'
alias ll='ls -l --almost-all'
alias lr='l --recursive'
alias llr='ll --recursive'
alias ldot='ls -l --directory .*'

alias gf='git fetch'
alias gs='git status'
alias gp='git pull'
alias gc='git commit'

alias grep='grep -i --color'

export LESSOPEN="|~/.scripts/previewer.sh %s"  # set environment variable for a less pipe
alias less='less -R'  # call less always with -R to process the syntax highlighting from the less pipe

alias lg='lazygit'
alias ld='lazydocker'

alias shfmt='shfmt -i 4 -ci'

# prepend some commands with 'noglob' to disable globbing.
# with this, there is no need to escape strings with globbing characters.
# this is especially useful when URLs are expected as arguments.
alias curl='noglob curl'
alias mpv='noglob mpv'
alias streamlink='noglob streamlink'
alias wget='noglob wget'
alias yt-dlp='noglob yt-dlp'
