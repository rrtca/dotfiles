function sync_env
    # Function to sync environment variables between shells
    set -l bash_env $HOME/.bash_env
    set -l fish_env $HOME/.config/fish/conf.d/shared_env.fish

    # Create backup of current files
    if test -f $bash_env
        cp $bash_env $bash_env.bak
    end
    if test -f $fish_env
        cp $fish_env $fish_env.bak
    end

    # Get current environment variables
    set -l env_vars (set -x | string replace -r '^([^ ]+).*$' '$1')

    # Write to bash environment file
    echo "# Generated environment variables" > $bash_env
    for var in $env_vars
        echo "export $var='$$var'" >> $bash_env
    end

    # Write to fish environment file
    echo "# Generated environment variables" > $fish_env
    for var in $env_vars
        echo "set -gx $var '$$var'" >> $fish_env
    end

    echo "Environment variables synchronized between bash and fish"
    echo "Backups created at:"
    echo "  - $bash_env.bak"
    echo "  - $fish_env.bak"
end 