case $TERM in
        terminal|linux|screen|screen.linux)
        bindkey "^[[2~" yank
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" up-line-or-history
        bindkey "^[[6~" down-line-or-history
        bindkey "^[[1~" beginning-of-line # Клавиша Home
        bindkey "^[[4~" end-of-line # Клавиша End
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search 
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search 
        bindkey " " magic-space ## do history expansion on space 
        ;; 
        *xterm*|rxvt|(dt|k|E)term) 
        bindkey "^[[2~" yank 
        bindkey "^[[3~" delete-char 
        bindkey "^[[5~" up-line-or-history 
        bindkey "^[[6~" down-line-or-history 
        bindkey "^[OH" beginning-of-line # Клавиша Home 
        bindkey "^[OF" end-of-line  # Клавиша End 
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command 
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search 
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search 
        bindkey " " magic-space ## do history expansion on space 
    # ubuntu "Guake terminal"
    # Для авто дополнения при нажатии стрелок вверх/вниз
    bindkey "^[OA" history-search-backward
    bindkey "^[OB" history-search-forward
        ;; 
        *konsole*|konsole) 
        bindkey "^[[2~" yank 
        bindkey "^[[3~" delete-char 
        bindkey "^[[5~" up-line-or-history 
        bindkey "^[[4~" end-of-line # Клавиша End 
        bindkey "^[[1~" beginning-of-line # Клавиша Home 
        bindkey "^[[F" end-of-line 
        bindkey "^[e" expand-cmd-path ## C-e for expanding path of typed command 
        bindkey "^[[A" up-line-or-search ## up arrow for back-history-search 
        bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search 
        bindkey " " magic-space ## do history expansion on space 
        ;; 

esac
if [ `whoami` = root ];
    then
    if [ -e /usr/lib/git-core/git-sh-prompt ];
        then
            . /usr/lib/git-core/git-sh-prompt
            setopt prompt_subst
            export PROMPT=$'%{\e[1;32m%}+-[%{\e[1;39m%}(%l)%{\e[1;31m%}ROOT%{\e[1;36m%}@%{\e[1;33m%}%M:%{\e[1;34m%}%/%{\e[1;32m%}](%{\e[1;31m%}%h%{\e[1;32m%}) $(__git_ps1 "%s")\n+-[%{\e[1;31m%}%#%{\e[1;32m%}]%b'
        else
            export PROMPT=$'%{\e[1;32m%}+-[%{\e[1;39m%}(%l)%{\e[1;31m%}ROOT%{\e[1;36m%}@%{\e[1;33m%}%M:%{\e[1;34m%}%/%{\e[1;32m%}](%{\e[1;31m%}%h%{\e[1;32m%})\n+-[%{\e[1;31m%}%#%{\e[1;32m%}]%b'
        fi
    else
    if [ -e /usr/lib/git-core/git-sh-prompt ];
        then
            . /usr/lib/git-core/git-sh-prompt
            setopt prompt_subst
            export PROMPT=$'%{\e[1;32m%}+-[%{\e[1;39m%}(%l)%{\e[1;34m%}%n%{\e[1;36m%}@%{\e[1;33m%}%M:%{\e[1;34m%}%/%{\e[1;32m%}](%{\e[1;31m%}%h%{\e[1;32m%}) $(__git_ps1 "%s")\n+-[%{\e[1;31m%}%#%{\e[1;32m%}]>%b'
        else
            export PROMPT=$'%{\e[1;32m%}+-[%{\e[1;39m%}(%l)%{\e[1;34m%}%n%{\e[1;36m%}@%{\e[1;33m%}%M:%{\e[1;34m%}%/%{\e[1;32m%}](%{\e[1;31m%}%h%{\e[1;32m%})\n+-[%{\e[1;31m%}%#%{\e[1;32m%}]>%b'
    fi
fi




RPROMPT=$'%{\e[1;32m%}[%{\e[1;34m%} %T %D %{\e[1;32m%}]%{\e[0m%}'
zstyle ':completion:*' completer _expand _complete _ignored 
zstyle ':completion:*' group-name '' 
zstyle ':completion:*' list-colors '' 
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s' 
zstyle ':completion:*' max-errors 1 
zstyle ':completion:*' menu select=long-list select=0 
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s' 
zstyle ':completion:*' use-compctl false 
zstyle ':completion:*' verbose true 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*:*:kill:*' menu yes select 
zstyle ':completion:*:kill:*' force-list always 
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[cyan]=$color[red]" 

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt AUTO_CD
autoload -Uz compinit
compinit
extract () {
 if [ -f $1 ] ; then
   case $1 in
   *.tar.bz2)   tar xjf $1        ;;
   *.tar.gz)    tar xzf $1     ;;
   *.bz2)       bunzip2 $1       ;;
   *.rar)       unrar x $1     ;;
   *.gz)        gunzip $1     ;;
   *.tar)       tar xf $1        ;;
   *.tbz2)      tar xjf $1      ;;
   *.tgz)       tar xzf $1       ;;
   *.zip)       unzip $1     ;;
   *.Z)         uncompress $1  ;;
   *.7z)        7z x $1    ;;
   *.tbz)       tar xjvf  ;;
   *)           echo "я не в курсе как распаковать '$1'..." ;;
   esac
 else
 echo "'$1' is not a valid file"
 fi
}
pk () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)      tar cpvf $2.tar  $2       ;;
 bz2)    bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}

alias df='df -hT'
alias ll='ls -lah'
alias nano='nano -wc'
alias less='less -n -i -S -X'
alias vi='vim'
#alias ssh='ssh -v'
alias cp='cp -v'
alias scp='scp -v'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias makecolor='grc --colour=auto make'
alias dirf='find . -type d | sed -e "s/[^-][^\/]*\//  |/g" -e "s/|\([^ ]\)/|-\1/"'
alias psgrep='ps aux | grep $(echo $1 | sed "s/^\(.\)/[\1]/g")'
alias delspacecomm="sed '/ *#/d; /^ *$/d' $1"
alias getpass="head -c6 /dev/urandom | xxd -ps"
#export TMOUT=1200
export COLORTERM="gnome-terminal"
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less
export PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/usr/games"
export LC_COLLATE=POSIX
export LC_COLLATE
export LANG=ru_RU.UTF-8
export LC_CTYPE=ru_RU.UTF-8
export LC_ALL=ru_RU.UTF-8
export TZ='Europe/Moscow'

export LESS_TERMCAP_mb=$'\E[01;31m'       # начала мигающего
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # начало жирного текста
export LESS_TERMCAP_me=$'\E[0m'           # окончание
export LESS_TERMCAP_so=$'\E[38;5;246m'    # начала текста в инфобоксе
export LESS_TERMCAP_se=$'\E[0m'           # конец его
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # начало подчеркнутого
export LESS_TERMCAP_ue=$'\E[0m'           # конец подчеркнутого


if [ -x /usr/bin/dircolors ]; then 
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias rehash='hash -r'
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi 
#EOF
