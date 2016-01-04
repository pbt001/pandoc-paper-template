# modify but no re-export
OUT_LATEX_DEFAULT=$(OUT_LATEX)/letter.pdf

export DOCUMENT_CLASS=article
export SETTING_FONTSIZE=10pt

all: pdf

pdf:
	@$(ECHO) "\t[PANDOC] letter"
	@$(PANDOC_CC_PDF)                              	\
		--latex-engine=xelatex                     	\
		--variable documentclass=$(DOCUMENT_CLASS) 	\
		--variable fontsize=$(SETTING_FONTSIZE)    	\
		--variable mainfont="Hoefler Text"			\
		--variable altfont="Helvetica Neue"			\
		--variable monofont="Courier"				\
		--variable geometry="a4paper, left=35mm, right=35mm, top=50mm, bottom=25mm"	 \
		--template ./template.latex                 \
		$(SRC) -o $(OUT_LATEX_DEFAULT)
