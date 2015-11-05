BIN=./bin
OUT_PDF=$(BIN)/paper.pdf
OUT_HTML=$(BIN)/paper.html

## All markdown files in the working directory
SRC=$(wildcard src/*.md)

## Templates
TEMPLATES=./template

## Location of your working bibliography file
BIB = $(shell find ./bib/ -name "*.bib")

PANDOC_BIBLIO=$(foreach x, $(BIB), --bibliography=$(x))

all: $(OUT_PDF) #$(OUT_HTML)

$(OUT_PDF): $(BIN) $(SRC)
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block	\
		--template $(TEMPLATES)/default.latex							\
		--latex-engine=pdflatex											\
		--filter pandoc-citeproc										\
		$(PANDOC_BIBLIO)												\
		$(SRC) -o $(OUT_PDF)
$(BIN):
	mkdir -p $(BIN)

clean:
	rm -fr $(BIN)

