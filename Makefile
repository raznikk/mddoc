#=====
# Makefile
#=====
README=README.md
MDDOC=./mddoc
RM=rm
CP=cp

SRCDIR=tasks handlers files templates vars defaults meta
#SRCDIR=src/tasks src/handlers src/files src/templates src/vars src/defaults src/meta
DISTDIR=dist
YMLEXT=yml
YAMLEXT=yml
J2EXT=j2
OBJDIR=docs

SRCS := $(shell find $(SRCDIR) -name '*$(YMLEXT)' -or -name '*$(YAMLEXT)' -or -name '*$(J2EXT)')
SRCDIRS := $(shell find . -name '*.$(SRCEXT)' -exec dirname {} \; | uniq)
OBJS := $(patsubst %.$(YMLEXT),$(OBJDIR)/%.md,$(SRCS)) $(patsubst %.$(YAMLEXT),$(OBJDIR)/%.md,$(SRCS)) $(patsubst %.$(J2EXT),$(OBJDIR)/%.md,$(SRCS))


#=====
# Targets
#=====
all: $(README)

dist: builddist
	$(CP) Makefile dist
	$(CP) $(MDDOC) dist

$(README): builddocs $(OBJS)
	cat $(OBJS) > $(README)

$(OBJDIR)/%.md: %.$(YMLEXT)
	touch $@
	$(MDDOC) $^ > $@

$(OBJDIR)/%.md: %.$(YAMLEXT)
	touch $@
	$(MDDOC) $^ > $@

$(OBJDIR)/%.md: %.$(J2EXT)
	touch $@
	$(MDDOC) $^ > $@


#=====
# Alternate targets
#=====
.PHONY: test clean
test:
	@echo "$(SRCDIR)"
	@echo "$(SRCS)"
	@echo "$(OBJS)"

clean:
	$(RM) -fr $(README)
	$(RM) -fr $(OBJDIR)

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
		mkdir -p ${OBJDIR}/$$dir; \
	done
endef

define make-dist
	mkdir $(DISTDIR)
endef
