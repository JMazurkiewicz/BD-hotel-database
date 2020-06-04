-- Zakładamy, że "tani pokój" to pokój, którego o cenie 220zł lub mniejszej.
SELECT * FROM (ROOMS JOIN ROOM_TYPES ON ROOMS.TYPE_ID = ROOM_TYPES.TYPE_ID)
    WHERE ROOM_TYPES.DAILY_COST <= 220;