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
export PATH=/usr/lib/colorgcc/bin:$PATH:/sbin:/usr/sbin:/opt/intel/Compiler/11.1/072/bin/intel64
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
alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias cvs='colorcvs'
alias screen='screen -U'
alias vim='vim -N'
alias mplayer='mplayer -vo x11 -fs -zoom -idx'
alias diff='colordiff'
alias fdisk='fdisk -cu'

alias svn='colorsvn'
alias si='svn info'
alias svs='svn st | grep -v "\?" | egrep -v "!"'
alias svd='svn di --diff-cmd colordiff'
alias svc='svn ci `svs |grep -v Makefile |cut -d " " -f 8`'

alias defg++='echo "main(){}" | g++ -E -x c++ -dM - '
alias defgcc='echo "main(){}" | gcc -E -x c -dM - '
alias teamviewer='/opt/teamviewer6/teamviewer'

lsol ()
{
    lsof -p $1 | grep lib | awk '{ print $9 }' | sort
}

resed()
{
    if [ $# -ne 3 ]
    then
        echo "Usage: `basename $0` where what replacement"
        return 1
    fi
    echo "$1"
    echo "$2"
    echo "$3"

    for i in `find . -type f -regex $1`; do echo $i; sed 's/$2/$3/g' -i $i; done
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
    bc <<< "ibase=16; $1"
}

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

