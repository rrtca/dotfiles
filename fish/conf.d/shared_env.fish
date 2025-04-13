# Shared environment variables between bash and fish

# Set common environment variables
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less
set -gx LESS "-R"

# Set PATH consistently with bash
set -gx PATH $HOME/.local/bin $PATH

# Platform detection (consistent with bash)
if test (uname) = "Darwin"
    set -gx PLATFORM mac
else
    set -gx PLATFORM linux
end

# Load bash environment if available
if test -f $HOME/.bash_env
    # Use bass to source bash environment
    bass source $HOME/.bash_env
end

# Shared aliases that match bash
alias ls "ls -F"
if test $PLATFORM = "mac"
    alias ls "ls -F -G"
else
    alias ls "ls -F --color=auto"
end
alias ll "ls -alF"
alias grep "grep --color=auto"
alias fgrep "fgrep --color=auto"
alias egrep "egrep --color=auto"
alias rm "rm -iv"
alias cp "cp -ivp"
alias mv "mv -iv"
alias scr "screen -rD"

# Git aliases (consistent with bash)
alias gs "git status"
alias gd "git diff"
alias gl "git log --oneline --graph --decorate"
alias gp "git pull"
alias gb "git branch"
alias gc "git commit"
alias ga "git add" 