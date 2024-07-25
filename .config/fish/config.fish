# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"

# set -U neofetch_run_once 0
#
# function fish_greeting -d "Greeting message on shell session start up"
#   set -l current_pid %self
#   set -l lowest_pid (ps -eo pid=,args= | string match '*fish*' | awk '{print $1}' | sort -n | head -n 1)
#
#   # run neofetch on first shell
#   if test "$current_pid" -eq "$lowest_pid"
#     neofetch
#   end
# end

set fish_greeting

starship init fish | source

function fish_prompt
    if set -q fish_should_add_space
        if test "$fish_should_add_space" = "1"
            echo
        end
    end

    set -l cwd (pwd)
    set_color normal
    if test "$cwd" = "$HOME"
        echo "~"
    else if test (git rev-parse --is-inside-work-tree 2>/dev/null) = "true"
        echo (basename $cwd)
    else
        echo (string replace -r "^$HOME" '~' $cwd)
    end
    set_color "#ffa500"
    echo -n 'λ '
    set_color normal

    set -U fish_should_add_space 0
end
function prepare_command --on-event fish_preexec
    if not string match -q "clear" -- $argv
        set -U fish_should_add_space 1
    else
        set -U fish_should_add_space 0
    end
end

set -U fish_should_add_space 0

# homebrew path
set -gx PATH /opt/homebrew/bin $PATH

# pnpm path
set -gx PNPM_HOME /Users/jakequinter/Library/pnpm
set -gx PATH $PNPM_HOME $PATH

# bun path
set -gx BUN_INSTALL $HOME/.bun
set -gx PATH $BUN_INSTALL/bin $PATH

# alias
alias vim="nvim"
alias vt='vim "+terminal"'

# docker 
alias dcu="docker compose up"
alias dcb="docker compose build"
alias dcub="docker compose up --build"
alias dcd="docker compose down"
alias man="make alembic-new"
alias mar="make alembic-refresh"
alias treporting="docker-compose -f docker-compose.yml run reporting-app-client npm run test"
alias tcsr="docker-compose -f docker-compose.yml run csr-app-client npm run test"

# git
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -D"
alias gc="git commit"
alias gp="git push"
alias gpp="git pull"
alias gcb="git checkout -b"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# opam configuration
if test -r /Users/jakequinter/.opam/opam-init/init.fish
    source /Users/jakequinter/.opam/opam-init/init.fish > /dev/null ^ /dev/null
end

# wezterm
set -U fish_user_paths /Applications/WezTerm.app/Contents/MacOS $fish_user_paths

