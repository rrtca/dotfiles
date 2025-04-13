# Fish configuration file

# Set default editor
set -gx EDITOR vim
set -gx VISUAL vim

# Set umask
umask 072

# Set PATH
set -gx PATH $HOME/.local/bin $PATH

# Platform detection
if test (uname) = "Darwin"
    set -gx PLATFORM mac
else
    set -gx PLATFORM linux
end

# History settings
set -gx fish_history_size 10000
set -gx fish_history_max_size 20000

# Color settings
set -g fish_color_normal normal
set -g fish_color_command blue
set -g fish_color_quote yellow
set -g fish_color_redirection cyan
set -g fish_color_end green
set -g fish_color_error red
set -g fish_color_param cyan
set -g fish_color_comment brblack
set -g fish_color_match --background=brblue
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_operator brcyan
set -g fish_color_escape brcyan
set -g fish_color_autosuggestion brblack

# Aliases
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

# Git aliases
alias gs "git status"
alias gd "git diff"
alias gl "git log --oneline --graph --decorate"
alias gp "git pull"
alias gb "git branch"
alias gc "git commit"
alias ga "git add"

# Functions
function mkcd
    mkdir -p $argv[1]
    cd $argv[1]
end

function path
    echo $PATH | tr " " "\n"
end

# Load local configuration if it exists
if test -f $HOME/.config/fish/config.local.fish
    source $HOME/.config/fish/config.local.fish
end 