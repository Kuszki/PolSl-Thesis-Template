# Szablon pracy dyplomowej

Niniejszy szablon zawiera formaty nagłówków, stronę tytułową, jak i propozycje spisu treści, podpisów pod rysunkami, wzory tabel itp., przeznaczone jako wzór przy formatowaniu pracy dyplomowej.

UWAGA - nie jest to oficjalny szablon pracy dyplomowej. Na stronie [Politechniki Śląskiej](https://www.polsl.pl/) nie są dostępne uniwersalne i jednolite szablony, tym bardziej w formacie LaTeX.

## Struktura katalogów

Szablon złożony jest z następujących katalogów:
* `rozdzialy` – tutaj zaleca się umieszczać kolejne pliki rozdziałów,
* `obrazki` – tutaj zaleca się umieszczanie obrazków i rysunków,
* `dodatki` – tutaj znajdują się streszczenia i bibliografia,
* `budowa` – tutaj pojawi się wygenerowany plik `PDF`.

## Pliki w katalogu głównym

W katalogu głównym znajdują się następujące pliki:
* `build.sh` – skrypt stosowany do wygenerowania pliku `PDF`,
* `thesis.cls` – klasa szablonu dokumentu (nie należy edytować),
* `thesis.tex` – główny plik dokumentu (należy uzupełnić),
* `thesis.xmpdata` – metryka dokumentu (należy uzupełnić).

## Uzupełnianie plików

W pliku `thesis.tex` należy uzupełnić dane dotyczące pracy, zgodnie z komentarzami w pliku, a następnie dodać kolejne rozdziały pracy. Dodatkowo dane `XMP` dla dokumentu `PDF` należy uzupełnić w pliku `thesis.xmpdata`.

Pliku `thesis.cls` nie zaleca się edytować – można to jednak zrobić, jeśli konieczna jest edycja stylu dokumentu.

## Kompilacja dokumentu

Aby zapewnić kompleksowe wsparcie `Unicode` oraz obsługę nowoczesnych rozwiązań i bibliotek, projekt wymaga kompilatora `LuaTeX`.

Warto zauważyć, że `pdfTeX` jest przestarzały i nie zapewnia wielu nowoczesnych udogodnień, w tym opcji `\babelprovide[transforms = oneletter.nobreak]{polish}` oraz generowania pliku w standardzie `PDF/A-3u`.

Stosowanie `XeTeX` jest możliwe, natomiast opcja ta nie zapewnia możliwości stosowania `\babelprovide[transforms = oneletter.nobreak]{polish}`, stąd generowany dokument będzie się cechował dużo gorszą jakością składu.

Niniejszy szablon może być również stosowany bezpośrednio w serwisie `Overleaf`. Należy jednak koniecznie zmienić stosowany kompilator z `pdfTeX` na `LuaTeX`. Zaleca się jednak, z uwagi na ochronę własności intelektualnej i zapobieganie analizowaniu dokumentu przez obce podmioty, instalację środowiska LaTeX na własnym komputerze.

Pakiet [TeX Live](https://www.tug.org/texlive) pobrać można w zasadzie dla każdej platformy, przy czym kolejne pakiety w zależności od systemu operacyjnego to przykładowo:
* `Debian GNU/Linux` – pakiet [`texlive`](https://wiki.debian.org/TeXLive),
* `macOS` – pakiet [`MacTeX`](https://www.tug.org/mactex),
* `Windows` – port pakietu [`TeX Live`](https://tug.org/texlive/windows.html).

### Kompilacja za pomocą skryptu

Jeśli korzystasz z powłoki zgodnej z `bash`, możesz użyć skryptu `build.sh`, który:
* konwertuje obrazy z formatu programu `LibreOffice` do formatu `PDF`,
* konwertuje obrazki w formacie `SVG` do `PDF`,
* generuje gotowy dokument w formacie `PDF`.

```bash
#!/bin/bash

# Konwertuj pliki 'odg' z folderu 'obrazki' do formatu 'pdf'
libreoffice --convert-to pdf obrazki/*.odg --outdir obrazki

# Konwertuj pliki 'svg' z folderu 'obrazki' do formatu 'pdf'
inkscape -D obrazki/*.svg --export-type pdf

# Uruchom kompilacje dokumentu i zapisz wyniki do katalogu 'budowa'
latexmk --shell-escape -output-directory=budowa -pdflua -f thesis.tex
```

Do działania skryptu wymagane są programy `LibreOffice` oraz `Inkscape` w celu konwersji obrazów do formatu `PDF`.

## Licencja

Niniejszy szablon dostępny jest na licencji `GNU LGPL v2.1`. Stosowanie, modyfikowanie i rozpowszechnianie niniejszego szablonu jest dozwolone w dowolnym celu, przy czym sam szablon traktowany jest jak zewnętrzna biblioteka.

Niniejszy szablon wykorzystuje wyłącznie wolne oprogramowanie i takie tez oprogramowanie gorąco poleca się podczas codziennej pracy. Gorąco poleca się także stosowanie systemu składu LaTeX podczas tworzenia dokumentów, jako alternatywę dla klasycznych edytorów tekstu.

Plik loga `polsl_logo.pdf`, który znajduje się w folderze `obrazki`, jest własnością Politechniki Śląskiej, a jego stosowanie regulowane jest przepisami zawartymi w [Księdze Znaku](https://www.polsl.pl/siwps/logo-2/). Plik należy stosować tylko zgodnie z jego licencją i w warunkach, dla których jest to dozwolone.

Uwagi dotyczące szablonu proszę zgłaszać na adres autora: [lukasz.drozdz@polsl.pl](mailto:lukasz.drozdz@polsl.pl).
