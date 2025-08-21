#
# ~/.bash_profile
#

source ~/.secrets

eval $(ssh-agent) &>/dev/null
ssh-add -q ~/.ssh/gg

[[ -f ~/.bashrc ]] && . ~/.bashrc
