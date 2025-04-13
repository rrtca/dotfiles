function switch_shell
    # Function to switch between shells
    if test (count $argv) -eq 0
        echo "Usage: switch_shell [bash|fish]"
        return 1
    end

    set -l target_shell $argv[1]
    set -l shell_path

    switch $target_shell
        case bash
            set shell_path (which bash)
        case fish
            set shell_path (which fish)
        case '*'
            echo "Unknown shell: $target_shell"
            echo "Available shells: bash, fish"
            return 1
    end

    # Check if shell exists
    if not test -x $shell_path
        echo "Shell not found: $shell_path"
        return 1
    end

    # Add shell to /etc/shells if not present
    if not grep -q "^$shell_path$" /etc/shells
        echo "Adding $shell_path to /etc/shells..."
        echo $shell_path | sudo tee -a /etc/shells
    end

    # Change shell
    echo "Switching to $target_shell..."
    chsh -s $shell_path
    echo "Shell changed to $target_shell. Changes will take effect on next login."
end 