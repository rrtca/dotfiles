# Completions for project management command

# Main commands
complete -c project -f -n '__fish_use_subcommand' -a 'create' -d 'Create a new project'
complete -c project -f -n '__fish_use_subcommand' -a 'list' -d 'List all projects'
complete -c project -f -n '__fish_use_subcommand' -a 'open' -d 'Open an existing project'
complete -c project -f -n '__fish_use_subcommand' -a 'delete' -d 'Delete a project'
complete -c project -f -n '__fish_use_subcommand' -a 'build' -d 'Build a project'
complete -c project -f -n '__fish_use_subcommand' -a 'test' -d 'Run project tests'

# Options for create
complete -c project -f -n '__fish_seen_subcommand_from create' -l template -s t -d 'Project template'
complete -c project -f -n '__fish_seen_subcommand_from create' -a "(ls ~/.project/templates)" -d 'Available template'

# Options for open/delete
complete -c project -f -n '__fish_seen_subcommand_from open delete' -a "(ls ~/projects)" -d 'Project name'

# Options for build/test
complete -c project -f -n '__fish_seen_subcommand_from build test' -l verbose -s v -d 'Verbose output'
complete -c project -f -n '__fish_seen_subcommand_from build test' -l debug -s d -d 'Debug mode' 