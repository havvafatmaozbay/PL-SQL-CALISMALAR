SET SERVEROUTPUT ON

--ARRAYLER
--TABLE OPERATORU �LE SELECT KULLANIMI

set serverout on;

   
DECLARE
TYPE Dersler IS VARRAY(5) OF VARCHAR2(25);
TYPE Sureler IS VARRAY(5) OF INTEGER;

DERS Dersler;
SURE sureler :=Sureler();

toplam INTEGER;
BEGIN
DERS := DERSLER('JKLJILJL', 'LJHKLJH', 'KLJJ', 'JKLJLKJ', 'KLKHL');
sure := Sureler(7,9,10,12,15);

toplam := ders.COUNT;

FOR I IN 1 .. TOPLAM LOOP
DBMS_OUTPUT.PUT_LINE('DERSLER := '||I|| ''||DERS(I)|| 'S�re =' ||Sure(I));
END LOOP;

END;
