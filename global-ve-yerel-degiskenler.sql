-- GLOBAL VE YEREL DEÐÝÞKENLER

DECLARE
SAYI1 NUMBER:=10;
SAYI2 NUMBER:=20;
SAYI3 NUMBER:=30;

BEGIN
  dbms_output.put_lýne('SAYI1 GLOBAL'||SAYI1);
  dbms_output.put_lýne('SAYI2 GLOBAL'||SAYI2);
  dbms_output.put_lýne('SAYI3 GLOBAL'||SAYI3);
  DECLARE
    SAYI1 NUMBER:=40;
    SAYI2 NUMBER:=50;
    SAYI4 NUMBER:=60;
  BEGIN
    dbms_output.put_lýne('SAYI1 LOCAL'||SAYI1);
    dbms_output.put_lýne('SAYI2 LOCAL'||SAYI2);
    dbms_output.put_lýne('SAYI3 LOCAL'||SAYI3);
    dbms_output.put_lýne('SAYI4 LOCAL'||SAYI4);
  END;
  --dbms_output.put_lýne('SAYI4 LOCAL'||SAYI4); DIÞ BLOKTAN ERÝÞÝLEMEZ

END;