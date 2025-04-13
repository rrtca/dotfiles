# Git completions for bash shell

_git_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main git commands
    local commands="status add commit push pull branch checkout merge diff log"
    
    # Handle main command completion
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi
    
    # Handle subcommands and options
    case "${prev}" in
        "git")
            COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
            ;;
        "add")
            # Complete with untracked and modified files
            local files=$(git ls-files --others --exclude-standard && git diff --name-only)
            COMPREPLY=( $(compgen -W "${files}" -- ${cur}) )
            ;;
        "checkout"|"branch")
            # Complete with branch names
            local branches=$(git branch | sed 's/^\*\{0,1\} //')
            COMPREPLY=( $(compgen -W "${branches}" -- ${cur}) )
            ;;
        "commit")
            COMPREPLY=( $(compgen -W "-m --message -a --all --amend" -- ${cur}) )
            ;;
        "push")
            COMPREPLY=( $(compgen -W "-f --force --all origin" -- ${cur}) )
            ;;
        "pull")
            COMPREPLY=( $(compgen -W "--rebase origin" -- ${cur}) )
            ;;
        *)
            ;;
    esac
}

# Register the completion function
complete -F _git_completions git 