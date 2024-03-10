# this file is sourced when a .sh file is run non-interactively, hence it should
# be kept simple because it may break some other unknown scripts.
# this file should be linked to ~/.zshenv

export SHELL='/bin/zsh'

# computer path for scripts ... 
export COMPUTER_PATH=$HOME"/Projects/computer"
export mypath="$COMPUTER_PATH"/mypath

# 自己的scripts进入path
PATH="${mypath}":"${PATH}"

export PYTHONPATH="$PYTHONPATH:$HOME/Projects/pylib/"

# python version
alias pip3='python3 -m pip'
alias ipython='python3 -m IPython'
alias ipython3='python3 -m IPython'

# aliases
git-add-commit()
{   if [[ `git status --porcelain` ]]; then
        git add -A
        git commit -m "`date +\"%y-%m-%d %H:%M:%S\"` $*"
    else
        echo "Nothing to commit. Skipped."
        return 1
    fi
}
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
