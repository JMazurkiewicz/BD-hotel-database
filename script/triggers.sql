CREATE OR REPLACE TRIGGER ADD_DOJ_FOR_CLIENT_TRIGGER
BEFORE
    INSERT ON CLIENTS
FOR EACH ROW
BEGIN
    :NEW.DATE_OF_JOINING := SYSDATE;
END ADD_DOJ_FOR_CLIENT_TRIGGER;

/

CREATE SEQUENCE RESERVATIONS_SEQ START WITH 1 INCREMENT BY 1;

/

CREATE OR REPLACE TRIGGER RESERVATIONS_AUTOINCR
BEFORE
    INSERT ON RESERVATIONS
FOR EACH ROW
BEGIN
    :NEW.RESERVATION_ID := RESERVATIONS_SEQ.NEXTVAL;
END RESERVATIONS_AUTOINCR;

/

CREATE OR REPLACE TRIGGER RESERVATIONS_ESTIMATED_COST
BEFORE
    INSERT OR
    UPDATE OF START_DATE OR
    UPDATE OF END_DATE ON RESERVATIONS
FOR EACH ROW
DECLARE
    DAILY_ROOM_COST NUMBER;
BEGIN
    SELECT DAILY_COST INTO DAILY_ROOM_COST FROM ROOM_TYPES WHERE TYPE_ID = (
        SELECT TYPE_ID FROM ROOMS WHERE ROOM_NUMBER = :NEW.ROOM_NUMBER
    );
    :NEW.ESTIMATED_COST := DAILY_ROOM_COST * (:NEW.END_DATE - :NEW.START_DATE);
END RESERVATIONS_ESTIMATED_COST;

/

CREATE SEQUENCE BOUGHT_OFFERS_SEQ START WITH 1 INCREMENT BY 1;

/   

CREATE OR REPLACE TRIGGER BOUGHT_OFFERS_AUTOINCR
BEFORE
    INSERT ON BOUGHT_OFFERS
FOR EACH ROW
BEGIN
    :NEW.BOUGHT_OFFER_ID := BOUGHT_OFFERS_SEQ.NEXTVAL;
END BOUGHT_OFFERS_AUTOINCR;

/

CREATE OR REPLACE TRIGGER BOUGHT_OFFERS_ESTIMATED_COST
BEFORE
    INSERT OR
    UPDATE OF START_DATE OR
    UPDATE OF END_DATE ON BOUGHT_OFFERS
FOR EACH ROW
DECLARE
    DAILY_OFFER_COST NUMBER;
BEGIN
    SELECT DAILY_COST INTO DAILY_OFFER_COST FROM OFFERS
        WHERE OFFERS.OFFER_ID = :NEW.OFFER_ID;
    :NEW.ESTIMATED_COST := DAILY_OFFER_COST * (:NEW.END_DATE - :NEW.START_DATE);
END BOUGHT_OFFERS_ESTIMATED_COST;

/

CREATE OR REPLACE TRIGGER SECTOR_SIZE_CONTROL
BEFORE
    INSERT OR
    UPDATE OF SECTOR_ID ON ROOMS
FOR EACH ROW
DECLARE
    NEW_SECTOR_SIZE NUMBER;
BEGIN
    SELECT COUNT(*) INTO NEW_SECTOR_SIZE FROM ROOMS WHERE SECTOR_ID = :NEW.SECTOR_ID;
    UPDATE SECTORS
        SET SECTOR_SIZE = NEW_SECTOR_SIZE
        WHERE SECTOR_ID = :NEW.SECTOR_ID;    
END SECTOR_SIZE_CONTROL;