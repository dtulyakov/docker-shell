alias ls='ls -Fl'
alias ll='ls -Flah'
PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\];)\"; else echo \"\[\033[01;31m\];(\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \n\[\033[01;32m\]\D{%Y-%m-%d} \t \[\033[01;34m\](\#)>\[\033[00m\]"
