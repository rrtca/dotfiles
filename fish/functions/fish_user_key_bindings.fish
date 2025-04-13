function fish_user_key_bindings
    # Use vi key bindings
    fish_vi_key_bindings
    
    # Add custom key bindings
    bind -M insert \cf accept-autosuggestion
    bind -M insert \cr history-search-backward
end 