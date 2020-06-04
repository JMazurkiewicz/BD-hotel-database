-- Dzięki wyzwalaczowi `ADD_DOJ_FOR_CLIENT` nowy klient powinien mieć
-- wpisaną aktualną datę (`SYSDATE`) w kolumnie `DATE_OF_JOINING`.
INSERT INTO CLIENTS (CLIENT_ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL)
    VALUES (72122648293, 'Marcin', 'Kowalski', '+48431972566', 'marcin.kowalski@outlook.com');