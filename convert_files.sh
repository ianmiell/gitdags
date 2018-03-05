#!/bin/bash

set -eux

for f in $(ls *tex)
do
	pdflatex ${f}
	convert -density 600x600 dagfile_example.pdf -quality 90 -resize 1080x800 $(echo $f | cut -f 1 -d '.')
done
cd /output
