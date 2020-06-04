-- W momencie dokonania rezerwacji jej przewidywana cena zostanie obliczona automatycznie.
-- Cenę nazywamy "przewidywaną", gdyż na koniec pobytu mogą zostać dopisane dodatkowe koszty
-- wynikające np. z uszkodzonego sprzętu w zarezerwowanym pokoju.
-- Do przetestowania tego wyzwalacza wykorzystamy funkcję `HOTEL.RESERVE`.
-- Osobą rezerwującą będzie pan Marcin z testu `add_doj_for_client_test`.
BEGIN
    HOTEL.RESERVE('72122648293', 0, '01/apr/2021', '05/apr/2021', NULL);
END;