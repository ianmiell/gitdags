#!/bin/bash

set -eux

cd /files
for f in $(ls *tex)
do
	pdflatex ${f}
	basef=$(echo $f | cut -f 1 -d '.')
	convert -density 600x600 ${basef}.pdf -quality 90 -resize 1080x800 ${basef}.png
done
