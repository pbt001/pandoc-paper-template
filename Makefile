BIN=./bin
OUT_PDF=$(BIN)/paper.pdf
OUT_HTML=$(BIN)/paper.html

DOCUMENT_CLASS=scrbook

## Source directory
SRC_DIR=./src

## CSS directory
CSS_DIR=$(SRC_DIR)/css

## All markdown files in the working directory
SRC=$(wildcard $(SRC_DIR)/*.md)

## Templates
TEMPLATES=./template

## Location of your working bibliography file
BIB = $(shell find ./bib/ -name "*.bib")

# directory for before-body files
BEFORE_DIR=$(SRC_DIR)/before

# directory for after-body files
AFTER_DIR=$(SRC_DIR)/after

## Before and after file for latex
BEFORE_LATEX=$(BEFORE_DIR)/latex.tex
AFTER_LATEX=$(AFTER_DIR)/latex.tex

## Before and after file for html
BEFORE_HTML=$(BEFORE_DIR)/html5.html
AFTER_HTML=$(AFTER_DIR)/html5.html

DOCUMENT_SETTINGS_PDF=	\
	--variable fontsize=12pt						\
	--variable papersize=a4paper					\
	--variable classoption=bibtotoc					\
	--variable classoption=cleardoubleempty			\
	--variable classoption=idxtotoc					\
	--variable classoption=ngerman					\
	--variable classoption=openright				\
	--variable classoption=final					\
	--variable classoption=listof=nochaptergap		\
	--variable documentclass=$(DOCUMENT_CLASS)		\
	--include-before-body=$(BEFORE_LATEX)			\
	--include-after-body=$(AFTER_LATEX)


PANDOC=$(shell which pandoc)

PANDOC_BIBLIO=$(foreach x, $(BIB), --bibliography=$(x))

PANDOC_PARAMS=-r markdown+simple_tables+table_captions+yaml_metadata_block	\
			  --filter pandoc-citeproc										\
			  $(PANDOC_BIBLIO)

PANDOC_CC=$(PANDOC) $(PANDOC_PARAMS)

#
#
# Tasks
#
#

# Main task
all: pdf html

# PDF task
pdf: $(BIN) $(BEFORE_LATEX) $(AFTER_LATEX) $(OUT_PDF)

# PDF output task
$(OUT_PDF): $(SRC)
	$(PANDOC_CC) 									\
		--template $(TEMPLATES)/latex/default.latex	\
		--latex-engine=pdflatex						\
		$(DOCUMENT_SETTINGS_PDF)					\
		$^ -o $@

# create bin directory
$(BIN):
	mkdir -p $(BIN)

# cleanup task
clean:
	rm -fr $(BIN)

