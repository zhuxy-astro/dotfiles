# this file is sourced only in interactive shell
# this file should be linked to ~/.zshrc

# the following line is to determine which computer it is
case "$OSTYPE" in
    "darwin"*) localhostname=`scutil --get LocalHostName` ;; 
    "linux"*) localhostname=`hostname -s` ;; 
esac
export computer_is=${localhostname:0-3}

if [[ $computer_is = 'Pro' ]]
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    # allow screen to output the correct color
    export screen="/opt/homebrew/bin/screen"
fi

# ########################################### #
# BASIC SHELL CONFIG TO SET ON EVERY COMPUTER #
# ########################################### #

export TERM="xterm-256color"

# highlight in grep and ls
alias grep='grep --color=auto'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# bc数学模式
alias bc='bc -lq'

# tree, in order to print chinese characters properly
alias tree='tree -N'

alias du="du -sm * | sort -nr"
alias df="df -lh"

cddir()
{
    cd "`dirname $1`"
}

autoload zmv

# You may need to manually set your language environment
# When this is set, there will be no error when connecting to a remote Linux
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# clash proxy
alias ip="curl http://www.cip.cc"
proxyon()
{   export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
    curl http://www.cip.cc/
    return $?
}
proxyoff()
{   unset https_proxy http_proxy all_proxy
    curl http://www.cip.cc/
    return $?
}

git-add-commit()
{   if [[ `git status --porcelain` ]]; then
        git add -A
        git commit -m "`TZ=Asia/Shanghai date +\"%y-%m-%d %H:%M:%S\"` $*"
    else
        echo "Nothing to commit. Skipped."
        return 1
    fi
}

alias git-clone-set='git config --global url."https://gitclone.com/github.com".insteadOf https://github.com'
alias git-clone-unset='git config --global --unset url.https://gitclone.com/github.com.insteadof'

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

# ensure $HOME/.local/bin is prioritized
export MYPATH="$HOME/.local/bin"
export PATH="$MYPATH:$PATH"

# ######################################### #
# BASIC ZSH CONFIG TO SET ON EVERY COMPUTER #
# ######################################### #

bindkey -v
bindkey -v '^?' backward-delete-char
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# ignore cases
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

export PS1="%(?::%F{red}%?⏎ )%F{green}%* %F{cyan}%c%f "

# ############################# #
# THE END OF BASIC SHELL CONFIG #
# ############################# #

# python
# Setting PATH for Python 3.12
PATH="$(brew --prefix python@3.12)/libexec/bin:$PATH"
export PATH 

export PYTHONBREAKPOINT=ipdb.set_trace
export PIPX_DEFAULT_PYTHON=$(which python3.12)

alias venv='python3 -m venv'
export pyvenvs="$HOME"/Projects/pyvenvs
alias sci='source $pyvenvs/sci/bin/activate'
alias web='source $pyvenvs/web/bin/activate'

activate()
{   if [[ $? -eq 0 && -f venv/bin/activate ]]
    then
        source venv/bin/activate
    elif [[ -f "$1/bin/activate" ]]
    then
        source "$1/bin/activate"
    elif [[ -f "$pyvenvs/$1/bin/activate" ]] 
    then
        source "$pyvenvs/$1/bin/activate"
    else
        echo "No venv found. Nothing is done."
        return 1
    fi
}

# curl
curl-d()
{   curl -C - --output $HOME/Downloads/`basename $1` $1 
}

alias ssh-a="eval \$(ssh-agent -s) && ssh-add $HOME/.ssh/id_ed25519"

alias battery="pmset -g batt"
wake()
{   sudo pmset -b disablesleep "$1"
}

fcut()
{
    ffmpeg -ss "$1" -i input.mp4 -to "$2" -c copy "$3".mp4
}

# htop need sudo to see all the CPUs
# NOPASSWD is set for htop in `sudo visudo`
alias htop="sudo htop"

# set tmux session "bg"
startbg()
{
    tmux ls | grep "^bg: " 2> /dev/null
    no_bg=$?
    if [[ no_bg -eq 1 ]]
    then
        tmux new -d -s "bg"
    fi
}

# tmux set checking at "bg"
bgcheck()
{
    startbg
    # tmux a -t bg \; new-window "weibo" \; detach
    tmux a -t bg \; new-window "caffeinate; echo caffeinate" \; detach
    #tmux a -t bg \; new-window "its" \; detach
}

# my own simple paths
export proj="$HOME"/Projects
export data="$HOME"/Projects/Data
export pd="$HOME"/Projects/pure_disk
export ft="$HOME"/Projects/fromation\ time
export paper="$HOME"/Documents/astronomy/pure\ disk/paper
export pylib="$HOME"/Projects/pylib
export ast="$pylib"/astro_toolbox
export scr="$COMPUTER_PATH"/scripts
export dot="$COMPUTER_PATH"/dotfiles
export snip="$dot"/UltiSnips

export NOTE_BASE=$HOME"/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes"
export cn=$NOTE_BASE"/Computer"
export an=$NOTE_BASE"/Astronomy"
export dn=$NOTE_BASE"/Astronomy/Data"
export nn=$NOTE_BASE"/daily"
alias cn='note_core $cn'
alias an='note_core $an'
alias nn='note_core $nn'

alias down='cd ~/Downloads && ls'
alias desk='cd $HOME/Desktop && ls'
alias doc='cd $HOME/Documents && ls'
alias proj='cd "$proj" && ls'
alias data='cd "$data" && ls'
alias pd='cd "$pd" && ls'
alias drop='cd $HOME/Desktop/Drop\ Box && ls'

alias tex-md="vi "$NOTE_BASE"/Astronomy/tex_md.tex; open -a Obsidian"

export sd="$HOME"/Projects/stable-diffusion-webui
alias sd='cd '$sd' && ./webui.sh --no-half --opt-sub-quad-attention'

# scp name for vim
export scp_data_home="scp://2101110287@wmsk1-data.pku.edu.cn//gpfs/share/home/2101110287"
export scp_login_home="scp://2101110287@wmsk1-login.pku.edu.cn//gpfs/share/home/2101110287"
alias sshfs-data="sshfs 2101110287@wmsk1-data.pku.edu.cn:/gpfs/share/home/2101110287 /tmp/sshfs_pku"
alias sshfs-login="sshfs 2101110287@wmsk1-login.pku.edu.cn:/gpfs/share/home/2101110287 /tmp/sshfs_pku"
alias getbuf-data="scp -q pkudata:~/buffer ~/buffer && pbcopy < ~/buffer"
alias getbuf-login="scp -q pkulogin:~/buffer ~/buffer && pbcopy < ~/buffer"
alias sendbuf-data="scp -q ~/buffer pkudata:~/buffer"
alias sendbuf-login="scp -q ~/buffer pkulogin:~/buffer"

# diary
alias diary='vi -c "let b:copilot_enabled=v:false" -c "colorscheme default" -c "set laststatus=0" -c "set nonu" +$ '$HOME'/Documents/others/diary'

# if connecting from ssh, use tmux automatically
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux new -A -s ssh_tmux
fi

# BOINC
# BOINC=/Library/Application\ Support/BOINC\ Data
# export PATH="$BOINC":"$PATH"


if [[ $computer_is = 'Air' ]]
then
    # mysql
    PATH="/usr/local/mysql/bin/:${PATH}"    
    export PATH                             
    alias mysql.server='sudo /usr/local/mysql/support-files/mysql.server'
                                            
    # PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}" 

    #    . /Applications/exelis/idl82/bin/idl_setup.bash
    EXELIS_DIR=/Applications/exelis   
    IDL_DIR=/Applications/exelis/idl82      
    export IDL_DIR EXELIS_DIR           
    alias exelislicense=$IDL_DIR/bin/exelislicense
    alias idl=$IDL_DIR/bin/idl              
    if [ -x $IDL_DIR/bin/idlhelp ]; then 
      alias idlhelp=$IDL_DIR/bin/idlhelp
    fi
    if [ -x $IDL_DIR/bin/idlrpc ]; then
      alias idlrpc=$IDL_DIR/bin/idlrpc
    fi
    #rbenv
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

    # my own nvm and node.js installation, for running copilot in vim
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm by default
    # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm faster, but sometimes does not work
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

    #HEASORT required
    #export CC=/usr/bin/clang
    #export CXX=/usr/bin/clang++
    #export FC=/usr/local/bin/gfortran

    #HEASORT
    #export  HEADAS=/usr/local/heasoft-6.26.1/x86_64-apple-darwin19.3.0
    #alias heainit=". $HEADAS/headas-init.sh"
    #SAS
    #alias sasinit="source /usr/local/SAS/xmmsas_20190531_1155/setsas.sh" ## the version need modification.
    #export SAS_CCFPATH=/usr/local/SAS/ccf

fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# this should be at the end of the .zshrc file
if [[ $computer_is = 'Pro' ]]
then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [[ $computer_is = 'Air' ]]
then
    source /usr/local/Cellar/zsh-autosuggestions/0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8' #for zsh-autosuggestions
