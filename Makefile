MAKEFLAGS += --no-builtin-rules
BIKESHED ?= bikeshed
HTMLDIR ?= build
ORIGIN ?= origin
BIKESHED_PAGES =

.DEFAULT_GOAL ::= all
.PHONY: all clean

RM = $(if $(OS),rd /S /Q,rm -r)
EXTRACT = rg --no-line-number --with-filename "Shortname: ([PD].*)$$" --replace "$$1"
GITHUB_REPOSITORY ?= $(shell git remote get-url origin --push | rg --no-line-number "^.*github.com[:/](.+).git" --replace "$$1")
GITHUB_SHA ?= HEAD

BIKESHEDFLAGS += --md-local-boilerplate="computed-metadata yes"
BIKESHEDFLAGS += --md-repository=$(GITHUB_REPOSITORY)

BIKESHEDFLAGS += --md-text-macro="GITHUB-SHA $(GITHUB_SHA)"

BOILERPLATE := $(wildcard src/*.include)

define bikeshed-target =
$$(HTMLDIR)/$(lastword $(1)).html: BIKESHEDFLAGS += --md-text-macro="FILENAME $$<"
$$(HTMLDIR)/$(lastword $(1)).html: $(firstword $(1)) $(BOILERPLATE) | $$(HTMLDIR)
	@$$(BIKESHED) spec --gh-token "$$(GITHUB_TOKEN)" $$< $$@ $$(BIKESHEDFLAGS)
	$$(info [BIKE]: $$(basename $$(@F)) -- $$(<F))
BIKESHED_PAGES += $$(HTMLDIR)/$(lastword $(1)).html
endef

extract-name = $(shell ${EXTRACT} $(1))
proposals = $(wildcard src/*.bs)
targets = $(foreach filename,${proposals},$(call extract-name,${filename}))

$(foreach target,$(targets),$(eval $(call bikeshed-target,$(subst :, ,$(target)))))

all: $(BIKESHED_PAGES)
$(BIKESHED_PAGES): $(HTMLDIR)

$(HTMLDIR):
	@mkdir $@

clean:
	@${RM} $(HTMLDIR)
