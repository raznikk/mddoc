#=====
# Makefile
#=====
CP=cp
RM=rm
DIRECTORIES=meta defaults vars tasks handlers files templates
#=====
# Do not edit past this point
#=====
J2EXT=j2
SRCDIR=$(DIRECTORIES)
YMLEXT=yml
YAMLEXT=yml
DISTDIR=dist
OUTPUTDIR=docs

README=README.md
MDDOC=./mddoc

SRCS     := $(shell find $(SRCDIR) -name '*.$(YMLEXT)' -or -name '*.$(YAMLEXT)' -or -name '*.$(J2EXT)')
SRCDIRS  := $(shell find $(SRCDIR) -name '*.$(YMLEXT)' -or -name '*.$(YAMLEXT)' -or -name '*.$(J2EXT)' -exec dirname {} \; | uniq)
OBJS     := $(patsubst %,$(OUTPUTDIR)/%.md,$(SRCS))



#=====
# Targets
#=====
all: $(README)

dist: builddist
	$(CP) Makefile dist
	$(CP) $(MDDOC) dist

$(README): builddocs $(OBJS)
	cat $(OBJS) > $(README)

$(OUTPUTDIR)/%.$(YMLEXT).md: %.$(YMLEXT)
	touch $@
	$(MDDOC) $^ > $@

$(OUTPUTDIR)/%.$(YAMLEXT).md: %.$(YAMLEXT)
	touch $@
	$(MDDOC) $^ > $@

$(OUTPUTDIR)/%.$(J2EXT).md: %.$(J2EXT)
	touch $@
	$(MDDOC) $^ > $@


#=====
# Alternate targets
#=====
.PHONY: test clean

test:
	@echo "SRCS:   $(SRCS)"
	@echo "SRCDIR: $(SRCDIR)"
	@echo "OBJS:   $(OBJS)"

clean:
	$(RM) -fr $(README)
	$(RM) -fr $(OUTPUTDIR)

distclean: clean
	$(RM) -fr $(DISTDIR)

builddocs:
	$(call make-doctree)

builddist:
	$(call make-dist)


#=====
# Definitions
#=====
define make-doctree
	for dir in $(SRCDIR); \
	do \
		mkdir -p ${OUTPUTDIR}/$$dir; \
	done
endef

define make-dist
	mkdir $(DISTDIR)
endef
