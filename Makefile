TEX:=pdflatex
TEXOPTS:=
DOC:=werkstuk
DEP:=$(filter-out voorstel.tex,$(wildcard *.tex))
PDF:=$(addsuffix .pdf,$(DOC))

.SECONDARY: $(addsuffix .fmt,$(DOC))

all: $(PDF)

%.pdf: %.tex %.fmt $(DEP)
	$(TEX) $(TEXOPTS) $(basename $@)
	$(TEX) $(TEXOPTS) $(basename $@)

%.fmt: preamble.tex
	$(TEX) -ini -jobname="$(basename $@)" "&$(TEX) $<\dump"

clean:
	$(RM) -v $(foreach d,$(DOC),$(addprefix $(d).,aux bbl blg dvi fdb_latexmk fls fmt log nav out toc pdf snm vrb))

