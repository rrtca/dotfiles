# Bash completions for AI tools

_aider_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts="--model --temperature --context --help"
    
    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    
    COMPREPLY=( $(compgen -f -- ${cur}) )
}

_gpt_cli_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts="--model --temperature --max-tokens --help"
    
    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    
    COMPREPLY=( $(compgen -f -- ${cur}) )
}

_shell_gpt_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts="--model --temperature --shell --code --help"
    
    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    
    COMPREPLY=( $(compgen -f -- ${cur}) )
}

_chatgpt_cli_completions() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts="--model --temperature --max-tokens --help"
    
    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
        return 0
    fi
    
    COMPREPLY=( $(compgen -f -- ${cur}) )
}

# Register completion functions
complete -F _aider_completions aider
complete -F _gpt_cli_completions gpt
complete -F _shell_gpt_completions sgpt
complete -F _chatgpt_cli_completions chatgpt 