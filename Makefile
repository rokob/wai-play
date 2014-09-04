GHCFLAGS=-Wall -fno-warn-name-shadowing -XHaskell98 -O2

dist/build/project/Main: project.cabal dist/setup-config Main.hs
	cabal build --ghc-options="$(GHCFLAGS)"

dist/setup-config: project.cabal
	cabal configure

.PHONY: clean

Routes.hs: routes
	routeGenerator -r -m Application $< > $@

clean:
	find -name '*.o' -o -name '*.hi' | xargs $(RM)
	$(RM) -r dist dist-ghc
