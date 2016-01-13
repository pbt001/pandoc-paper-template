OUT_LATEX_DEFAULT=$(OUT_LATEX_ASME)/asme-one-colum.pdf

DOCUMENT_CLASS=asme2ej
SETTING_FONTSIZE=10pt

all: pdf

pdf:
	@$(ECHO) "\t[PANDOC] asme-one-column"
	@$(PANDOC_CC_PDF) 									\
		--variable documentclass=$(DOCUMENT_CLASS)		\
		--variable fontsize=$(SETTING_FONTSIZE)			\
		--template ./template.latex 					\
		$(SRC) -t json | $(PANDOC_FILTERS_AND_OUT) -o $(OUT_LATEX_DEFAULT)

