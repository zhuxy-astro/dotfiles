# this file is sourced when a .sh file is run non-interactively.
# this file should be linked to ~/.zshenv

export SHELL='/bin/zsh'

export TERM="xterm-256color"
# computer path for scripts ... 
export COMPUTER_PATH="/Users/ZhuXY/Projects/computer"
export scr="$COMPUTER_PATH"/scripts
export dot="$COMPUTER_PATH"/dotfiles
export mypath="$COMPUTER_PATH"/mypath

# 自己的scripts进入path
PATH="${mypath}":"${PATH}"

# aliases
alias git-add-commit='git add -A && git commit -m "`date +%y%m%d`"'

alias hostn='scutil --get LocalHostName'

# find filename
findname()
{   # name type=f depth=2 suffix=""
    if [[ -z $4 ]]
    then
        suf=""
    else
        suf=."$4"
    fi
    find . -type ${2:-f} -maxdepth ${3:-2} -name "$1*$suf"
}
