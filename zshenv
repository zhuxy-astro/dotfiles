# this file is sourced when a .sh file is run non-interactively, hence it should
# be kept simple because it may break some other unknown scripts.
# this file should be linked to ~/.zshenv

export SHELL='/bin/zsh'

# computer path for scripts
export COMPUTER_PATH=$HOME"/Projects/computer"

# include my own python lib
export PYTHONPATH="$PYTHONPATH:$HOME/Projects/pylib/"

# pipx path and also mypath
export PATH="$PATH:/Users/zhuxy/.local/bin"
