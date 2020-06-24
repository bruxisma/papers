MAKEFLAGS += --no-builtin-rules
BIKESHED ?= bikeshed
HTMLDIR ?= html
VPATH = proposals:drafts

EXTRACT = rg --no-line-number --no-filename 'Shortname: (P.*)$$' --replace '$$1'

ifeq ($(OS),Windows_NT)
RM = del /q
else
RM = rm -r
endif

.PHONY: all clean
.SUFFIXES: .bs .html

proposals := $(notdir $(patsubst %.bs,%.html,$(wildcard proposals/*.bs)))

html = $(addprefix $(HTMLDIR)/,$(proposals))

all: $(html)

$(html): $(HTMLDIR)/%.html: %.bs | $(HTMLDIR)
	@$(BIKESHED) spec --gh-token "$(GITHUB_TOKEN)" $< $@
	$(info $(shell ${EXTRACT} $<) $(@F))

$(HTMLDIR):
	@mkdir $@

clean:
	@${RM} $(HTMLDIR)
