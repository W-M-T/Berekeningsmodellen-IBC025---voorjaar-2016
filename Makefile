TEX:=pdflatex
TEXOPTS:=
DOC:=werkstuk voorstel
DEP:=$(filter-out voorstel.tex,$(wildcard *.tex))
PDF:=$(addsuffix .pdf,$(DOC))
TREE:=$(wildcard tree-*.tex)
TREEPDF:=$(addsuffix .pdf,$(basename $(TREE)))

all: $(PDF)

voorstel.pdf: voorstel.tex
	$(TEX) $(TEXOPTS) $(basename $@)
	$(TEX) $(TEXOPTS) $(basename $@)

$(TREEPDF): %.pdf: %.tex tree.tex
	lualatex "\def\filename{$<}\input{tree}"
	mv tree.pdf $@

werkstuk.pdf: %.pdf: %.tex $(DEP) $(TREEPDF)
	$(TEX) $(TEXOPTS) $(basename $@)
	$(TEX) $(TEXOPTS) $(basename $@)

clean:
	$(RM) -v $(foreach d,$(DOC) tree,$(addprefix $(d).,aux bbl blg dvi fdb_latexmk fls fmt log nav out toc pdf snm vrb)) $(TREEPDF)

