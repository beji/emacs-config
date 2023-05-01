##
# Project Title
#
# @file
# @version 0.1

PHONY+=all
all: init.el

PHONY+=upgrade
upgrade:
	doom upgrade
# force a rebuild of everyting
	$(MAKE) --always-make all
# just to be safe
	doom sync

init.el: doom.org
	emacs --batch \
		--eval "(require 'org)" \
		--eval '(org-babel-tangle-file "$<")'

.PHONY = $(PHONY)

# end
