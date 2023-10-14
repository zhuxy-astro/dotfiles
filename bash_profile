# mysql
alias mysql='/usr/local/mysql/bin/mysql'
alias mysqladmin='/usr/local/mysql/bin/mysqladmin'
alias mysqlserver='sudo /usr/local/mysql/support-files/mysql.server'

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

#ds9
alias ds9='/Applications/ds9/ds9'

# Add iraf setup commands
if [ -e /Users/ZhuXY/.iraf/setup.sh ]; then
    source /Users/ZhuXY/.iraf/setup.sh
fi

export PATH=$PATH:/usr/local/chromedriver/

if [ "${BASH-no}" != "no" ]; then
    [ -r ~/.bashrc ] && . ~/.bashrc
fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
