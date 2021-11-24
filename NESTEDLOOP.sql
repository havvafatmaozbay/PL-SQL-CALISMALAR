--NESTED LOOP
--ÇARPIM TABLOSU

DECLARE
  I NUMBER;
  J NUMBER;
BEGIN
  I:=1;
  --J :=1;
  LOOP
     J:=1;
      LOOP
      dbms_output.put_lýne(I*J);
      J:=J+1;
      IF J>10 THEN 
        EXIT;
      END IF;
      
      END LOOP;

    DBMS_OUTPUT.PUT_LINE(I);
    I:=I+1;
    EXIT WHEN I >10;
  
  END LOOP;

END;