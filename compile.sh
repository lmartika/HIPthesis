#!/bin/bash


if [ -z "$1" ]
  then
      echo "No argument supplied"
      exit 0
fi

rm *.aux *.log *.blg *.bbl

pdflatex ${1}".tex"
bibtex ${1}".aux"
pdflatex ${1}".tex"
pdflatex ${1}".tex"

gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -sOutputFile=main_embedded.pdf -f main.pdf

