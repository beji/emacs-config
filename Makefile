TARGETS := init.el

PHONY+=all
all: $(TARGETS)

%.el: config.org
	emacs --batch \
		--eval "(require 'org)" \
		--eval '(org-babel-tangle-file "$<")'

.PHONY = $(PHONY)
