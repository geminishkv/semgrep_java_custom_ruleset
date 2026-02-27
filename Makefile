.PHONY: help init update-rules commit-rules \
        scan scan-official scan-custom scan-critical scan-ci \
        validate stats status clean dist-clean \
        install uninstall

JAVA_RULES_DIR ?= rules/official-java-semgrep/java
CUSTOM_RULES_DIR ?= rules/custom
SRC_DIR ?= src
REPORT_DIR ?= reports

SCRIPTS_DIR ?= scripts

PREFIX   ?= /usr/local
BINDIR   ?= $(PREFIX)/bin
SHAREDIR ?= $(PREFIX)/share/java_recon
BINNAME  ?= java_recon

install:
	@echo "Installing java_recon to $(SHAREDIR)..."
	install -d "$(SHAREDIR)/scripts"
	install -m 0755 $(SCRIPTS_DIR)/semgrep-*.sh "$(SHAREDIR)/scripts/"
	install -m 0755 $(SCRIPTS_DIR)/java_recon.sh "$(SHAREDIR)/scripts/java_recon"
	install -d "$(BINDIR)"
	printf '%s\n' '#!/usr/bin/env bash' >  "$(BINDIR)/$(BINNAME)"
	printf '%s\n' 'exec "$(SHAREDIR)/scripts/java_recon" "$$@"' >> "$(BINDIR)/$(BINNAME)"
	chmod 0755 "$(BINDIR)/$(BINNAME)"

uninstall:
	rm -f "$(BINDIR)/$(BINNAME)"
	rm -rf "$(SHAREDIR)"
