# Add HomeBrew's bin directory to path so you can use HomeBrew's binaries like `starship`
# Fish uses `fish_add_path` instead of `export PATH` modify $PATH.
fish_add_path "/opt/homebrew/bin/"

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

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting -d "Greeting message on shell session start up"
  neofetch 
end
