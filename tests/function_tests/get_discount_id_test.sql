-- Wypiszemy sugerowane znizki niekt�rych klientów wraz z ich
-- datą dołączenia do grona klientów
DECLARE
    V_DISCOUNT_ID NUMBER;
    V_DISCOUNT_NAME VARCHAR(40);
BEGIN
    FOR C IN (SELECT CLIENT_ID, FIRST_NAME, LAST_NAME, DATE_OF_JOINING FROM CLIENTS)
    LOOP
        V_DISCOUNT_ID := HOTEL.GET_DISCOUNT_ID(C.CLIENT_ID);
        IF(V_DISCOUNT_ID IS NULL) THEN
            V_DISCOUNT_NAME := 'no-discount';
        ELSE
            SELECT DISCOUNT_NAME INTO V_DISCOUNT_NAME FROM DISCOUNTS
                WHERE DISCOUNT_ID = V_DISCOUNT_ID;
        END IF;
        DBMS_OUTPUT.PUT_LINE(C.FIRST_NAME || ' ' || C.LAST_NAME || ', joined '  || C.DATE_OF_JOINING ||
                             ', discount name: "' || V_DISCOUNT_NAME || '"');
    END LOOP;
END;