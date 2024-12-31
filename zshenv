# this file is sourced when a .sh file is run non-interactively, hence it should
# be kept simple because it may break some other unknown scripts.
# this file should be linked to ~/.zshenv

export SHELL='/bin/zsh'

# computer path for scripts... 
export COMPUTER_PATH=$HOME"/Projects/computer"

# 自己的scripts进入path
# export mypath="$COMPUTER_PATH"/mypath
export mypath="$HOME"/.local/bin
PATH="${mypath}":"${PATH}"

export PYTHONPATH="$PYTHONPATH:$HOME/Projects/pylib/"
export PYTHONBREAKPOINT=ipdb.set_trace
# pipx path
export PATH="$PATH:/Users/zhuxy/.local/bin"

# vi for Air
alias vi='vim'

# for crontab
export EDITOR="vim"

# clash proxy
proxyon()
{   export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    curl http://www.cip.cc/
}
proxyoff()
{   unset https_proxy http_proxy all_proxy
    curl http://www.cip.cc/
}

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
