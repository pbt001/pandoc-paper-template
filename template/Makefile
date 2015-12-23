DIRS=$(shell find . -maxdepth 1 -mindepth 1 -type d)

all:
	@for d in $(DIRS); do 					\
		$(ECHO) "\t[MAKE  ] $$d";			\
		$(MAKE) $(MAKE_FLAGS) -C $$d;		\
	done
