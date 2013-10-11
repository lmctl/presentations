# TEXINPUTS=:.// TEXMFDBS=.:$(kpsewhich --show-path=ls-R)  pdflatex smartdevcon.tex
TEXINPUTS=":.//"
TEXMFDBS=.:$(shell kpsewhich --show-path=ls-R)

all:	ls-R smartdevcon.pdf jesien2013.pdf

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

jesien2013.pdf: jesien2013.tex jesien2013.toc

jesien2013.tex: images/tizen-history.pdf \
images/sb2-m1.eps \
images/sb2-0.eps \
images/sb2-1.eps \
images/sb2-2.eps \
images/sb2-3.eps \
images/auditd-0.eps \
images/auditd-1.eps \
images/auditd-2.eps \
images/auditd-3.eps \
images/auditd-4.eps \
images/auditd-5.eps \
images/auditd-6.eps \
images/auditd-7.eps \
images/auditd-8.eps \
beamer/themes/color/beamercolorthemetizen.sty \
beamer/themes/outer/beamerouterthemetizen.sty \
beamer/themes/theme/beamerthemejesien.sty \
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
