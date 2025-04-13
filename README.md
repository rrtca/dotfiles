# Dotfiles

🏠 Personal dotfiles for \*NIX (macOS and Linux) systems.

## Features

- 🐚 Multiple shell support (Bash, Fish, Zsh)
- 🔄 Smooth shell transition
- 🎯 Comprehensive command completions
- 🛠️ Easy installation and updates
- 🔒 Secure configuration management
- 📦 Package management integration
- 🤖 AI CLI tools integration

## Quick Start

### Installation

```bash
# One-liner installation
curl -fsSL https://dotfiles.rrt.ca/etc/install | bash

# Manual installation
git clone --recursive https://github.com/rrtca/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && make install
```

### Makefile Commands

The repository includes a Makefile with useful commands:

```bash
make help              # Show all available commands
make install          # Run installer
make update          # Pull updates and run installer
make clean           # Clean temporary files
make completions     # Install shell completions
make fish            # Install fish configuration
make bash            # Install bash configuration
make test            # Run tests
make backup          # Create backup of current dotfiles
```

## Shell Configuration

### Bash (Primary Shell)

- Custom prompt with git integration
- Platform-specific configurations
- Comprehensive aliases and functions
- Command completion system

### Fish Shell

- Modern syntax highlighting
- Autosuggestions
- Git integration
- Vi-style key bindings
- Environment variable management

### Shell Transition

Features to ensure smooth transition between shells:

1. **Shared Environment**:
   - Synchronized environment variables
   - Common aliases and functions
   - Consistent platform detection

2. **Shell Switching**:
   ```bash
   # Switch to fish
   switch_shell fish
   
   # Switch back to bash
   switch_shell bash
   ```

3. **Environment Sync**:
   ```bash
   # Sync environment variables
   sync_env
   ```

## Command Completions

The repository includes a unified completion system:

1. **Available Completions**:
   - Git commands and options
   - Project management
   - Custom commands

2. **Installation**:
   ```bash
   make completions
   ```

3. **Adding New Completions**:
   ```bash
   # 1. Create fish completion
   vim completions/fish/new_command.fish
   
   # 2. Create bash completion
   vim completions/bash/new_command.bash
   
   # 3. Install completions
   make completions
   ```

## Package Management

### Linux (Local Installation)

Install common tools without sudo:

```bash
make install neovim     # -> ~/.local/bin/nvim
make install ripgrep    # -> ~/.local/bin/rg
```

### macOS

```bash
brew install fish neovim ripgrep
```

## AI Tools

The repository includes installation targets for popular AI CLI tools:

### Available Tools

- **aider**: AI pair programming tool
- **gpt-cli**: GPT command line interface
- **shell-gpt**: Shell integration with GPT
- **chatgpt-cli**: ChatGPT command line interface

### Installation

```bash
# Install all AI tools
make ai-tools

# Install specific tools
make aider          # Install aider
make gpt-cli        # Install gpt-cli
make shell-gpt      # Install shell-gpt
make chatgpt-cli    # Install chatgpt-cli
```

### Distribution Files

The installation process:
1. Downloads distribution files to `~/.local/share/ai-tools/dist/`
2. Installs tools from local distribution files
3. Maintains offline installation capability

To clean distribution files:
```bash
make ai-tools-clean
```

### Usage Examples

```bash
# Using aider for pair programming
aider myfile.py

# Using gpt-cli for quick queries
gpt "how to sort a list in python"

# Using shell-gpt for shell commands
sgpt "find all files modified in the last 24 hours"

# Using chatgpt-cli for interactive chat
chatgpt
```

## Troubleshooting

### Common Issues

1. **File Conflicts**:
   - If target files exist, resolve conflicts manually
   - Use `make backup` to create backups before installation

2. **Font Issues**:
   - Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) v3.1.1+
   - Recommended: `JetBrainsMono Nerd Font Mono`

3. **Shell Issues**:
   - Run `make test` to check for common problems
   - Use `make update` to ensure everything is up-to-date

### Getting Help

- Check the [issues](https://github.com/rrtca/dotfiles/issues) page
- Run `make test` to diagnose problems
- Use `make backup` before making changes

## License

[The MIT License (MIT)](LICENSE)

Copyright (c) 2012-2025 Jongwook Choi (@wookayin)
Copyright (c) 2025 Ryan Thompson (@rrtca)