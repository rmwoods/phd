RM := rm -rf

thesis: thesis.tex
	-latex -interaction=nonstopmode 'thesis.tex'
	-bibtex 'thesis'
	-latex -interaction=nonstopmode 'thesis.tex' #Run latex twice
	-latex -interaction=nonstopmode 'thesis.tex'
	-dvips -o 'thesis.ps' 'thesis.dvi'
	-ps2pdf 'thesis.ps' 'thesis.pdf'

clean:
	-$(RM) *.aux *.log *.lof *.lot *.toc *.dvi *.ps *.bbl *.blg *.tex~ *.bib~ *.bib.backup *.sty~ 
	-$(RM) chapter_*/*.tex~
	-@echo 'Done cleaning'

realclean:
	-$(RM) *.aux *.log *.lof *.lot *.toc *.dvi *.ps *.pdf *.bbl *.blg *.tex~ *.bib~ *.bib.backup *.sty~
	-$(RM) chapter_*/*.tex~
	-@echo 'Done cleaning, including the PDF file.'
