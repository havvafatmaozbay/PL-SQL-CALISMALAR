CREATE TABLE EMP_XML3 OF XMLTYPE;
CREATE OR REPLACE PROCEDURE XMLPROC IS

    TXTDOSYA UTL_FILE.FILE_TYPE;
    WVERI VARCHAR2(4000);
BEGIN
    TXTDOSYA := UTL_FILE.FOPEN('TEXT_DIR','DOSYA6.XML','W');
    DELETE  FROM EMP_XML3;
    FOR I IN(
    SELECT SYS_XMLAGG(
            XMLELEMENT("EMP",
                XMLFOREST(E.EMPNO, E.ENAME, E.JOB, E.HIREDATE, E.SAL, E.COMM)
                )
            )VERI
    FROM EMP E
            )
            LOOP
                BEGIN
                    INSERT INTO EMP_XML3 VALUES(I.VERI);
                    COMMIT;
                END;
        END LOOP;
        
            SELECT X.getClobVal() INTO WVERI FROM EMP_XML3 X;  -- BU FONKS?YONU KULLANAB?LMEK ???N B?R ALLIAS VERMEMIZ GEREK = X
            UTL_FILE.PUT_LINE(TXTDOSYA,WVERI);
            UTL_FILE.FCLOSE(TXTDOSYA);
        
    
END;
EXEC XMLPROC;