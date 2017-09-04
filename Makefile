comma   := ,
CXX      = $(shell $(ROSE_INSTALLATION)/bin/rose-config cxx)
CPPFLAGS = $(shell $(ROSE_INSTALLATION)/bin/rose-config cppflags) -I.
CXXFLAGS = $(shell $(ROSE_INSTALLATION)/bin/rose-config cxxflags)
LIBDIRS  = $(shell $(ROSE_INSTALLATION)/bin/rose-config libdirs)
LDFLAGS  = $(shell $(ROSE_INSTALLATION)/bin/rose-config ldflags) -L. \
           $(addprefix -Wl$(comma)-rpath -Wl$(comma), $(subst :, , $(LIBDIRS)))

## Your translator
TRANSLATOR=myTranslator
TRANSLATOR_SOURCE=$(TRANSLATOR).cpp

#-------------------------------------------------------------
# Makefile Targets
#-------------------------------------------------------------

all: $(TRANSLATOR)

# compile the translator and generate an executable
# -g is recommended to be used by default to enable debugging your code
$(TRANSLATOR): $(TRANSLATOR_SOURCE)
	$(CXX) -g $(TRANSLATOR_SOURCE) $(CPPFLAGS) $(LDFLAGS) -o $(TRANSLATOR)


clean:
	rm -rf $(TRANSLATOR) *.o rose_* *.dot
