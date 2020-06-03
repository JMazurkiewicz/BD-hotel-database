# Analiza rozwiązania

## Wyzwalacze

* `ADD_DOJ_FOR_CLIENT_TRIGGER` to wyzwalacz ustawiający datę dołączenia klienta na aktualną datę.
* `RESERVATIONS_AUTOINCR` to wyzwalacz implementujący klucz autoinkrementowany dla tabeli `RESERVATIONS`
* `RESERVATIONS_ESTIMATED_COST` to wyzwalacz obliczający przewidywany koszt końcowy rezerwacji. Jego uruchomienie zależy nie tylko od wstawienia nowej rezerwacji, kiedy to koszt jest obliczany po raz pierwszy, ale również od zmiany długości rezerwacji.
* `BOUGHT_OFFERS_AUTOINCR` to wyzwalacz implementujący klucz autoinkrementowany dla tabeli `BOUGHT_OFFERS`.
* `BOUGHT_OFFERS_ESTIMATED_COST` to wyzwalacz obliczający przewidywany koszt końcowy wynikający z wykorzystania oferty. Uruchamiany jest po raz pierwszy przy zakupie oferty oraz ewentualnie później przy zmianie czasu korzystania z oferty.
