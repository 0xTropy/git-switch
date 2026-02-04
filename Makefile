PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
SCRIPT_NAME := git-cli-login

.PHONY: install uninstall help

install:
	@echo "Installing $(SCRIPT_NAME) to $(BINDIR)..."
	@install -d "$(BINDIR)"
	@install -m 0755 "./$(SCRIPT_NAME)" "$(BINDIR)/$(SCRIPT_NAME)"
	@echo "Done. Make sure '$(BINDIR)' is on your PATH."

uninstall:
	@echo "Removing $(BINDIR)/$(SCRIPT_NAME)..."
	@rm -f "$(BINDIR)/$(SCRIPT_NAME)"
	@echo "Done."

help:
	@echo "Available targets:"
	@echo "  make install              Install $(SCRIPT_NAME) into $(BINDIR)"
	@echo "  make uninstall            Remove $(SCRIPT_NAME) from $(BINDIR)"
	@echo ""
	@echo "Example usage after install:"
	@echo "  git-cli-login personal          # set personal profile globally"
	@echo "  git-cli-login work              # set work profile globally"
	@echo "  git-cli-login --local personal  # set personal profile only for current repo"

