BIN=./bin
OUT_PDF=$(BIN)/paper.pdf
OUT_HTML=$(BIN)/paper.html

DOCUMENT_CLASS=scrbook

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
	--variable documentclass=$(DOCUMENT_CLASS)


## All markdown files in the working directory
SRC=$(wildcard src/*.md)

## Templates
TEMPLATES=./template

## Location of your working bibliography file
BIB = $(shell find ./bib/ -name "*.bib")

PANDOC=$(shell which pandoc)

PANDOC_BIBLIO=$(foreach x, $(BIB), --bibliography=$(x))

PANDOC_PARAMS=-r markdown+simple_tables+table_captions+yaml_metadata_block	\
			  --filter pandoc-citeproc										\
			  $(PANDOC_BIBLIO)

PANDOC_CC=$(PANDOC) $(PANDOC_PARAMS)

all: $(BIN) $(OUT_PDF) #$(OUT_HTML)

$(OUT_PDF): $(SRC)
	$(PANDOC_CC) 								\
		--template $(TEMPLATES)/default.latex	\
		--latex-engine=pdflatex					\
		$(DOCUMENT_SETTINGS_PDF)				\
		$^ -o $@

$(BIN):
	mkdir -p $(BIN)

clean:
	rm -fr $(BIN)

