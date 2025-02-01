SHELL := bash
.ONESHELL:
.SHELLFLAGS := -ceuo pipefail
.SILENT:

.PHONY: all
all:
	mkdir -p _build
	emacs -Q --batch --file gpg.org -f org-babel-tangle
	systemctl --user daemon-reload
	systemctl --user enable gpg-agent.socket
	systemctl --user start gpg-agent.socket
	systemctl --user status gpg-agent.socket
	systemctl --user status gpg-agent.service
