DIRS=$(shell find . -maxdepth 1 -mindepth 1 -type d)

OUT_LATEX_ASME=$(OUT_LATEX)/asme/
export OUT_LATEX_ASME

all: $(OUT_LATEX_ASME)
	@for d in $(DIRS); do 					\
		$(ECHO) "\t[MAKE  ] $$d";			\
		$(MAKE) $(MAKE_FLAGS) -C $$d;		\
	done

$(OUT_LATEX_ASME):
	@$(MKDIR) $(OUT_LATEX_ASME)
