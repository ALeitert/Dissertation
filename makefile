MAIN := dissertation.tex
JOB := dissertation
FMT := $(JOB).fmt
HEADER := header.tex $(wildcard headerFiles/*.tex)
OPTIONS := -shell-escape -interaction=nonstopmode 

auto: $(FMT)
	@if [ ! -d "./tikzCache" ]; then mkdir "tikzCache"; fi
	latexmk -pdf -pdflatex='pdflatex -fmt $(JOB) $(OPTIONS) %O %S' $(MAIN)

$(FMT): $(HEADER)
	pdflatex $(OPTIONS) -jobname="$(JOB)" -ini "&pdflatex header.tex\def\fmt{$(FMT)}\dump"

cleanHeader:
	rm -f $(FMT)

precompile: cleanHeader $(FMT)

complete: clean
	latexmk -pdf -jobname="$(JOB)" -pdflatex='pdflatex $(OPTIONS) -halt-on-error %O \\input{header}\\def\\tikzexternalize{}\\input{%S}' $(MAIN)
	make clean

clean: cleanHeader
	latexmk -c
	rm -f $(JOB).bbl
	rm -f $(JOB).auxlock
	rm -f tikzCache/*
