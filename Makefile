PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
SCRIPT_NAME := git-cli-login

.PHONY: install uninstall

install:
	@echo "Installing $(SCRIPT_NAME) to $(BINDIR)..."
	@install -d "$(BINDIR)"
	@install -m 0755 "./$(SCRIPT_NAME)" "$(BINDIR)/$(SCRIPT_NAME)"
	@echo "Done. Make sure '$(BINDIR)' is on your PATH."

uninstall:
	@echo "Removing $(BINDIR)/$(SCRIPT_NAME)..."
	@rm -f "$(BINDIR)/$(SCRIPT_NAME)"
	@echo "Done."

