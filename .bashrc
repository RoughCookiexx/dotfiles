#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi='nvim'
alias gg='ssh tommy@$GUT_GENUG'

PS1="\n  \[\e[38;2;139;0;139m\][\[\e[38;2;255;192;203m\]\u \[\e[38;2;255;182;193m\]\W\[\e[38;2;139;0;139m\]]:\[\e[0m\]"

