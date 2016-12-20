.PHONY: all clean

basepart := koncerndiagram
pdf := $(basepart)-$(shell date +%Y-%m-%d).pdf
latest := $(basepart).pdf
tex := master.tex

mkfilepath := $(abspath $(lastword $(MAKEFILE_LIST)))
dirpath := $(dir $(mkfilepath))

all: $(pdf)

$(pdf): $(tex)
	$(dirpath)latexrun -o $(pdf) $(tex)
	ln -s -f $(pdf) $(latest)

clean:
	rm -f *.pdf
	rm -rf latex.out/
