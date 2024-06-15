
slides: script
	./hash.sh
	pandoc -s -f markdown+smart -t beamer+smart hash.yaml slides.md --template=template.tex --listings --citeproc --pdf-engine=xelatex --lua-filter=include-code-files.lua --lua-filter=code-style.lua -o slides.pdf
	
script:
	./hash.sh
	pandoc -s -f markdown+smart hash.yaml --pdf-engine=xelatex  script.md -o script.pdf
	
clean:
	rm -f slides.pdf script.pdf

.PHONY: slides script clean

all: slides
