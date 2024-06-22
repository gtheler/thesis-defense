
slides: script
	./hash.sh
	pandoc -s -f markdown+smart -t beamer+smart hash.yaml slides.md --template=template.tex --listings --citeproc --pdf-engine=xelatex --lua-filter=include-code-files.lua --lua-filter=code-style.lua -o slides-$(shell grep date hash.yaml | cut -f2 -d: | tr -d " ").pdf
	
script:
	./hash.sh
	pandoc -s -f markdown+smart hash.yaml --pdf-engine=xelatex  script.md -o script-$(shell grep date hash.yaml | cut -f2 -d: | tr -d " ").pdf
	
clean:
	rm -f slides*.pdf script*.pdf

.PHONY: slides script clean

all: slides
