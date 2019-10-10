#zmodload zsh/zprof 
###########################################################        
if [ "$OSTYPE" = "cygwin" ] || [ "$OSTYPE" = "msys" ]; then
   export ZHANG_HOME=/d/zhang
fi

# Options for Zsh

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
eval `dircolors -b`

#autoload -U compinit
#compinit
setopt autopushd pushdminus pushdsilent pushdtohome
setopt autocd
setopt cdablevars
setopt ignoreeof
setopt interactivecomments
setopt login
# setopt nobanghist
setopt noclobber
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt inc_append_history # Add comamnds as they are typed, don't wait until shell exit
setopt HIST_IGNORE_ALL_DUPS
setopt SH_WORD_SPLIT
setopt nohup
setopt append_history
setopt share_history
setopt PROMPT_SUBST
setopt extendedglob

# PS1 and PS2
#export PS1="$(print '%{\e[1;34m%}%n%{\e[0m%}'):$(print '%{\e[0;34m%}%~%{\e[0m%}')$ "
#export PS2="$(print '%{\e[0;34m%}>%{\e[0m%}')"

# Vars used later on by Zsh
#export EDITOR="nano"
export BROWSER=w3m
#export XTERM="aterm +sb -geometry 80x29 -fg black -bg lightgoldenrodyellow -fn -xos4-terminus-medium-*-normal-*-14-*-*-*-*-*-iso8859-15"
export TERM=xterm-256color

##################################################################
# Stuff to make my life easier

# allow approximate
zstyle ':completion:*' completer _complete _match #_approximate
zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# cd not select parent dir
zstyle ':completion:*:cd:*' ignore-parents parent pwd

case `uname` in
    *MINGW*|*CYGWIN*) zstyle ':completion:*' fake-files $(df --output=source |sed -e 's/:.*$//g' |xargs -I{} echo "/:{}" |tr '\n' ' ' | sed -e 's/\/\:Filesystem //g' | sed -e 's/ $//g' | tr '[:upper:]' '[:lower:]')
esac

#if [ "$OSTYPE" = "cygwin" ]; then
#    # zstyle ':completion:*' fake-files /:c /:d /:h /:j /:p 
#    # zstyle ':completion:*' fake-files $(df --output=source | tr -d ':' |xargs -I{} echo "/:{}" |tr '\n' ' ' | sed -e 's/\/\:Filesystem //g' | sed -e 's/ $//g' | tr '[:upper:]' '[:lower:]')
#    zstyle ':completion:*' fake-files $(df --output=source |sed -e 's/:.*$//g' |xargs -I{} echo "/:{}" |tr '\n' ' ' | sed -e 's/\/\:Filesystem //g' | sed -e 's/ $//g' | tr '[:upper:]' '[:lower:]')
#fi

## case-insensitive (uppercase from lowercase) completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## case-insensitive (all) completion
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## case-insensitive,partial-word and then substring completion
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload -a colors
zmodload -a autocomplete
zmodload zsh/complist
## Completions
autoload -U compinit
compinit -C

zmodload zsh/deltochar

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

##################################################################
# Key bindings
# http://mundy.yazzy.org/unix/zsh.php
# http://www.zsh.org/mla/users/2000/msg00727.html

typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey '\M->' end-of-history
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

zle -A .accept-search accept-search
bindkey -M isearch "^m" accept-search
# zle -A .kill-region kill-region
# bindkey -M isearch "^w" kill-region

bindkey "\ez" zap-to-char

##################################################################
# My aliases

# Set up auto extension stuff
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=feh
alias -s jpg=feh
alias -s gif=feg
alias -s sxw=soffice
alias -s doc=soffice
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR

# Normal aliases
case $OSTYPE in
        linux-gnu)
			alias ls='ls --color=always -F'
            ;;
        darwin*)
			alias ls='ls -G -F'
            ;;
        cygwin)
			alias ls='ls --color=always -F'
            ;;
esac
alias ll='ls -l'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias f='find |grep'
alias c="clear"
alias dir='ls -1'
alias gvim='gvim -geom 82x35'
alias ..='cd ..'
alias nicotine='/home/paul/downloads/nicotine-1.0.8rc1/nicotine'
alias ppp-on='sudo /usr/sbin/ppp-on'
alias ppp-off='sudo /usr/sbin/ppp-off'
alias firestarter='sudo su -c firestarter'
alias mpg123='mpg123 -o oss'
alias mpg321='mpg123 -o oss'
alias vba='/home/paul/downloads/VisualBoyAdvance -f 4'
alias hist="grep '$1' /home/paul/.zsh_history"
alias irssi="irssi -c irc.freenode.net -n yyz"
alias mem="free -m"
alias msn="tmsnc -l hutchy@subdimension.com"
alias google="w3m www.google.com"

# command L equivalent to command |less
alias -g L='|less' 

# command S equivalent to command &> /dev/null &
alias -g S='&> /dev/null &'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias grep="grep --color=always"

# Some shortcuts for different directory listings
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ls="ls --color=always"
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias b="cd .."
alias ..="cd .."
alias ,="cd .."
alias less2=/usr/bin/less
alias oie="xargs -n 1 emacsclient --no-wait"
alias rsync="rsync --progress"


# cygwin specific part
if [ "$OSTYPE" = "cygwin" ]; then
    alias open="cygstart"
	alias 7zfm="/d/Program\ Files/7-Zip/7zFM.exe"
    #alias ant="/d/flex_sdk/ant/1.8.2/bin/ant"
fi

case $OSTYPE in
   cygwin)
      alias open="cygstart";
      #alias open="cmd /c start";
	  ;;
   linux*)
      alias start="xdg-open";
      alias open="xdg-open";
	  ;;
   msys)
      alias open="start";
      ;;
   darwin*)
      alias start="open";
	  ;;
esac

#export PROMPT=$'\n\e[32;1m[%D{%a %Y-%m-%d %H:%M:%S}]%n@%M:\e[0m\e[33;1m%~ \e[0m\n$' #orig osx
#export PROMPT=$'[%D %*]%n@%M:%d \n$'
#export PROMPT=$'\e[32;1m[%D %*]%n@%M:\e[0m\e[33;1m%~ \e[0m\n$'
#export PROMPT=$'\n\e[32;1m[%D{%a %Y-%m-%d %H:%M:%S}]%n@%M:\e[0m\e[33;1m%~ \e[0m\n$'
#export PROMPT=$'\n\e[32;1m[%D{%a %Y-%m-%d %H:%M:%S}][%n@%M]:\e[0m\e[33;1m%~ \e[0m\n$'
export PROMPT=$'\n\e[32;1m[%D{%a %Y-%m-%d %H:%M:%S}][%n@%M]:\e[0m\e[33;1m%~ \e[0m\n%{%(?.%F{green}.%F{red})%}$%{%f%}'
# source ~/utility-config/zsh-git-prompt/zshrc.sh
# export PROMPT=$'\n\e[32;1m[%D{%a %Y-%m-%d %H:%M:%S}][%n@%M]:\e[0m\e[33;1m%~ \e[0m$(git_super_status)\n%{%(?.%F{green}.%F{red})%}$%{%f%}'
#export PROMPT=$'\n\e[$((31 + $(hostname | cksum | cut -c7-9) % 6));1m[%D{%a %Y-%m-%d %H:%M:%S}][%n@%M]:\e[0m\e[33;1m%~ \e[0m\n$'

export ZLS_COLORS=${LS_COLORS}
export ZLS_COLOURS=${LS_COLORS}
export WORDCHARS="*?_-[]~&;!#$%^(){}<>"

bindkey -e
export EDITOR=vim

#### functions

#### functions
function e () {
    case $OSTYPE in
        linux*)
            emacsclient --no-wait $* --alternate-editor "emacs"
            ;;
        darwin*)
            /Applications/Emacs.app/Contents/MacOS/bin/emacsclient --no-wait $* --alternate-editor "/Users/$(whoami)/bin/emacs-osx"
            ;;
        msys|cygwin)
            emacsclient --no-wait "$(cygpath -a -w $*)" --alternate-editor "$(cygpath -aw $ZHANG_HOME/BTSync/Applications/Windows/emacs/bin/runemacs.exe)"
            #emacsclient --no-wait "$(cygpath -a -w $*)"
            ;;
    esac

    # if [ "$OSTYPE" = "cygwin" ]; then
    #     emacsclient --no-wait "$(cygpath -a -w $*)"
    # else
    #     emacsclient --no-wait $*
    # fi

    #if [ $? != 0 ]; then
    #    xftemacs $* &
    #fi
}

function e2 () {
    local TMP;
    if [[ ("$1" == "-") || ($# -eq 0) ]]; then
        TMP="$(mktemp /tmp/emacsstdinXXX)";

        if [ "$OSTYPE" = "cygwin" ]; then
            TMP="$(cygpath -a -m $TMP)";
        fi

        cat >> "$TMP";
        if ! emacsclient --alternate-editor "vim" --no-wait --eval "(let ((b (create-file-buffer \"*stdin*\"))) (switch-to-buffer b) (insert-file-contents \"${TMP}\") (raise-frame) (delete-file \"${TMP}\"))"  > /dev/null 2>&1; then
            emacs --eval "(let ((b (create-file-buffer \"*stdin*\"))) (switch-to-buffer b) (insert-file-contents \"${TMP}\") (raise-frame) (delete-file \"${TMP}\"))" &
        fi;
    else
        if [ "$OSTYPE" = "cygwin" ]; then
            emacsclient --alternate-editor "vim" --no-wait "$(cygpath -a -w $*)"
        else
            emacsclient --alternate-editor "vim" --no-wait $*
        fi
    fi;
}

function svndiff () {
    svn diff $* | view -
}

function iciba () {
    w3m "http://www.iciba.com/search?s=$1"
}

# e () {
#    emacsclient --no-wait $*

#    if [ $? != 0 ]; then
#        xftemacs $* &
#    fi
# }

autoload -U select-word-style
select-word-style bash

#export CDPATH=.:..:~:~/src

precmd () {
		printf "\033]2;$(pwd) - $(whoami)\033\\";
}

# export CFLAGS="-std=c99 -fgnu89-inline -O3"
# export CXXFLAGS=""
#export CC=clang
#export CXX=clang++

stty -ixon

#export LDFLAGS=" -static -static-libgcc  -static-libstdc++"
#export JAVA_HOME="c:\\Program Files\\Java\\jdk1.6.0_07\\"
#export JAVA_HOME=/c/Program\ Files\ \(x86\)/Java/jre6/
#export JAVA_HOME="d:/Program Files/Java/jdk1.8.0_31"
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export MAVEN_OPTS="-Xmx1024m -Xms512m"


case $OSTYPE in
    linux)
        ;;
    darwin*)
        ;;
    cygwin)
        export JAVA_HOME="c:\\Program Files\\Java\\jdk1.6.0_07\\"
        ;;
esac

bindkey ' ' magic-space
bindkey '^w' kill-region

zle-isearch-exit() {
    if [[ $ISEARCHDIR -eq 1 ]]; then
        local match mbegin mend
        setopt extendedglob
        [[ -n $LASTSEARCH ]] || return 0
        : ${LBUFFER%(#b)(*)$LASTSEARCH}
                CURSOR=$mend[1]
    fi

    return 0;
}

zle -N zle-isearch-exit

hist-inc-search-save-direction() {
   if [[ $WIDGET = *-forward ]]; then
       typeset -g ISEARCHDIR=1
       zle .history-incremental-search-forward "$@"
   else
       typeset -g ISEARCHDIR=-1
       zle .history-incremental-search-backward "$@"
   fi
}

zle -N history-incremental-search-forward hist-inc-search-save-direction
zle -N history-incremental-search-backward hist-inc-search-save-direction
export MAVEN_OPTS="-Xms1024m -Xmx1024m"


zle-isearch-exit() {
    if [[ $ISEARCHDIR -eq 1 ]]; then
        local match mbegin mend
        setopt extendedglob
        [[ -n $LASTSEARCH ]] || return 0
        : ${LBUFFER%(#bi)(*)$LASTSEARCH}
        CURSOR=$mend[1]
    fi

    return 0
}
zle -N zle-isearch-exit

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

function mds-git-up-dirs () {
    typeset -a failed_projects;

    for dir in $(ls --color=none); do
        if [[ -d $dir ]]; then
            cd $dir;
            echo "git pull $dir";
            git pull;
            if [[ $? -ne 0 ]]; then
                set -A failed_projects $dir;
            fi
            cd -;
        fi
    done

    echo "----------------------------------";
    echo "failed projects:"
    for fdir in $failed_projects; do
        echo $fdir;
    done
}

function mds-git-st-dirs () {
    for dir in $(ls --color=none); do
        if [[ -d $dir ]]; then
            cd $dir;
            echo "*DIR: cd $dir";
            git status --short;
            cd -;
        fi
    done
}

# export PATH=$PATH:/usr/local/bin:/usr/local/sbin
# export PATH=/usr/local/texlive/2013/bin/i386-linux:$PATH
# export PATH="/usr/local/bin:/usr/bin:/bin::"
if [ "$OSTYPE" = "cygwin" ] || [ "$OSTYPE" = "msys" ]; then
   export PATH="$PATH:$ZHANG_HOME/BTSync/Applications/Windows/emacs/bin:~/bin:/c/WINDOWS/system32:$HOME/utility-config/cygwin/bin"
fi

# export PATH="/home/$(whoami)/narwhal/bin:$PATH"
# export PATH="$PATH:$HOME/.local/bin" # Add RVM to PATH for scripting
export LANGUAGE=en_US
export LC_ALL=en_US.UTF-8

#zprof
alias nbstrip_jq="jq --indent 1 \
    '(.cells[] | select(has(\"outputs\")) | .outputs) = []  \
    | (.cells[] | select(has(\"execution_count\")) | .execution_count) = null  \
    | .metadata = {\"language_info\": {\"name\": \"python\", \"pygments_lexer\": \"ipython3\"}} \
    | .cells[].metadata = {} \
    '"
