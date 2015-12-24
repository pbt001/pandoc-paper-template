# modify but no re-export
OUT_LATEX_DEFAULT=$(OUT_LATEX)/paper-simple.pdf

export DOCUMENT_CLASS=report
export SETTING_FONTSIZE=12pt

all: pdf

pdf:
	@$(ECHO) "\t[PANDOC] paper-simple"
	@$(PANDOC_CC_PDF) 								\
		--template ./template.latex 				\
		--variable documentclass=$(DOCUMENT_CLASS)	\
		--variable fontsize=$(SETTING_FONTSIZE)		\
		--variable biblio-style=plain 				\
		$(SRC) -o $(OUT_LATEX_DEFAULT)
