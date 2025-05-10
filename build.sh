#!/bin/bash

# Konwertuj pliki 'odg' z folderu 'obrazki' do formatu 'pdf'
libreoffice --convert-to pdf obrazki/*.odg --outdir obrazki

# Konwertuj pliki 'svg' z folderu 'obrazki' do formatu 'pdf'
inkscape -D obrazki/*.svg --export-type pdf

# Uruchom kompilacje dokumentu i zapisz wyniki do katalogu 'budowa'
latexmk --shell-escape -output-directory=budowa -pdflua -f thesis.tex
