function env
    # List all environment variables
    if test (count $argv) -eq 0
        set -l vars (set -x | string replace -r '^([^ ]+).*$' '$1')
        for var in $vars
            echo "$var = $$var"
        end
        return 0
    end

    # Set environment variable
    if test (count $argv) -eq 2
        set -gx $argv[1] $argv[2]
        return 0
    end

    # Get environment variable
    if test (count $argv) -eq 1
        if set -q $argv[1]
            echo $$argv[1]
            return 0
        else
            echo "Variable $argv[1] is not set"
            return 1
        end
    end

    echo "Usage: env [VAR [VALUE]]"
    return 1
end 