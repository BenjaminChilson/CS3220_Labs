#
#  File name   : Makefile
#  Version     : 07
#  Description : Rule `dist' creates the gzipped tarball file (the deliverable)
#                for this lab. Rule `distcheck' lists the contents of the
#                gzipped tarball file.
#

COURSE      := ece3220CATEGORY    := labASSIGNMENT  := 01MODULE_ID   := $(COURSE)-$(CATEGORY)$(ASSIGNMENT)-$(USER)DELIVERABLE := $(MODULE_ID).tar.gz# The name of the current working directoryCWD := $(notdir $(PWD))CFLAGS := -std=c11 -ggdb -OgCXXFLAGS := -std=c++11 -ggdb -OgSOURCES := \hello-world-c.c \hello-world-cpp.cppPROGS := $(basename $(SOURCES)).PHONY : allall : $(PROGS)# Create the assignment tarball file.PHONY : distdist : distclean $(DELIVERABLE)
$(DELIVERABLE) : *.mk $(SOURCES)tar -czf $@ --transform="s@^@$(MODULE_ID)/@" $(sort $^)# List the contents of the assignment tarball file.PHONY : distcheckdistcheck : $(DELIVERABLE)tar -tzf $(DELIVERABLE).PHONY : cleanclean :-rm -f $(PROGS) *.o.PHONY : distcleandistclean : clean-rm -f $(DELIVERABLE).PHONY : varsvars :$(foreach V, $(sort $(.VARIABLES)), $(if $(filter-out default automatic, $(origin $V)), $(info $V=$($V) ($(value $V)))))