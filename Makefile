# Makefile for dotfiles

### AI DO NOT EDIT BELOW THIS LINE ###
mkenv ?= .env
include $(mkenv)
export $(shell sed 's/=.*//' $(mkenv))
# Change the default config with `make mkenv="path/to/overriding.env" build`

.PHONY: help install update clean completions fish bash test backup ai-tools ai-tools-clean neovim

help: ## List the available Make targets (default)
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

### AI DO NOT CHANGE ABOVE THIS LINE ###

### AI MAKE YOUR EDIT BELOW THIS LINE ###

.DEFAULT_GOAL := help

# AI Tools Configuration
AI_TOOLS_DIR := $(HOME)/.local/share/ai-tools
AI_DIST_DIR := $(AI_TOOLS_DIR)/dist

# Neovim Configuration
NVIM_CONFIG_DIR := $(HOME)/.config/nvim

install: ## Run installer
	@python ./install.py

update: ## Pull updates and run installer
	@git pull
	@python ./install.py

clean: ## Clean temporary files and backups
	@find . -name "*.bak" -delete
	@find . -name "*.swp" -delete
	@find . -name "*.swo" -delete
	@find . -name "*~" -delete
	@rm -rf $(AI_DIST_DIR)/*

completions: ## Install shell completions
	@./completions/install_completions.sh

fish: ## Install fish shell configuration
	@mkdir -p $(FISH_CONFIG_DIR)
	@ln -sf $(PWD)/fish/config.fish $(FISH_CONFIG_DIR)/config.fish
	@ln -sf $(PWD)/fish/functions $(FISH_CONFIG_DIR)/functions
	@ln -sf $(PWD)/fish/completions $(FISH_CONFIG_DIR)/completions

bash: ## Install bash configuration
	@ln -sf $(PWD)/bashrc $(BASH_CONFIG_DIR)/.bashrc
	@ln -sf $(PWD)/bash_completion.d $(BASH_CONFIG_DIR)/.bash_completion.d

test: ## Run tests
	@echo "Running shellcheck on shell scripts..."
	@find . -name "*.sh" -exec shellcheck {} \;
	@echo "Running python tests..."
	@python -m pytest tests/

backup: ## Create backup of current dotfiles
	@mkdir -p $(BACKUP_DIR)
	@cp -r $(BASH_CONFIG_DIR)/.bashrc $(BASH_CONFIG_DIR)/.bash_completion.d $(FISH_CONFIG_DIR) $(BACKUP_DIR)/
	@echo "Backup created in $(BACKUP_DIR)"

# AI Tools Installation
ai-tools: ## Install all AI CLI tools
	@echo "Installing AI CLI tools..."
	@mkdir -p $(AI_TOOLS_DIR) $(AI_DIST_DIR)
	@make aider
	@make gpt-cli
	@make shell-gpt
	@make chatgpt-cli
	@echo "AI tools installation complete"

aider: ## Install aider (AI pair programming tool)
	@echo "Installing aider..."
	@mkdir -p $(AI_DIST_DIR)/aider
	@pip download --dest $(AI_DIST_DIR)/aider aider-chat
	@pip install --user --no-index --find-links=$(AI_DIST_DIR)/aider aider-chat
	@echo "aider installed successfully"

gpt-cli: ## Install gpt-cli (GPT command line interface)
	@echo "Installing gpt-cli..."
	@mkdir -p $(AI_DIST_DIR)/gpt-cli
	@pip download --dest $(AI_DIST_DIR)/gpt-cli gpt-cli
	@pip install --user --no-index --find-links=$(AI_DIST_DIR)/gpt-cli gpt-cli
	@echo "gpt-cli installed successfully"

shell-gpt: ## Install shell-gpt (Shell integration with GPT)
	@echo "Installing shell-gpt..."
	@mkdir -p $(AI_DIST_DIR)/shell-gpt
	@pip download --dest $(AI_DIST_DIR)/shell-gpt shell-gpt
	@pip install --user --no-index --find-links=$(AI_DIST_DIR)/shell-gpt shell-gpt
	@echo "shell-gpt installed successfully"

chatgpt-cli: ## Install chatgpt-cli (ChatGPT command line interface)
	@echo "Installing chatgpt-cli..."
	@mkdir -p $(AI_DIST_DIR)/chatgpt-cli
	@pip download --dest $(AI_DIST_DIR)/chatgpt-cli chatgpt-cli
	@pip install --user --no-index --find-links=$(AI_DIST_DIR)/chatgpt-cli chatgpt-cli
	@echo "chatgpt-cli installed successfully"

ai-tools-clean: ## Clean AI tools distribution files
	@echo "Cleaning AI tools distribution files..."
	@rm -rf $(AI_DIST_DIR)
	@echo "AI tools distribution files cleaned"

# Neovim Installation
neovim: ## Install Neovim and its configuration
	@echo "Installing Neovim..."
	@mkdir -p $(NVIM_CONFIG_DIR)
	@ln -sf $(PWD)/nvim/init.lua $(NVIM_CONFIG_DIR)/init.lua
	@ln -sf $(PWD)/nvim/lua $(NVIM_CONFIG_DIR)/lua
	@echo "Neovim configuration installed successfully"


