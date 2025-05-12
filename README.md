# Szablon pracy dyplomowej

Niniejszy szablon zawiera formaty nagłówków, stronę tytułową, jak i propozycje spisu treści, podpisów pod rysunkami, wzory tabel itp., przeznaczone jako wzór przy formatowaniu pracy dyplomowej.

Projekt wykorzystuje tylko i wyłącznie wolne oprogramowanie i zachęca użytkowników do stosowania go podczas codziennej pracy. Celem projektu jest również zachęcenie odbiorców do stosowania systemu składu `LaTeX` podczas tworzenia dokumentów, jako alternatywy dla klasycznych edytorów tekstu, które mimo pozornie łatwiejszej obsługi, nie oferują tak dużej prostoty, swobody i jakości sporządzania dokumentów. O ile próg wejścia w `LaTeX` jest dość wysoki, o tyle dotyczy to głównie tworzenia tego typu szablonu, a nie stosowania ich.

**UWAGA** - nie jest to oficjalny szablon pracy dyplomowej. Na stronie [Politechniki Śląskiej](https://www.polsl.pl/) nie są dostępne uniwersalne i jednolite szablony, tym bardziej w formacie `LaTeX`. Wytyczne odnośnie sporządzania prac dyplomowych ustala [Zarządzenie nr 54/2022](https://lex.polsl.pl/423-lista/d/20505/5/), przy czym są one opisane w formularzu `Z4-PU12`. Formularz ten daje jednak bardzo dużą swobodę w formatowaniu pracy, gdzie to promotor lub prowadzący pracę określa wytyczne do jej przygotowania. Zaproponowany szablon zachowuje najistotniejsze zalecenia wymienione w omawianym dokumencie.

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

Pliku `thesis.cls` nie zaleca się edytować – można to jednak zrobić, jeśli konieczna jest edycja stylu dokumentu i dostosowanie go do własnych preferencji. W tym celu najeży jednak posiadać pewną wiedzę i wprawę w stosowaniu `LaTeX`.

## Kompilacja dokumentu

Aby zapewnić kompleksowe wsparcie `Unicode` oraz obsługę nowoczesnych rozwiązań i bibliotek, projekt wymaga kompilatora `LuaTeX`. Warto zauważyć, że `pdfTeX` jest przestarzały i nie zapewnia wielu nowoczesnych udogodnień, w tym opcji `\babelprovide[transforms = oneletter.nobreak]{polish}` oraz generowania pliku w standardzie `PDF/A-3u`. Możliwe jest również stosowanie kompilatora `XeTeX`, z tym że opcja ta nie zapewnia możliwości stosowania omawianej funkcjonalności biblioteki `babel`, stąd generowany dokument będzie się cechował dużo gorszą jakością składu. Możliwe będzie jednak uzyskanie dokumentu w standardzie `PDF/A-3u`.

Konieczny do budowy dokumentu pakiet [`TeX Live`](https://www.tug.org/texlive) pobrać można w zasadzie dla każdej platformy, przy czym kolejne pakiety w zależności od systemu operacyjnego to przykładowo:
* `Debian GNU/Linux` – pakiet [`texlive`](https://wiki.debian.org/TeXLive),
* `macOS` – pakiet [`MacTeX`](https://www.tug.org/mactex),
* `Windows` – port pakietu [`TeX Live`](https://tug.org/texlive/windows.html).

Instalacja i konfiguracja pakietu `TeX Live` dla systemów rodziny `GNU/Linux` jest niezwykle prosta i sprowadza się do instalacji pakietu o nazwie `texlive` za pośrednictwem odpowiedniego systemu zarządzania pakietami. Konfiguracja dla systemów `Windows` przysporzyć może więcej kłopotów, przy czym istnieją różne gotowe instalatory, w tym oferujące graficzne narzędzia do pracy z projektem. Należy zaznaczyć, że wszystkie pliki projektu o rozszerzeniach `.tex` to zwykłe pliki tekstowe, do których edycji wystarczy najprostszy edytor tekstu.

Jeśli w systemie operacyjnym dostępna jest powłoka zgodna z `bash`, do budowy dokumentu użyć można skryptu `build.sh`, który:
* konwertuje obrazy z formatu programu `LibreOffice` do formatu `PDF` (wymaga pakietu `LibreOffice`),
* konwertuje obrazki w formacie `SVG` do `PDF` (wymaga pakietu `Inkscape`),
* generuje gotowy dokument w formacie `PDF` (wymaga skryptu `Latexmk`).

Najłatwiejszą metodą budowy dokumentu, poza stosowaniem skryptu `build.sh`, jest użycie programu `Latexmk`, dostarczanego wraz z pakietem `TeX Live`:
```bash
# Uruchom kompilacje dokumentu i zapisz wyniki do katalogu 'budowa'
latexmk --shell-escape -output-directory=budowa -pdflua -f thesis.tex
```

Niniejszy szablon może być również stosowany bezpośrednio w serwisie [`Overleaf`](https://www.overleaf.com/read/sgzmptyskmvn#9bd014). Należy jednak koniecznie zmienić stosowany kompilator z `pdfTeX` na `LuaTeX`. Zaleca się jednak, z uwagi na ochronę własności intelektualnej i zapobieganie analizowaniu dokumentu przez obce podmioty, instalację środowiska `LaTeX` na własnym komputerze.

## Licencja

Niniejszy szablon dostępny jest na licencji `GNU LGPL v2.1`. Stosowanie, modyfikowanie i rozpowszechnianie niniejszego szablonu jest dozwolone w dowolnym celu, przy czym sam szablon traktowany jest jak zewnętrzna biblioteka.

Plik `polsl_logo.pdf`, który znajduje się w folderze `obrazki`, jest własnością Politechniki Śląskiej, a jego stosowanie regulowane jest przepisami zawartymi w [Księdze Znaku](https://www.polsl.pl/siwps/logo-2/). Plik należy stosować tylko zgodnie z jego licencją i w warunkach, dla których jest to dozwolone.
