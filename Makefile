#

SETUP = ocaml setup.ml

build: setup.data
	$(SETUP) -build $(BUILDFLAGS)

doc: setup.data build
	$(SETUP) -doc $(DOCFLAGS)

all:
	$(SETUP) -all $(ALLFLAGS)

install: setup.data
	$(SETUP) -install $(INSTALLFLAGS)

clean:
	$(SETUP) -clean $(CLEANFLAGS)
	make -C tests clean
	rm -f setup.data setup.log setup.ml

distclean:
	$(SETUP) -distclean $(DISTCLEANFLAGS)

setup.data:
	$(SETUP) -configure $(CONFIGUREFLAGS)

configure:
	$(SETUP) -configure $(CONFIGUREFLAGS)

.PHONY: build doc test all install uninstall reinstall clean distclean configure

setup.data: setup.ml
setup.ml: _oasis
	oasis setup

uninstall: setup.data
	ocamlfind remove rpclib_legacy

test:
	make -C tests

