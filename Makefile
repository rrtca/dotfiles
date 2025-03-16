# Makefile for dotfiles

mkenv ?= .env
include $(mkenv)
export $(shell sed 's/=.*//' $(mkenv))
# Change the default config with `make mkenv="path/to/overriding.env" build`

.PHONY: help 

help: ## List the available Make targets (default)
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.DEFAULT_GOAL := help

install: ## Run installer
	@python ./install.py

update: ## Pull updates
	@git pull


