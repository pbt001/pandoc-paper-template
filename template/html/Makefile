PANDOC_CC_HTML_CALL=$(PANDOC_CC_HTML) 				\
					--variable toc=true			\
					--variable lot=true			\
					--variable lof=true			\
					--variable lol=true			\

all: default copy_images

default: $(OUT_HTML)
	@$(ECHO) "\t[PANDOC] [HTML] default"
	@$(PANDOC_CC_HTML_CALL) 		\
		$(SRC) 						\
		--template ./default.html5 	\
		-o $(OUT_HTML)/default.html

copy_images:
	@$(ECHO) "\t[COPY  ] images -> $(OUT_HTML)/"
	$(CP) ./*images $(OUT_HTML)/

# create html out directory
$(OUT_HTML):
	@$(ECHO) "\t[MKDIR ] $@"
	@$(MKDIR) $(OUT_HTML)

