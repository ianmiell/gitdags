TEX_FILES:=$(wildcard *.tex)
OBJ_FILES:=$(patsubst %.tex,%.tex.png,$(TEX_FILES))

%.tex.png: %.tex
	pdflatex --jobname $< $<
	convert -density 600x600 $<.pdf -quality 90 -resize 1080x800 $<.png

all: $(OBJ_FILES)

clean:
	rm -f *pdf *log *aux *tex.png *out
