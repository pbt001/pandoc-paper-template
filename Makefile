#
#
#
# Variables
#
#
#

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
	--variable babel-lang=german					\
	--variable geometry=portrait					\
	--variable geometry=bindingoffset=1.5cm			\
	--variable geometry=inner=2.5cm					\
	--variable geometry=outer=2.5cm					\
	--variable geometry=top=3cm						\
	--variable geometry=bottom=2cm					\
	--include-before-body=$(BEFORE_LATEX)			\
	--include-after-body=$(AFTER_LATEX)

DOCUMENT_SETTINGS_HTML=			\
	--variable lang=de 			\
	--include-before-body=$(BEFORE_HTML)			\
	--include-after-body=$(AFTER_HTML)

#
#
#
# Binary and argument construction
#
#
#

ECHO_CMD=$(shell which echo)
ECHO_ARG=-e
ECHO=$(ECHO_CMD) $(ECHO_ARG)

MKDIR_CMD=$(shell which mkdir)
MKDIR_ARG=-p
MKDIR=$(MKDIR_CMD) $(MKDIR_ARG)

RM_CMD=$(shell which rm)
RM_ARG=-fr
RM=$(RM_CMD) $(RM_ARG)

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
	@$(ECHO) "\t[ALL   ]"

# PDF task
pdf: $(BIN) $(BEFORE_LATEX) $(AFTER_LATEX) $(OUT_PDF)
	@$(ECHO) "\t[PDF   ]"

# PDF output task
$(OUT_PDF): $(SRC)
	@$(ECHO) "\t[PANDOC]"
	@$(PANDOC_CC) 									\
		--template $(TEMPLATES)/latex/default.latex	\
		--latex-engine=pdflatex						\
		$(DOCUMENT_SETTINGS_PDF)					\
		$^ -o $@

# HTML task
html: $(BIN) $(BEFORE_HTML) $(AFTER_HTML) $(OUT_HTML)
	@$(ECHO) "\t[HTML  ]"

# HTML output task
$(OUT_HTML): $(SRC)
	@$(ECHO) "\t[PANDOC]"
	@$(PANDOC_CC) 									\
		--template=$(TEMPLATES)/html/default.html5	\
		-S											\
		--css=$(CSS_DIR)							\
		$^ -o $@

# create bin directory
$(BIN):
	@$(ECHO) "\t[MKDIR ]"
	@$(MKDIR) $(BIN)

# cleanup task
clean:
	@$(ECHO) "\t[RM    ]"
	@$(RM) $(BIN)

