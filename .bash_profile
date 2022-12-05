export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1="\u:\[\e[01;32m\]\w\[\e[0m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\]$ "
export EDITOR='vim'
export CLICOLOR=1
alias python3=/opt/homebrew/Cellar/python@3.10/3.10.8/bin/python3
alias pip3=/opt/homebrew/Cellar/python@3.10/3.10.8/bin/pip3

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

bitcoin() {
    python3 /users/jakequinter/developer/jdq/fun/tools/web/main.py “$1”
}
