# Baza danych do obsługi hotelu

## Katalogi

* `/script` - katalog zawierający wszystkie skrypty budujące bazę danych (wraz z opisami w plikach `readme.md`).
* `/tests` - katalog zawierający pliki testujące funkcjonalności zaimplementowane w bazie danych (wraz z opisami w plikach `readme.md`).
* `/pics` - te katalogi zawierają obrazy dla plików `.md`.

## Analiza rozwiązania

### Model ER

![logical](pics/logical.png)

### Model relacyjny

![relational](pics/relational.png)

## Baza danych

### Tabele

### Wyzwalacze

* `ADD_DOJ_FOR_CLIENT_TRIGGER` to wyzwalacz ustawiający datę dołączenia klienta na aktualną datę systemową.
* `RESERVATIONS_AUTOINCR` to wyzwalacz implementujący klucz autoinkrementowany dla tabeli `RESERVATIONS`.
* `RESERVATIONS_ESTIMATED_COST` to wyzwalacz obliczający przewidywany koszt końcowy rezerwacji. Jego uruchomienie zależy nie tylko od wstawienia nowej rezerwacji, kiedy to koszt jest obliczany po raz pierwszy, ale również od zmiany długości rezerwacji.
* `BOUGHT_OFFERS_AUTOINCR` to wyzwalacz implementujący klucz autoinkrementowany dla tabeli `BOUGHT_OFFERS`.
* `BOUGHT_OFFERS_ESTIMATED_COST` to wyzwalacz obliczający przewidywany koszt końcowy wynikający z wykorzystania oferty. Uruchamiany jest po raz pierwszy przy zakupie oferty oraz ewentualnie później przy zmianie czasu korzystania z oferty.
* `SECTOR_SIZE_CONTROL_[]` to wyzwalacze obliczające rozmiar sektora w zależności od tego, ile pokoi się w nim znajduje.

### Procedury

* `HOTEL.RESERVE` to procedura rezerwująca pokój w zależności od preferencji klienta. Argumenty:
  * `ARG_CLIENT_ID` - identyfikator klienta, dla którego będziemy rezerwować pokój.
  * `ARG_ROOM_TYPE` - identyfikator typu pokoju. Procedura znajdzie pokój danego typu wśród dostępnych i przydzieli go klientowi.
  * `ARG_START_DATE` - początek rezerwacji.
  * `ARG_END_DATE` - koniec rezerwacji.
  * `ARG_DISCOUNT_ID` - identyfikator zniżki, która będzie przydzielona klientowi. Argument może mieć wartość `NULL`, wtedy zostanie przypisana zniżka domyślna.
* `HOTEL.BUY_OFFER` to procedura przydzielająca klientowi ofertę. Argumenty:
  * `ARG_CLIENT_ID` - identyfikator klienta, któremu będzie przydzielona oferta.
  * `ARG_OFFER_ID` - identyfikator oferty, która będzie przydzielona.
  * `ARG_START_DATE` - początek rezerwacji.
  * `ARG_END_DATE` - koniec rezerwacji.

### Funkcje

* `IS_RESERVATION_VALID` to funkcja testująca czy jest możliwość zarezerwowania konkretnego pokoju w określonym terminie. Sprawdza ona, czy podana rezerwacja nie pokrywa się z innymi. Argumenty:
  * `ARG_ROOM_NUMBER` - numer sprawdzanego pokoju.
  * `ARG_START_DATE` - początek hipotetycznej rezerwacji.
  * `ARG_END_DATE` - koniec hipotetycznej rezerwacji.
* `CALCULATE_MONTHLY_INCOME` to funkcja obliczająca przychód wynikający z wynajmowania pokoi i sprzedaży różnych ofert. Argumenty `MONTH_NUMBER` i `YEAR_NUMBER` określają dla którego miesiąca obliczyć przychód.
* `GET_DISCOUNT_ID` to funkcja sprawdzająca czy danemu klientowi można przydzielić automatyczną zniżkę, czyli taką która wynika z bycia stałym klientem.
