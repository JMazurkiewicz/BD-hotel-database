-- Wykorzystamy klient�w 99120522231 i 80121923763 do rezerwacji pokoju typu "2"
-- w nachodzących na siebie terminach. Istnieje tylko jeden pokój tego typu, więc przy
-- próbie dokonania drugiej rezerwacji powinien wystąpić błąd.
BEGIN
    HOTEL.RESERVE(99120522231, 2, '01/aug/20', '06/aug/20', NULL);
    HOTEL.RESERVE(80121923763, 2, '03/aug/20', '10/aug/20', NULL);
END;
