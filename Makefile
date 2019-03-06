SHELL := bash# we want bash behaviour in all shell invocations

RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
YELLOW := $(shell tput setaf 3)
BOLD := $(shell tput bold)
NORMAL := $(shell tput sgr0)

LPASS := "test"
$(LPASS):
	@echo "lpass"

SECRETS := "PSST_SECRET"

ifneq (4,$(firstword $(sort $(MAKE_VERSION) 4)))
	$(warning $(BOLD)$(RED)GNU Make v4 or newer is required$(NORMAL))
	$(info On macOS it can be installed with $(BOLD)brew install make$(NORMAL) and run as $(BOLD)gmake$(NORMAL))
	$(error Please run with GNU Make v4 or newer)
endif

.DEFAULT_GOAL := help

colours:
	@echo "$(BOLD)BOLD $(RED)RED $(GREEN)GREEN $(YELLOW)YELLOW $(NORMAL)"

SEPARATOR := ---------------------------------------------------------------------------------
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:+.*?## .*$$' $(MAKEFILE_LIST) | \
	awk 'BEGIN { FS = "[:#]" } ; { printf "$(SEPARATOR)\n\033[36m%-22s\033[0m %s\n", $$1, $$4 }' ; \
	echo $(SEPARATOR)


.PHONY: add-secret
add-secret: $(LPASS) ## as  | Add secret to LastPass
ifndef SECRET
	@echo "$(RED)SECRET$(NORMAL) environment variable must be set to the name of the secret that be added" && \
	echo "This value must be in upper-case, e.g. $(BOLD)SOME_SECRET$(NORMAL)" && \
	echo "This value must not match any of the existing secrets:" && \
	$(SECRETS) && \
	exit 1
endif
# 	@$(LPASS) add --notes "Shared-changelog/secrets/$(SECRET)"
.PHONY: as
as: add-secret

