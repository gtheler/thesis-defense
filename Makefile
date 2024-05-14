build:
	./hash.sh
	pandoc -s -f markdown+smart -t beamer+smart hash.yaml slides.md --template=template.tex --listings --citeproc --pdf-engine=xelatex --lua-filter=include-code-files.lua --lua-filter=code-style.lua -o slides.pdf

clean:
	rm -f slides.pdf

.PHONY: build clean

all: build

