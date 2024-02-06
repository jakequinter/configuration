# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"

# disabling for now, speed is more important
# function fish_greeting -d "Greeting message on shell session start up"
#   neofetch 
# end
set fish_greeting

# Enable Starship prompt
starship init fish | source

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
alias dcu="docker compose up"
alias dcb="docker compose build"
alias dcub="docker compose up --build"
alias dcd="docker compose down"
alias man="make alembic-new"
alias mar="make alembic-refresh"

alias treporting="docker-compose -f docker-compose.yml run reporting-app-client npm run test"
alias tcsr="docker-compose -f docker-compose.yml run csr-app-client npm run test"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# opam configuration
if test -r /Users/jakequinter/.opam/opam-init/init.fish
    source /Users/jakequinter/.opam/opam-init/init.fish > /dev/null ^ /dev/null
end

# wezterm
set -U fish_user_paths /Applications/WezTerm.app/Contents/MacOS $fish_user_paths

