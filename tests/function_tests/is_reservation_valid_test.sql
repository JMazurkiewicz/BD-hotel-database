-- Dodamy rezerwację klientowi 99120522231, sprawdzimy jaki pokój został mu przydzielony,
-- a następnie będziemy próbować dopasować różne rezerwacje do jego rezerwacji:
DECLARE
    V_ROOM_NUMBER NUMBER;
    FN_RESULT BOOLEAN;
BEGIN
    HOTEL.RESERVE(99120522231, 1, '01/jun/20', '10/jun/20', NULL);
    SELECT ROOM_NUMBER INTO V_ROOM_NUMBER FROM RESERVATIONS WHERE
        CLIENT_ID = 99120522231 AND
        START_DATE = '01/jun/20' AND
        END_DATE = '10/jun/20';
    
    FN_RESULT := HOTEL.IS_RESERVATION_VALID(V_ROOM_NUMBER, '30/may/20', '02/jun/20');
    DBMS_OUTPUT.PUT_LINE('Test result: ' || SYS.DIUTIL.BOOL_TO_INT(FN_RESULT));
    
    FN_RESULT := HOTEL.IS_RESERVATION_VALID(V_ROOM_NUMBER, '08/jun/20', '14/jun/20');
    DBMS_OUTPUT.PUT_LINE('Test result: ' || SYS.DIUTIL.BOOL_TO_INT(FN_RESULT));
    
    FN_RESULT := HOTEL.IS_RESERVATION_VALID(V_ROOM_NUMBER, '02/jun/20', '09/jun/20');
    DBMS_OUTPUT.PUT_LINE('Test result: ' || SYS.DIUTIL.BOOL_TO_INT(FN_RESULT));
    
    FN_RESULT := HOTEL.IS_RESERVATION_VALID(V_ROOM_NUMBER, '30/may/20', '12/jun/20');
    DBMS_OUTPUT.PUT_LINE('Test result: ' || SYS.DIUTIL.BOOL_TO_INT(FN_RESULT));
    
    FN_RESULT := HOTEL.IS_RESERVATION_VALID(V_ROOM_NUMBER, '10/jun/20', '16/jun/20');
    DBMS_OUTPUT.PUT_LINE('Test result: ' || SYS.DIUTIL.BOOL_TO_INT(FN_RESULT));
    
    FN_RESULT := HOTEL.IS_RESERVATION_VALID(V_ROOM_NUMBER, '25/may/20', '01/jun/20');
    DBMS_OUTPUT.PUT_LINE('Test result: ' || SYS.DIUTIL.BOOL_TO_INT(FN_RESULT));
END;

-- Dbms Ouput:
-- Test result: 0
-- Test result: 0
-- Test result: 0
-- Test result: 0
-- Test result: 1
-- Test result: 1