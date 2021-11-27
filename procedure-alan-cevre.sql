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
  -- Buradaki hatayý gördün mü, ben hep alttakine odaklandým, üstteki yanlýþmýþ :-))
  --hocam kusura bakmayýn gerçekten, ama procedure blok içinde olmadý sanýrým o neden oldu
  -- Procedure, Function ayrý olmalý (Ýçinde tanýmlanabildiði durumlar da var ama böyle deðil tabi)
  -- Neyse sorunu anladýk deðil mi?
  --evet hocam çok teþekkür ederim
  -- Ýyi akþamlar
  -- Bu arada, iþe girecek olan sendin deðil mi?
  -- evet hocam
  -- E nooldu iþ? :-))
  -- hocam pl/sql öðrenip haber vermemi istediler bu kursunuzu bitimeme az kaldý diðerlerini de bitirip teknik mülakat isteyeceðim
  -- Tamam, ben tutmayayým seni, çalýþ  o zaman :-))
  -- teþekkür ederim hocam ilginize çok, iyi akþamlar:)
  -- Ýyi akþamlar
    NE:='C';
  ALAN(5,6,SONUC,NE);
  DBMS_OUTPUT.PUT_LINE(NE||' ' ||SONUC);
END;