-- XML TABLOLARI �LE �ALI�MAK
--XMLAGG, XMLELEMENT, XMLFOREST
--XML FOREST YI�IN OLU�TURMAK ���N
--XMLAGG D���M OLU�TURMAK ���N
-- XMLFOREST �RNEK KULLANICI TANIMLI DATA T�P�NDE �IKTI ELDE ETMEK

SELECT SYS_XMLAGG(SYS_XMLGEN(ENAME)) FROM EMP;

SELECT XMLELEMENT("TARIH",HIREDATE) FROM EMP;


SELECT XMLELEMENT("EMP",
                  XMLELEMENT("ISMI",ENAME),
                  XMLELEMENT("BA�LAMA TARIHI",HIREDATE))
                  AS "SONUC"
FROM EMP;
-----FOREST------
CREATE OR REPLACE TYPE EMP_T AS OBJECT ("@EMPNO" NUMBER(4),
                                        ENAME VARCHAR2(10))
CREATE OR REPLACE TYPE EMPLIST_T AS TABLE OF EMP_T;
CREATE OR REPLACE TYPE DEPT_T AS OBJECT ("@DEPTNO" NUMBER(2),
                                        ENAME VARCHAR2(14),
                                        EMP_LIST EMPLIST_T);
                                        
SELECT XMLFOREST(
    DEPT_T(DEPTNO,
        DNAME,
        CAST(MULTISET(SELECT EMPNO, ENAME FROM EMP E WHERE E.DEPTNO = D.DEPTNO )
        AS EMPLIST_T))AS "BOLUM"
)AS DEPTXML
FROM DEPT D
WHERE DEPTNO =20;
                                        