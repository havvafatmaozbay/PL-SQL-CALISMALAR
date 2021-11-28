CREATE OR REPLACE PACKAGE BODY CALISANLAR AS
  PROCEDURE ZAM_YAP(P_ZAMORANI IN NUMBER) IS
  
  BEGIN
    UPDATE EMP SET SAL = SAL+ SAL*P_ZAMORANI;
    COMMIT;
  END ZAM_YAP;

  FUNCTION BOLUM_ADI(P_DEPTNO DEPT.DEPTNO%TYPE)RETURN VARCHAR2
  IS
  WDNAME DEPT.DNAME%TYPE;
  BEGIN
    SELECT DNAME INTO WDNAME FROM DEPT WHERE DEPTNO = P_DEPTNO;
    RETURN WDNAME;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      RETURN('B�L�M �SM� BULUNAMADI');
  END BOLUM_ADI;
END CALISANLAR;
