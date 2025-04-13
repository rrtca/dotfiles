# Git completions for fish shell

# Common git commands
complete -c git -f -n '__fish_git_needs_command' -a 'status' -d 'Show working tree status'
complete -c git -f -n '__fish_git_needs_command' -a 'add' -d 'Add files to staging'
complete -c git -f -n '__fish_git_needs_command' -a 'commit' -d 'Record changes to repository'
complete -c git -f -n '__fish_git_needs_command' -a 'push' -d 'Update remote refs along with objects'
complete -c git -f -n '__fish_git_needs_command' -a 'pull' -d 'Fetch from and merge with another repository'
complete -c git -f -n '__fish_git_needs_command' -a 'branch' -d 'List, create, or delete branches'
complete -c git -f -n '__fish_git_needs_command' -a 'checkout' -d 'Switch branches or restore working tree files'
complete -c git -f -n '__fish_git_needs_command' -a 'merge' -d 'Join two or more development histories together'
complete -c git -f -n '__fish_git_needs_command' -a 'diff' -d 'Show changes between commits, commit and working tree, etc'
complete -c git -f -n '__fish_git_needs_command' -a 'log' -d 'Show commit logs'

# Git add completions
complete -c git -f -n '__fish_git_using_command add' -a '(__fish_git_untracked_files)' -d 'Untracked file'
complete -c git -f -n '__fish_git_using_command add' -a '(__fish_git_modified_files)' -d 'Modified file'

# Git branch completions
complete -c git -f -n '__fish_git_using_command branch' -a '(__fish_git_branches)' -d 'Branch'
complete -c git -f -n '__fish_git_using_command checkout' -a '(__fish_git_branches)' -d 'Branch'

# Common options
complete -c git -n '__fish_git_using_command commit' -l message -s m -d 'Use the given message as the commit message'
complete -c git -n '__fish_git_using_command push' -l force -s f -d 'Force push'
complete -c git -n '__fish_git_using_command pull' -l rebase -d 'Rebase the current branch on top of the upstream branch' 