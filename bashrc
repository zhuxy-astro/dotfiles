export SHELL='/bin/bash'

# set vi
set -o vi

#    . /Applications/exelis/idl82/bin/idl_setup.bash
#
EXELIS_DIR=/Applications/exelis
IDL_DIR=/Applications/exelis/idl82
export IDL_DIR EXELIS_DIR
alias exelislicense=$IDL_DIR/bin/exelislicense
alias idl=$IDL_DIR/bin/idl
if [ -x $IDL_DIR/bin/idlde ]; then
  alias idlde=$IDL_DIR/bin/idlde
fi
if [ -x $IDL_DIR/bin/idlhelp ]; then
  alias idlhelp=$IDL_DIR/bin/idlhelp
fi
if [ -x $IDL_DIR/bin/idlrpc ]; then
  alias idlrpc=$IDL_DIR/bin/idlrpc
fi

#color of ls
export CLICOLOR=1
alias ls='ls -G'
export LSCOLORS=exfxcxdxbxegedabagacad

#grep高亮关键字
alias grep='grep --color=auto'

#PS1变量
#PS1='\[\e[35m\]\t \[\e[0m\]\h:\W \u\$ '
#PS1='\[\e[35m\]\t \[\e[0m\]#\# \h:\W\$ '
export PS1='\[\e[35m\]\t \[\e[0m\]#\# \W\$ '

#oldwangyiyun
alias wyy='open /Users/ZhuXY/Documents/computer/install/旧网易云.app'
