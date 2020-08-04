SHELL := /bin/bash

.PHONY: all
## TARGET: DESCRIPTION: ARGS
all: help

.PHONY: init
## init: Initialize terraform providers and modules
init:
	terraform init

.PHONY: plan
## plan: Generate a terraform plan
plan:
	terraform plan -out=tfplan

.PHONY: apply
## apply: Apply previously generate terraform plan
apply:
	terraform apply tfplan

.PHONY: requirements
## requirements: Update ansible roles
requirements:
	ansible-galaxy role install -r requirements.yml -f

.PHONY: vault
## vault: Edit vault secrets
vault:
	ansible-vault edit inventories/ansible/group_vars/all/vault.yml

.PHONY: encrypt
## encrypt: Encrypt string with ansible-vault : string=<string-to-encrypt>
encrypt:
ifndef string
	$(error string is undefined)
endif
	ansible-vault encrypt_string '${string}'

.PHONY: help
## help: Print this help message
help:
	@echo -e "Usage: \n"
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'
