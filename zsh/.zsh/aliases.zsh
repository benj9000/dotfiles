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

alias lg='lazygit'
alias ld='lazydocker'

export LESSOPEN="|~/.scripts/previewer.sh %s"  # set environment variable for a less pipe
alias less='less -R'  # call less always with -R to process the syntax highlighting from the less pipe
