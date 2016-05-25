TEX:=pdflatex
TEXOPTS:=
DOC:=werkstuk voorstel
DEP:=$(filter-out voorstel.tex,$(wildcard *.tex))
PDF:=$(addsuffix .pdf,$(DOC))

all: $(PDF)

voorstel.pdf: voorstel.tex
	$(TEX) $(TEXOPTS) $(basename $@)

%.pdf: %.tex $(DEP)
	$(TEX) $(TEXOPTS) $(basename $@)
	$(TEX) $(TEXOPTS) $(basename $@)

clean:
	$(RM) -v $(foreach d,$(DOC),$(addprefix $(d).,aux bbl blg dvi fdb_latexmk fls log nav out toc pdf snm vrb))

