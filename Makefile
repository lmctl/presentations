# TEXINPUTS=:.// TEXMFDBS=.:$(kpsewhich --show-path=ls-R)  pdflatex smartdevcon.tex
TEXINPUTS=":.//"
TEXMFDBS=.:$(shell kpsewhich --show-path=ls-R)

all:
	test -f ls-R || make ls-R
	make smartdevcon.pdf

.PHONY: ls-R

ls-R:
	TEXMFDBS=. mktexlsr 

LATEX=xelatex
ls-R: images/Architecture.eps
smartdevcon.pdf: smartdevcon.tex smartdevcon.toc \
images/tizen-history.pdf \
images/Architecture.eps \
beamer/themes/color/beamercolorthemetizen.sty \
beamer/themes/outer/beamerouterthemetizen.sty \
beamer/themes/theme/beamerthemesmartdevcon2.sty \
beamer/themes/theme/beamerthemetizen.sty \
beamer/themes/inner/beamerinnerthemetizen.sty

%.toc: %.tex
	TEXINPUTS=$(TEXINPUTS) TEXMFDBS=$(TEXMFDBS) \
	$(LATEX) $<

%.pdf: %.tex
	TEXINPUTS=$(TEXINPUTS) TEXMFDBS=$(TEXMFDBS) \
	$(LATEX) $<

%.eps: %.svg
	inkscape -D -T -E $@ $<

clean:
	rm -f *.aux *.toc *.log *.out *.nav *.snm ls-R
