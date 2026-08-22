# Makefile for pandoc conversion

MARKDOWNPATH = markdown
HTMLPATH = docs
CONVERTER = pandoc

MDSRC = $(shell find $(MARKDOWNPATH) -name "*.md")
MDOBJ = $(patsubst $(MARKDOWNPATH)/%.md, $(HTMLPATH)/%.html, $(MDSRC))

ODTSRC = $(shell find $(MARKDOWNPATH) -name "*.odt")
ODTOBJ = $(patsubst $(MARKDOWNPATH)/%.odt, $(HTMLPATH)/%.html, $(ODTSRC))

.PHONY: all clean

all: $(MDOBJ) $(ODTOBJ)
	@echo "[info] make: building site complete."

$(HTMLPATH)/%.html: $(MARKDOWNPATH)/%.md
	@test -d $(dir $@) || mkdir -p $(dir $@)
	@$(CONVERTER) "$<" -o "$@" --lua-filter=md2html.lua --template=template.html --toc --toc-depth=3
	@echo "[info] make: building $<."

$(HTMLPATH)/%.html: $(MARKDOWNPATH)/%.odt
	@test -d $(dir $@) || mkdir -p $(dir $@)
	@$(CONVERTER) "$<" -o "$@" --lua-filter=md2html.lua --template=template.html --toc --toc-depth=3
	@echo "[info] make: building $<."

clean:
	@test -d backup || mkdir -p backup
	@mv -f $(HTMLPATH)/css backup
	@mv -f $(HTMLPATH)/asset backup
	@rm -rf $(HTMLPATH)
	@mkdir $(HTMLPATH)
	@mv -f backup/css $(HTMLPATH)
	@mv -f backup/asset $(HTMLPATH)
	@rm -rf backup
