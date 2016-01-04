#
#
#
# Variables
#
#
#

export MAKE_FLAGS=--no-print-directory

export OUT=$(shell pwd)/bin
export OUT_LATEX=$(OUT)/latex/
export OUT_HTML=$(OUT)/html/

DOCUMENT_CLASS=scrbook

## Source directory
SRC_DIR=$(shell pwd)/src

## CSS directory
CSS_DIR=$(SRC_DIR)/css

## All markdown files in the working directory
export SRC=$(shell find $(SRC_DIR) -name "*.md" | sort)

## Templates
TEMPLATES=$(shell pwd)/template

## Location of your working bibliography file
BIB=$(shell find $(shell pwd)/bib/ -name "*.bib")

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
	--listings			\
	--variable fontsize=$(SETTING_FONTSIZE)			\
	--variable papersize=a4paper					\
	--variable classoption=bibliography=totoc		\
	--variable classoption=cleardoublepage=empty	\
	--variable classoption=index=totoc				\
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
	--variable linestretch=1.5 						\
	--include-before-body=$(BEFORE_LATEX)			\
	--include-after-body=$(AFTER_LATEX)

DOCUMENT_SETTINGS_HTML=			\
	--table-of-contents			\
	--webtex					\
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
export ECHO

MKDIR_CMD=$(shell which mkdir)
MKDIR_ARG=-p
MKDIR=$(MKDIR_CMD) $(MKDIR_ARG)
export MKDIR

RM_CMD=$(shell which rm)
RM_ARG=-fr
RM=$(RM_CMD) $(RM_ARG)
export RM

PANDOC=$(shell which pandoc)

PANDOC_BIBLIO=$(foreach x, $(BIB), --bibliography=$(x))

PANDOC_PARAMS=-r markdown+simple_tables+table_captions+yaml_metadata_block+definition_lists	\
			  --filter pandoc-citeproc										\
			  $(PANDOC_BIBLIO)

PANDOC_CC=$(PANDOC) $(PANDOC_PARAMS)

PANDOC_CC_PDF=$(PANDOC) 												\
			  $(PANDOC_PARAMS) 											\
			  --latex-engine=pdflatex 									\
			  $(DOCUMENT_SETTINGS_PDF)
export PANDOC_CC_PDF

export PANDOC_CC_HTML=$(PANDOC) $(PANDOC_PARAMS) $(DOCUMENT_SETTINGS_HTML)

#
#
# Tasks
#
#

# Main task
all:
	@$(ECHO) "\t[ALL   ]"
	@$(MAKE) $(MAKE_FLAGS) -C $(TEMPLATES)

# create out directory
$(OUT):
	@$(ECHO) "\t[MKDIR ] $@"
	@$(MKDIR) $(OUT)

# create html out directory
$(OUT_HTML):
	@$(ECHO) "\t[MKDIR ] $@"
	@$(MKDIR) $(OUT_HTML)

# cleanup task
clean:
	@$(ECHO) "\t[RM    ] $@"
	@$(RM) $(OUT)

#
# Per-template tasks
#

default:
	@$(MAKE) $(MAKE_FLAGS) -C $(TEMPLATES)/latex/default/

hs-furtwangen:
	@$(MAKE) $(MAKE_FLAGS) -C $(TEMPLATES)/latex/hs-furtwangen/

asme-one-col: export OUT_LATEX_ASME = $(OUT_LATEX)/asme/
asme-one-col:
	@$(MKDIR) $(OUT_LATEX_ASME)
	@$(MAKE) $(MAKE_FLAGS) -C $(TEMPLATES)/latex/asme/one-column/

paper-simple:
	@$(MAKE) $(MAKE_FLAGS) -C $(TEMPLATES)/latex/paper-simple/

letter:
	@$(MAKE) $(MAKE_FLAGS) -C $(TEMPLATES)/latex/letter/

