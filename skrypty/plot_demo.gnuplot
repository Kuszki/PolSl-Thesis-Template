# Używaj terminala 'tikz' i wyjścia do wskazanego pliku 
set terminal lua tikz size 15.5, 6       # rozmiar 15.5x6
set output '../obrazki/gnuplot_demo.tex' # plik wyjściowy

# Styl wykresu (offset dodaje margines do opisu osi)
set title 'Wykres super funkcji $f(x) = e^{-0.1x} \cdot \sin(x)$'
set xlabel 'Wartości parametru $x$' offset 0,-1
set ylabel 'Wartości funkcji $f(x)$' offset -1,0
set grid
set xrange [0:20]
set yrange [-1:1]

# Przykładowa funkcja do narysowania
f(x) = exp(-0.1*x) * sin(x)

# Rysowanie wskazanej funkcji
plot f(x) title 'Funkcja $f(x)$' lc 'blue'
