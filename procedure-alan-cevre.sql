SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ALAN(X IN NUMBER, Y IN NUMBER, Z OUT NUMBER, ALANCEVRE IN OUT VARCHAR2) IS
walancevre varchar2(100) := alancevre;
BEGIN
  IF wALANCEVRE ='A' THEN
    Z := X*Y;
    ALANCEVRE:='ALAN';
  ELSIF wALANCEVRE ='C' THEN
    Z:= 2*(X+Y);
    ALANCEVRE:='CEVRE';
  END IF;
END;

DECLARE
SONUC NUMBER;
NE VARCHAR2(15);
BEGIN
  NE:='A';
  ALAN(5,6,SONUC,NE);
  DBMS_OUTPUT.PUT_LINE(NE||' ' ||SONUC);
  -- Buradaki hatay� g�rd�n m�, ben hep alttakine odakland�m, �stteki yanl��m�� :-))
  --hocam kusura bakmay�n ger�ekten, ama procedure blok i�inde olmad� san�r�m o neden oldu
  -- Procedure, Function ayr� olmal� (��inde tan�mlanabildi�i durumlar da var ama b�yle de�il tabi)
  -- Neyse sorunu anlad�k de�il mi?
  --evet hocam �ok te�ekk�r ederim
  -- �yi ak�amlar
  -- Bu arada, i�e girecek olan sendin de�il mi?
  -- evet hocam
  -- E nooldu i�? :-))
  -- hocam pl/sql ��renip haber vermemi istediler bu kursunuzu bitimeme az kald� di�erlerini de bitirip teknik m�lakat isteyece�im
  -- Tamam, ben tutmayay�m seni, �al��  o zaman :-))
  -- te�ekk�r ederim hocam ilginize �ok, iyi ak�amlar:)
  -- �yi ak�amlar
    NE:='C';
  ALAN(5,6,SONUC,NE);
  DBMS_OUTPUT.PUT_LINE(NE||' ' ||SONUC);
END;