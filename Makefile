MAKEFLAGS += --no-builtin-rules
BIKESHED ?= bikeshed
HTMLDIR ?= build
BIKESHED_PAGES =

.DEFAULT_GOAL ::= all
.PHONY: all clean

EXTRACT = rg --no-line-number --with-filename 'Shortname: ([PD].*)$$' --replace '$$1'
RM = $(if $(OS),rd /S /Q,rm -r)

GITHUB_REPOSITORY ?= slurps-mad-rips/papers
GITHUB_SHA ?= HEAD

BIKESHEDFLAGS += --md-local-boilerplate="computed-metadata yes"
BIKESHEDFLAGS += --md-text-macro="GITHUB-REPOSITORY $(GITHUB_REPOSITORY)"
BIKESHEDFLAGS += --md-text-macro="GITHUB-SHA $(GITHUB_SHA)"

BOILERPLATE := $(wildcard src/*.include)

define bikeshed-target =
$$(HTMLDIR)/$(lastword $(1)).html: BIKESHEDFLAGS += --md-text-macro="FILENAME $$<"
$$(HTMLDIR)/$(lastword $(1)).html: $(firstword $(1)) | $$(HTMLDIR) $$(BOILERPLATE)
	$$(BIKESHED) spec --gh-token "$$(GITHUB_TOKEN)" $$< $$@ $$(BIKESHEDFLAGS)
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
