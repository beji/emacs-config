# Explanation, copied from ChatGPT:

# TARGETS := init.el early-init.el: This creates a variable TARGETS containing the list of target files.

# guard-% rule: This is a generic rule that creates a guard file for each target.
# 	For example, guard-init.el and guard-early-init.el.
# 	It uses a pattern rule and a conditional shell command ([ ! -e ... ]) to check if the target file already exists.
# 	If not, it creates it.

# %.el: config.org guard-% dependency:
# 	This updated pattern rule now depends on both config.org and the corresponding guard file (e.g., guard-init.el).
# 	This ensures that the rule will only be executed if the guard file is created.

TARGETS := init.el early-init.el

PHONY+=all
all: $(TARGETS)

guard-%:
	@ if [ ! -e $(@:.guard-=%) ]; then touch $(@:.guard-=%); fi

%.el: config.org guard-%
	emacs --batch \
		--eval "(require 'org)" \
		--eval '(org-babel-tangle-file "$<")'

.PHONY = $(PHONY)
