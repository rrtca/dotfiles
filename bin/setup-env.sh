#!/bin/bash

# Setup script for .env configuration

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to prompt for input with default value
prompt_with_default() {
    local prompt="$1"
    local default="$2"
    local var_name="$3"
    
    read -p "$prompt [$default]: " input
    eval "$var_name=\${input:-$default}"
}

# Function to validate directory path
validate_directory() {
    local path="$1"
    if [[ ! -d "$path" ]]; then
        mkdir -p "$path" || {
            echo -e "${RED}Error: Could not create directory $path${NC}"
            return 1
        }
    fi
    return 0
}

# Function to validate API key format
validate_api_key() {
    local key="$1"
    if [[ -z "$key" ]]; then
        echo -e "${RED}Error: API key cannot be empty${NC}"
        return 1
    fi
    return 0
}

echo -e "${YELLOW}Setting up .env configuration...${NC}"

# Create .env from .env-dist if it doesn't exist
if [[ ! -f .env ]]; then
    cp .env-dist .env
    echo -e "${GREEN}Created new .env file from template${NC}"
fi

# AI Tools Configuration
echo -e "\n${YELLOW}AI Tools Configuration${NC}"
prompt_with_default "Enter AI tools directory" "$HOME/.local/share/ai-tools" AI_TOOLS_DIR
validate_directory "$AI_TOOLS_DIR" || exit 1

# Shell Configuration
echo -e "\n${YELLOW}Shell Configuration${NC}"
prompt_with_default "Enter shell config directory" "$HOME/.config" SHELL_CONFIG_DIR
validate_directory "$SHELL_CONFIG_DIR" || exit 1

prompt_with_default "Enter fish config directory" "$SHELL_CONFIG_DIR/fish" FISH_CONFIG_DIR
validate_directory "$FISH_CONFIG_DIR" || exit 1

# Backup Configuration
echo -e "\n${YELLOW}Backup Configuration${NC}"
prompt_with_default "Enter backup directory" "$HOME/.dotfiles_backup" BACKUP_DIR
validate_directory "$BACKUP_DIR" || exit 1

# Update .env file
echo -e "\n${YELLOW}Updating .env file...${NC}"
sed -i.bak "s|^AI_TOOLS_DIR=.*|AI_TOOLS_DIR=$AI_TOOLS_DIR|" .env
sed -i.bak "s|^AI_DIST_DIR=.*|AI_DIST_DIR=$AI_TOOLS_DIR/dist|" .env
sed -i.bak "s|^SHELL_CONFIG_DIR=.*|SHELL_CONFIG_DIR=$SHELL_CONFIG_DIR|" .env
sed -i.bak "s|^FISH_CONFIG_DIR=.*|FISH_CONFIG_DIR=$FISH_CONFIG_DIR|" .env
sed -i.bak "s|^BASH_CONFIG_DIR=.*|BASH_CONFIG_DIR=$HOME|" .env
sed -i.bak "s|^BACKUP_DIR=.*|BACKUP_DIR=$BACKUP_DIR|" .env

# Clean up backup file
rm -f .env.bak

echo -e "\n${GREEN}Configuration complete!${NC}"
echo -e "Your .env file has been updated with the following settings:"
echo -e "AI Tools Directory: ${GREEN}$AI_TOOLS_DIR${NC}"
echo -e "Shell Config Directory: ${GREEN}$SHELL_CONFIG_DIR${NC}"
echo -e "Fish Config Directory: ${GREEN}$FISH_CONFIG_DIR${NC}"
echo -e "Backup Directory: ${GREEN}$BACKUP_DIR${NC}"

# Make the script executable
chmod +x "$0" 