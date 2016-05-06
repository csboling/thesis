SHELL = sh
TOPLEVEL = thesis
TEXFILES = $(shell find . -name '*.tex')
BIBFILES = $(shell find . -name '*.bib')

all: $(TOPLEVEL).pdf

$(TOPLEVEL).aux: $(TEXFILES)
	pdflatex $(TOPLEVEL).tex

$(TOPLEVEL).bbl: references.bib $(TOPLEVEL).aux
	makeglossaries $(TOPLEVEL)
	biber $(TOPLEVEL)

thesis.pdf: $(TOPLEVEL).bbl
	pdflatex $(TOPLEVEL).tex
	pdflatex $(TOPLEVEL).tex
	biber $(TOPLEVEL)
	pdflatex $(TOPLEVEL).tex

clean:
	rm -f $(TOPLEVEL).pdf
	rm -f $(TOPLEVEL).out

	rm -f $(TOPLEVEL).ist
	rm -f $(TOPLEVEL).toc

	rm -f $(TOPLEVEL).acn
	rm -f $(TOPLEVEL).acr
	rm -f $(TOPLEVEL).alg
	rm -f *.aux
	rm -f $(TOPLEVEL).bcf

	rm -f $(TOPLEVEL).bbl
	rm -f $(TOPLEVEL).blg

	rm -f $(TOPLEVEL).glg
	rm -f $(TOPLEVEL).glo
	rm -f $(TOPLEVEL).gls

	rm -f $(TOPLEVEL).run.xml
	rm -f $(TOPLEVEL).xdy
	rm -f $(TOPLEVEL).log
