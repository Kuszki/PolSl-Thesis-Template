# Utwórz nowy wykres (jesli uruchomiono z terminala -- ukryj go)
h = figure('visible', ifelse(isguirunning(), 'on', 'off'));

# Ustaw rozmiar rysunku (dla przykładu 16x7.5 cm)
set(h, "paperunits", "centimeters")
set(h, "papersize", [16 7.5])
set(h, "paperposition", [0, 0, [16 7.5]])

# Ustaw marginesy i rozmiar rysunku (wymaga wprawy)
set(h, "defaultaxesposition", [0.095, 0.185, 0.870, 0.790])

set(h, "defaulttextfontsize", 11) # Ustaw odpowiedni rozmiar czcionki
set(h, "defaultaxesfontsize", 11) # uwaga na błąd w GNU Octave
set(h, "defaulttextfontname", "Latin Modern Roman") # Ustal krój czcionki
set(h, "defaultaxesfontname", "Latin Modern Roman") # jednolity z PDF
set(h, "defaulttextcolor", "black") # Dla pewności ustaw kolor czcionki

# Przygotuj przykładowe dane do narysowania wykresu
x = 0 : 0.1 : 1;                 # Wygeneruj wartośći X
y = 1.55 * x + 3.05;             # Wygeneruj wartości Y
y = y + 0.35*rand(1, length(y)); # Dodaj trochę szumu na pokaz
p = polyfit(x, y, 1);            # Wykonaj dopasowanie do wielomianu
f = x*p(1) + p(2);               # Wyznacz wartości dla aproksymacji

plot(x, y, "x;Dane;", x, f, "-;Aproksymacja;"); # Rysuj wykres
ylabel("Napięcie na wyjściu, mV");              # Ustaw opis osi Y
xlabel("Temperatura otoczenia, °C");            # Ustaw opis osi X
legend('location', 'southeast');                # Ustaw pozycję legendy
xlim([0 1]);                                    # Ustaw zakres osi X
ylim([3 5]);                                    # Ustaw zakres osi Y
grid on;                                        # Załącz siatkę
box on;                                         # Załącz obwódkę
set_format(gca, 'XY', true);                    # Ustaw format osi

print("../obrazki/plot_demo.svg");              # Zapisz wykres do pliku
