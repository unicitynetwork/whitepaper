ifeq ($(OS),Windows_NT)
	OPEN := start
else
	UNAME := $(shell uname -s)
	ifeq ($(UNAME),Linux)
		OPEN := xdg-open
	else # Darwin
		OPEN := open
	endif
endif

.PHONY: view clean cleanall


%.pdf: FORCE
	latexmk -cd -pdf -interaction=nonstopmode -file-line-error -no-shell-escape -synctex=1 $*

all: Unicity

view: Unicity
	$(OPEN) Unicity.pdf

Unicity: Unicity.pdf

clean:
	latexmk -c || true

cleanall:
	latexmk -C || true
	#for d in ./*/ ; do (cd "$$d" && latexmk -C); done || true

FORCE:
