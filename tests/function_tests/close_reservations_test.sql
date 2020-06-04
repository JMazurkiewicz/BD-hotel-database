-- Wykorzystamy klient�w 99120522231 i 80121923763 do rezerwacji pokoju typu "2"
-- w bardzo bliskich terminach. Obie rezerwacje powinny przebiec pomyślnie.
BEGIN
    HOTEL.RESERVE(99120522231, 2, '01/aug/20', '06/aug/20', NULL);
    HOTEL.RESERVE(80121923763, 2, '06/aug/20', '11/aug/20', NULL);
END;