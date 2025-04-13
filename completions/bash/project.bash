# Bash completion for project management command

_project_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Main commands
    local commands="create list open delete build test"
    
    # Handle main command completion
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $(compgen -W "${commands}" -- ${cur}) )
        return 0
    fi
    
    # Handle subcommands and options
    case "${prev}" in
        "create")
            if [[ "${cur}" == -* ]]; then
                COMPREPLY=( $(compgen -W "--template -t" -- ${cur}) )
            fi
            ;;
        "--template"|"-t")
            # Complete with available templates
            local templates=$(ls ~/.project/templates 2>/dev/null)
            COMPREPLY=( $(compgen -W "${templates}" -- ${cur}) )
            ;;
        "open"|"delete")
            # Complete with available projects
            local projects=$(ls ~/projects 2>/dev/null)
            COMPREPLY=( $(compgen -W "${projects}" -- ${cur}) )
            ;;
        "build"|"test")
            if [[ "${cur}" == -* ]]; then
                COMPREPLY=( $(compgen -W "--verbose -v --debug -d" -- ${cur}) )
            fi
            ;;
        *)
            ;;
    esac
}

# Register the completion function
complete -F _project_completions project 