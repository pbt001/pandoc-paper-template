# modify but no re-export
OUT_LATEX_DEFAULT=$(OUT_LATEX)/hs-furtwangen.pdf

all: pdf

pdf:
	@$(ECHO) "\t[PANDOC] hs-furtwangen"
	@$(PANDOC_CC_PDF) 				\
		--template ./template.latex \
		--variable toc=true			\
		--variable lot=true			\
		--variable lof=true			\
		--variable lol=true			\
		$(SRC) -o $(OUT_LATEX_DEFAULT)
