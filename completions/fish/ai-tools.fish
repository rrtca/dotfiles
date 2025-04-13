# Completions for AI tools

# aider completions
complete -c aider -f -n '__fish_use_subcommand' -a '(__fish_complete_path)' -d 'File to edit'
complete -c aider -f -n '__fish_use_subcommand' -l model -d 'Model to use'
complete -c aider -f -n '__fish_use_subcommand' -l temperature -d 'Temperature setting'
complete -c aider -f -n '__fish_use_subcommand' -l context -d 'Context window size'
complete -c aider -f -n '__fish_use_subcommand' -l help -d 'Show help'

# gpt-cli completions
complete -c gpt -f -n '__fish_use_subcommand' -a '(__fish_complete_path)' -d 'File to process'
complete -c gpt -f -n '__fish_use_subcommand' -l model -d 'Model to use'
complete -c gpt -f -n '__fish_use_subcommand' -l temperature -d 'Temperature setting'
complete -c gpt -f -n '__fish_use_subcommand' -l max-tokens -d 'Maximum tokens'
complete -c gpt -f -n '__fish_use_subcommand' -l help -d 'Show help'

# shell-gpt completions
complete -c sgpt -f -n '__fish_use_subcommand' -a '(__fish_complete_path)' -d 'File to process'
complete -c sgpt -f -n '__fish_use_subcommand' -l model -d 'Model to use'
complete -c sgpt -f -n '__fish_use_subcommand' -l temperature -d 'Temperature setting'
complete -c sgpt -f -n '__fish_use_subcommand' -l shell -d 'Generate shell command'
complete -c sgpt -f -n '__fish_use_subcommand' -l code -d 'Generate code'
complete -c sgpt -f -n '__fish_use_subcommand' -l help -d 'Show help'

# chatgpt-cli completions
complete -c chatgpt -f -n '__fish_use_subcommand' -a '(__fish_complete_path)' -d 'File to process'
complete -c chatgpt -f -n '__fish_use_subcommand' -l model -d 'Model to use'
complete -c chatgpt -f -n '__fish_use_subcommand' -l temperature -d 'Temperature setting'
complete -c chatgpt -f -n '__fish_use_subcommand' -l max-tokens -d 'Maximum tokens'
complete -c chatgpt -f -n '__fish_use_subcommand' -l help -d 'Show help' 