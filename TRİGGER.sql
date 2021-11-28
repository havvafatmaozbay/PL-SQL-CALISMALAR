CREATE OR REPLACE TRIGGER EMP_TRG 
BEFORE INSERT OR UPDATE OR DELETE ON EMP FOR EACH ROW
DECLARE
  WBILGISAYAR EMP_LOG.BILGISAYAR%TYPE;
  WIP_ADDR EMP_LOG.IP_ADDR%TYPE;
BEGIN
  SELECT SYS_CONTEXT('USERENV','HOST'), SYS_CONTEXT('USERENV','IP_ADDRESS') INTO WBILGISAYAR, WIP_ADDR FROM DUAL;
   IF INSERTING THEN
    INSERT INTO EMP_LOG(SIRANO, NEYAPTI,KIMYAPTI, NEZAMAN, BILGISAYAR, IP_ADDR,EMPNO,ENAME,
    JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES
    (EMP_SEQ.NEXTVAL, 'INS', USER, SYSDATE, WBILGISAYAR, WIP_ADDR, :NEW.EMPNO ,:NEW.ENAME,:NEW.JOB, :NEW.MGR, :NEW.HIREDATE, :NEW.SAL, :NEW.COMM, :NEW.DEPTNO );
  END IF;
  IF UPDATING THEN
  -- BU DURUMDA HEM ESK� HEM YEN� B�LG�Y� SAKLAMAMIZ GEREK�YOR
    INSERT INTO EMP_LOG(SIRANO, NEYAPTI,KIMYAPTI, NEZAMAN, BILGISAYAR, IP_ADDR,EMPNO,ENAME,
    JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES
    (
    EMP_SEQ.NEXTVAL, 'UPD1',USER, SYSDATE, WBILGISAYAR, WIP_ADDR,:NEW.EMPNO,:NEW.ENAME,
    :NEW.JOB, :NEW.MGR, :NEW.HIREDATE, :NEW.SAL, :NEW.COMM, :NEW.DEPTNO
    );
    INSERT INTO EMP_LOG(SIRANO, NEYAPTI,KIMYAPTI, NEZAMAN, BILGISAYAR, IP_ADDR,EMPNO,ENAME,
    JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES
    (
    EMP_SEQ.NEXTVAL, 'UPD2' ,USER, SYSDATE, WBILGISAYAR, WIP_ADDR, :OLD.EMPNO, :OLD.ENAME,
    :OLD.JOB, :OLD.MGR, :OLD.HIREDATE, :OLD.SAL, :OLD.COMM, :OLD.DEPTNO);
  END IF;
  IF DELETING THEN
   --ESK� B�LG�Y� SAKLAMAMIZ GEREK�YOR
   INSERT INTO EMP_LOG(SIRANO, NEYAPTI,KIMYAPTI, NEZAMAN, BILGISAYAR, IP_ADDR,EMPNO,ENAME,
    JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
    VALUES
    ( EMP_SEQ.NEXTVAL, 'UPD2',USER, SYSDATE, WBILGISAYAR, WIP_ADDR,:OLD.EMPNO,:OLD.ENAME,
    :OLD.JOB, :OLD.MGR, :OLD.HIREDATE, :OLD.SAL, :OLD.COMM, :OLD.DEPTNO);
  END IF;
END
/
