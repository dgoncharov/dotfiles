# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

#
[ -f /etc/profile ] && source /etc/profile

export SHELL="/bin/bash"
export TZ=America/New_York
PATH=/usr/lib/colorgcc/bin:${PATH}:/sbin:/usr/sbin
PATH=${PATH/::/:}
PATH=${PATH/#:/}
PATH=${PATH/%:/}
export PATH
export CONFIG_SITE=/usr/local/etc/config.site
export GTK_USE_XFT=1
export EDITOR=vim
export PAGER=less
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
export GREP_COLOR=35
export GREP_OPTIONS="--color=auto"
export BLOCK_SIZE=human-readable
export LESS=-rf
export LESSCHARSET=utf-8
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
export XAUTHORITY="$HOME/.Xauthority"

alias du0='du -h --max-depth=0 -P'
alias du1='du -h --max-depth=1 -P'
alias d='dict -h dict.org'
alias ls='ls --color=auto'
alias ll='ls -lA'
alias cvs='colorcvs'
alias screen='screen -U'
alias vim='vim -N'
alias mplayer='mplayer -vo x11 -fs -zoom -idx'
alias diff='colordiff'

alias svn='colorsvn'
alias si='svn info'
alias svs='svn st | grep -v "\?" | egrep -v "!"'
alias svd='svn di --diff-cmd colordiff'
alias svc='svn ci `svs |grep -v Makefile |cut -d " " -f 8`'

alias defg++='echo "main(){}" | g++ -E -x c++ -dM - '
alias defgcc='echo "main(){}" | gcc -E -x c -dM - '
alias teamviewer='/opt/teamviewer6/teamviewer'

lsol()
{
    lsof -p $1 | grep lib | awk '{ print $9 }' | sort
}

rsed()
{
    if [ $# -ne 3 ]; then
        echo "Usage: `basename $0` <what> <replacement> <where>"
        return 1
    fi
    for f in $(find . -type f -regex "${3}"); do
        echo "${f}"
        sed "s:${1}:${2}:g" -i "${f}"
    done
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

gdb_get_backtrace() {
    local exe=$1
    local core=$2

    gdb ${exe} \
        --core ${core} \
        --batch \
        --quiet \
        -ex "thread apply all bt full" \
        -ex "quit"
}

d2h()
{
    bc <<< "obase=16; $1"
}

h2d()
{
    v=$(tr '[:lower:]' '[:upper:]' <<< $1)
    bc <<< "ibase=16; $v"

}

f2c()
{
    let t=$1-32
    let t=$t*5/9
    echo $t
}

c2f()
{
    let t=$1*9/5
    let t=$t+32
    echo $t
}

devinfo()
{
    udevadm info -a -p $(udevadm info -q path -n $1)
}

export defgcc  lsol rsed d2h h2d f2c c2f

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

