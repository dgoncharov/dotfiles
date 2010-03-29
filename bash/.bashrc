#
# $Id: .bashrc 90 2007-02-12 21:05:53Z zaufi $
#

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

#
[ -f /etc/profile ] && source /etc/profile

export PATH=/usr/lib64/ccache/bin:$PATH:$HOME/bin:/usr/local/wss/bin
export CONFIG_SITE=/usr/local/etc/config.site
export GTK_USE_XFT=1
export EDITOR=/usr/bin/vim
export GREP_COLOR=35
export BLOCK_SIZE=human-readable
export LESS=-rf
export LESSCHARSET=utf-8
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/wss/lib/pkgconfig
export PALUDIS_OPTIONS="--log-level warning --dl-reinstall-scm weekly --show-reasons summary"
export RECONCILIO_OPTIONS="--log-level warning"
export LC_CTYPE='ru_RU.UTF-8'
export LC_NUMERIC='POSIX'
export LC_TIME='en_US.UTF-8'
export LC_COLLATE='ru_RU.UTF-8'
export LC_MONETARY='ru_RU.UTF-8'
export LC_MESSAGES='en_US.UTF-8'
export LC_PAPER='ru_RU.UTF-8'
export LC_NAME='ru_RU.UTF-8'
export LC_ADDRESS='ru_RU.UTF-8'
export LC_TELEPHONE='ru_RU.UTF-8'
export LC_MEASUREMENT='ru_RU.UTF-8'
export LC_IDENTIFICATION='ru_RU.UTF-8'
export LANG='en_US.UTF-8'

alias du0='du -h --max-depth=0 -P'
alias du1='du -h --max-depth=1 -P'
alias make='make-wrapper'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias d='dict -h dict.org'
alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias cvs='colorcvs'
alias screen='screen -U'
alias vim='vim -N'
alias mplayer='mplayer -vo x11 -fs -zoom -idx'

alias si='svn info'
alias svs='svn st | grep -v "\?" | egrep -v "!"'
alias svd='svn di `svs | grep -v Makefile |cut -d " " -f 8`'
alias svc='svn ci `svs |grep -v Makefile |cut -d " " -f 8`'

alias cdi='cd /root/work/spserver/trunk/ivr'
alias cdc='cd /root/work/spcommon/trunk'
alias cdp='cd /usr/local/store'
alias cds='cd /root/work/spserver/trunk'
alias cdb='cds; cd b2bua'
alias untabify='for i in `find . -type f -regex ".*\.\(c\|h\|cc\|hh\|icc\|tcc\|hxx\|cpp\|hpp\|inl\|sh\)"`; do echo $i; sed -i "s/\t/    /g" $i; done'
alias defg++='echo "main(){}" | g++ -E -x c++ -dM - '
alias defgcc='echo "main(){}" | gcc -E -x c -dM - '

lsol ()
{
    lsof -p $1 | grep lib | awk '{ print $9 }' | sort
}

shopt -s cdspell
shopt -s extglob
shopt -s dotglob
shopt -s cmdhist
shopt -s no_empty_cmd_completion
if [ `id -u` = "0" -o `id -g` = "0" ]
then
    ulimit -n 8192
fi
ulimit -c unlimited

# Midnight Commander chdir enhancement
if [ -f /usr/share/mc/mc.gentoo ]; then
    . /usr/share/mc/mc.gentoo
fi

# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
# (This is no longer needed from version 0.8 of the theme engine)
#export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# Some konsole magic
function set_konsole_tab_name()
{
    if test -n "$KONSOLE_DCOP_SESSION"; then
        sn=`dcop $KONSOLE_DCOP_SESSION sessionName`
        case $sn in
        Shell* | /* | \.\.\./*)
            cd=`pwd`
            dn=`dirname "$cd"`
            if test "/" = "$dn"; then
                dn="$cd"
            else
                tmp=`dirname "$dn"`
                if test "/" = "$tmp"; then
                    dn="$cd"
                else
                    local b=`basename "$dn"`
                    local d=`basename "$cd"`
                    dn=".../$b/$d"
                fi
            fi
            dcop $KONSOLE_DCOP_SESSION 'renameSession(QString)' "$dn"
            ;;
        *) ;;
        esac
    fi
}
PROMPT_COMMAND="set_konsole_tab_name"


