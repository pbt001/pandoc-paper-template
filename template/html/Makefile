PANDOC_CC_HTML_CALL=$(PANDOC_CC_HTML) 				\
					--variable toc=true			\
					--variable lot=true			\
					--variable lof=true			\
					--variable lol=true			\

all: default

default: $(OUT_HTML)
	@$(ECHO) "\t[PANDOC] [HTML] default"
	@$(PANDOC_CC_HTML_CALL) 		\
		$(SRC) 						\
		--template ./default.html5 	\
		-o $(OUT_HTML)/default.html

# create html out directory
$(OUT_HTML):
	@$(ECHO) "\t[MKDIR ] $@"
	@$(MKDIR) $(OUT_HTML)

