#!/bin/bash

# use: eg bash compile.sh main

if [ -z "$1" ]
  then
      echo "No argument given, give the name of th efile to compile without the ending"
      exit 0
fi

rm *.aux *.log *.blg *.bbl

pdflatex ${1}".tex"
bibtex ${1}".aux"
pdflatex ${1}".tex"
pdflatex ${1}".tex"


# this part embeds the fonts correctly for unigrafia, it's done after compiling the .tex file to .pdf
#gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dEmbedAllFonts=true -sOutputFile=main_embedded.pdf -f main.pdf

