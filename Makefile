##
# Project Title
#
# @file
# @version 0.1

PHONY+=all
all: init.el $(HOME)/.emacs.d/modules/tools/lsp/autoload/flycheck-eglot.el

PHONY+=upgrade
upgrade:
# doom refuses to upgrade if .emacs.d is changed
	cd $(HOME)/.emacs.d && git reset HEAD --hard
	doom upgrade
# force a rebuild of everyting
	$(MAKE) --always-make all
# just to be safe
	doom sync

$(HOME)/.emacs.d/modules/tools/lsp/autoload/flycheck-eglot.el: $(HOME)/.emacs.d/eglot-flymake.patch
	cd $(HOME)/.emacs.d && git apply eglot-flymake.patch

$(HOME)/.emacs.d/eglot-flymake.patch: eglot-flymake.patch
	cp $< $@

init.el: doom.org
	emacs --batch \
		--eval "(require 'org)" \
		--eval '(org-babel-tangle-file "$<")'

.PHONY = $(PHONY)

# end
