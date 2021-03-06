(require 'org)
(require 'ox-beamer)

(setq org-latex-default-packages-alist
      '(
	;("AUTO" "inputenc" t)
	;("T1" "fontenc" t)
	("" "fontspec" t)
	("" "fixltx2e" nil)
	("" "graphicx" t)
	("" "longtable" nil)
	("" "float" nil)
	("" "wrapfig" nil)
	("" "soul" t)
	("" "textcomp" t)
	("" "marvosym" t)
	("" "wasysym" t)
	("" "latexsym" t)
	("" "amssymb" t)
	("" "amstext" nil)
	("" "hyperref" nil)
	"\\tolerance=1000"))
