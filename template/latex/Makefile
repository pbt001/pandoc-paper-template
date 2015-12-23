DIRS=$(shell find . -maxdepth 1 -mindepth 1 -type d)

all: $(OUT_LATEX)
	@for d in $(DIRS); do 					\
		$(ECHO) "\t[MAKE  ] $$d";			\
		$(MAKE) $(MAKE_FLAGS) -C $$d;		\
	done

$(OUT_LATEX):
	@$(MKDIR) $(OUT_LATEX)
