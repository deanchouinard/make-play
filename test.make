SHELL := bash# we want bash behaviour in all shell invocations

RED := $(shell tput setaf 1)
GREEN := $(shell tput setaf 2)
NORMAL := $(shell tput setaf 7)

all:
	@ echo "$(RED)hello$(NORMAL)"
