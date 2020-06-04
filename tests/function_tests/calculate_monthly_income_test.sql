-- Najpierw dokonamy kilku rezerwacji, następnie policzymy miesięczny przychód
BEGIN
    HOTEL.RESERVE(99120522231, 1, '24/dec/20', '28/dec/20', NULL);
    HOTEL.RESERVE(69031334713, 1, '06/dec/20', '15/dec/20', NULL);
    HOTEL.RESERVE(59040163161, 2, '14/dec/20', '20/dec/20', NULL);
    HOTEL.RESERVE(95112753876, 3, '01/dec/20', '06/dec/20', NULL);
    
    HOTEL.BUY_OFFER(99120522231, 1, '24/dec/20', '28/dec/20');
    HOTEL.BUY_OFFER(99120522231, 2, '24/dec/20', '28/dec/20');
    HOTEL.BUY_OFFER(95112753876, 1, '01/dec/20', '06/dec/20');
    
    DBMS_OUTPUT.PUT_LINE(HOTEL.CALCULATE_MONTHLY_INCOME(12, 2020));
END;

-- Wyliczony przychód: 7197
-- Czy wszystko się zgadza:
--
-- Ceny pokoji typu:
-- `1` -> 280
-- `2` -> 320
-- `3` -> 360
--
-- Ceny ofert o id:
-- `1` -> 15
-- `2` -> 20
--
-- Przychód z ofert:
-- 4*15 + 4*20 + 5*15 = 215
--
-- Uznawane zniżki:
-- 69031334713 ma zniżkę od id `1` o wartości 15%
--
-- Przychód z wynajmu:
-- 4*280 + 9*280*0.85 + 6*320 + 360*5 = 6982
--
-- Całkowita suma: 6982 + 215 = 7197
-- Wszystko zostało prawidłowo policzone