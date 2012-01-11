# .bashrc
# vim: st=4 sw=4 fdm=marker cms=#%s

# User specific aliases and functions
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

##############################################################################################################
# 환경설정
##############################################################################################################
export IDXRDIR=/home/set/linguist
export IDXR2DIR=/home/set/linguist2_64

export CUBA2DIR=/home/set/cuba2

export CUBA_DIR=$COBA2DIR
export LINGUIST_DIR=$IDXR2DIR
export DICTIONARY_DIR=/home/set/dictionary_64
export NEXUS_DIR=$HOME/nexus

export NEXUS_MAKE_COLOR=enable

export LANG=ko_KR.utf8
export LC_ALL=ko_KR.utf8

export PATH=$HOME/bin:$NEXUS_DIR/bin:$HOME/bin/vim/bin:/usr/local/bin:/usr/local/klocwork/bin:$PATH
export LD_LIBRARY_PATH=$LINGUIST_DIR/lib:$NEXUS_DIR/lib:/usr/local/klocwork/lib:$LD_LIBRARY_PATH

# SVN 
export SVN_EDITOR=vim
export NEXUS_SVN=http://source.sc.nhncorp.com:21600/svn/nexus
export NT=$NEXUS_SVN/trunk
export NB=$NEXUS_SVN/branches

# using command line vi bind
set -o vi

# HISTORY
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="[%m.%d %H:%I:%S] "
export HISTSIZE=1000

# 256 color
export TERM=xterm-256color

export DUMA='LD_PRELOAD=/home1/kisow/lib/duma_2_5_15/libduma.so.0.0.0'
##############################################################################################################
# alias
##############################################################################################################

alias duma='LD_PRELOAD=/home1/kisow/lib/duma_2_5_15/libduma.so.0.0.0'
alias nexuslab='ssh -l dailytest nexuslab'
alias vi="/usr/local/bin/vim"
alias ks="killall nxpserver dcache_server"
alias valmygrind="valgrind -v --num-callers=40 --leak-check=full --show-reachable=yes --leak-resolution=high --trace-children=yes"
alias irlogin="rlogin -l irteam"
alias ped="printenv | grep '\(DIR\|PATH\)'"

alias euckr="export LANG=ko_KR.euckr; export LC_ALL=ko_KR.euckr"
alias utf8="export LANG=ko_KR.utf8; export LC_ALL=ko_KR.utf8"
#alias cd=cd_func
alias man=man_func
alias l32="set_l2_env /home/set/linguist2"
alias l64="set_l2_env /home/set/linguist2_64"

alias time_remover="sed -e \"s/0\.[0-9]\{4,\}/#VAR#/g\""

##############################################################################################################
# 
##############################################################################################################

cd_func ()#{{{
{
	local x2 the_new_dir adir index
	local -i cnt
	local dhistsize=20

	if [[ $1 ==  "--" ]]; then
		dirs -v
		return 0
	fi

	the_new_dir=$1
	[[ -z $1 ]] && the_new_dir=$HOME

	if [[ ${the_new_dir:0:1} == '-' ]]; then
#
# Extract dir N from dirs
		index=${the_new_dir:1}
		[[ -z $index ]] && index=1
		adir=$(dirs +$index)
		[[ -z $adir ]] && return 1
		the_new_dir=$adir
	fi

#
# '~' has to be substituted by ${HOME}
	[[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

#
# Now change to the new dir and add to the top of the stack
	pushd "${the_new_dir}" > /dev/null
	[[ $? -ne 0 ]] && return 1
	the_new_dir=$(pwd)

#
# Trim down everything beyond dhistsize th entry
	popd -n +${dhistsize} 2>/dev/null 1>/dev/null

#
# Remove any other occurence of this dir, skipping the top of the stack
	for ((cnt=1; cnt <= dhistsize; cnt++)); do
		x2=$(dirs +${cnt} 2>/dev/null)
		[[ $? -ne 0 ]] && return 0
		[[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
		if [[ "${x2}" == "${the_new_dir}" ]]; then
			popd -n +$cnt 2>/dev/null 1>/dev/null
			cnt=cnt-1
		fi
	done

	return 0
}
#}}}

man_func ()#{{{
{
	local oldLANG=$LANG
	export LANG="en_US"

	local oldLC_ALL=$LC_ALL
	export LC_ALL="en_US"

	/usr/bin/man $1 $2 $3 $4 $5 $6 $7 $8 $9

	LANG=$oldLANG
	LC_ALL=$oldLC_ALL
}
#}}}

pathmerge () #{{{
{
	export PATH=$1:`echo $PATH | sed -e "s|$1||"`
}
#}}}

libpathmerge () #{{{
{
	export LD_LIBRARY_PATH=$1:`echo $LD_LIBRARY_PATH | sed -e "s|$1||"`
}
#}}}

set_l2_env () #{{{
{
	export LINGUIST_DIR=$1
	pathmerge $LINGUIST_DIR/bin
	libpathmerge $LINGUIST_DIR/lib
}
#}}}

# ib 정답세트 관리#{{{
ibst()
{
	svn st | grep -E -e 'answers/utf8/ib_\w+/[^.]+$'
}

ibci()
{
	svn ci `ibst | awk '{ print $2}' | xargs`
}
#}}}
