# modify but no re-export
OUT_LATEX_DEFAULT=$(OUT_LATEX)/default.pdf

all: pdf

pdf:
	@$(ECHO) "\t[PANDOC] default"
	@$(PANDOC_CC_PDF) 				\
		--template ./template.latex \
		$(SRC) -t json | $(PANDOC_FILTERS_AND_OUT) -o $(OUT_LATEX_DEFAULT)
