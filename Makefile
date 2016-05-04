SHELL = sh
TOPLEVEL = thesis
TEXFILES = $(shell find . -name '*.tex')
BIBFILES = $(shell find . -name '*.bib')

all: $(TOPLEVEL).pdf

$(TOPLEVEL).aux: $(TEXFILES)
	pdflatex $(TOPLEVEL).tex

$(TOPLEVEL).bbl: references.bib $(TOPLEVEL).aux
	bibtex8 --wolfgang $(TOPLEVEL)

thesis.pdf: $(TOPLEVEL).bbl
	pdflatex $(TOPLEVEL).tex
	pdflatex $(TOPLEVEL).tex
	bibtex8 --wolfgang $(TOPLEVEL)
	pdflatex $(TOPLEVEL).tex

clean:
	rm $(TOPLEVEL).pdf
	rm $(TOPLEVEL).out
	rm $(TOPLEVEL).aux
	rm $(TOPLEVEL).bbl
	rm $(TOPLEVEL).blg
	rm $(TOPLEVEL).log
