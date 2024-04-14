ODIR=out/
ADIR=a/
BDIR=b/

# Make all the o files by echoing a files 
$(ODIR)%.o: $(ADIR)%.a $(BDIR)
	@echo "Dependencies for $@ are $^"
	@echo "Making $@ from $<" > $@

# Now make all
#  1. List all the a files with wildcard
#  2. Replace a files with o files in that list
#  3. Because we have a rule to make o files from a files, make will do the rest
all: $(patsubst $(ADIR)%.a,$(ODIR)%.o,$(wildcard $(ADIR)*.a))
	@for f in $(ODIR)*.o; do \
		echo "File: $$f"; \
		cat $$f; \
	done
