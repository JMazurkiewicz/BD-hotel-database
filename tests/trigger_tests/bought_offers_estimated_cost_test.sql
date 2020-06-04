-- W momencie dokonania zakupu ofery cena zostanie obliczona automatycznie.
-- Cenę nazywamy "przewidywaną", gdyż na koniec mogą zostać dopisane dodatkowe koszty.
-- Do przetestowania tego wyzwalacza wykorzystamy funkcję `HOTEL.BUY_OFFER`.
-- Osobą rezerwującą będzie pan Marcin z testu `add_doj_for_client_test`.
BEGIN
    HOTEL.BUY_OFFER(72122648293, 1, '02/apr/2021', '05/apr/2021');
END;