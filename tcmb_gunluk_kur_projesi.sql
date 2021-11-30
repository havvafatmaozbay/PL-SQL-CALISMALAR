CREATE TABLE GUNLUK_KUR (TARIH DATE, KOD VARCHAR2(4), ALIS NUMBER(12,4), SATIS NUMBER(12,4), EFALIS NUMBER(12,4), EFSATIS NUMBER(12,4) );

CREATE OR REPLACE PROCEDURE GET_KURLAR IS
    TCMB_URL HTTPURITYPE;
    TCMB_XML XMLTYPE;
    
BEGIN
    tcmb_url:=HTTPURITYPE.CREATEURI('https://www.tcmb.gov.tr/kurlar/today.xml');
    TCMB_XML := TCMB_URL.GETXML();
    -- BÝR PROGRAM YAZACAÐIMIZ ÝÇÝN CURSOR KURMAMIZ GEREK
    FOR OKU IN(
        SELECT EXTRACTVALUE(VALUE(X), '/Tarih_Date/@Tarih')WTARIH,
               EXTRACTVALUE(VALUE(P), '/Currency/@CurrencyCode')WKOD,
               EXTRACTVALUE(VALUE(P), '/Currency/ForexBuying')WALIS,
               EXTRACTVALUE(VALUE(P), '/Currency/ForexSelling')WSATIS,
               EXTRACTVALUE(VALUE(P), '/Currency/BanknoteBuying')WEFALIS,
               EXTRACTVALUE(VALUE(P), '/Currency/BanknoteSelling')WEFSATIS
        FROM TABLE(XMLSEQUENCE(EXTRACT(TCMB_XML,'/Tarih_Date')))X,
            TABLE (XMLSEQUENCE(EXTRACT(VALUE(X),'/Tarih_Date/Currency')))P
            WHERE EXTRACTVALUE(VALUE(P),'/Currency/@CurrencyCode') IN ('USD', 'EUR')
    )LOOP
        INSERT INTO GUNLUK_KUR (TARIH,KOD, ALIS, SATIS, EFALIS , EFSATIS) 
            SELECT TO_DATE(OKU.WTARIH,'DD/MM/YYYY'),
                   OKU.WKOD,
                   REPLACE(OKU.WALIS,'.',','),
                   REPLACE(OKU.WSATIS,'.',','),
                   REPLACE(OKU.WEFALIS,'.',','),
                   REPLACE(OKU.WEFSATIS,'.',',')
            FROM DUAL;
            COMMIT;
    END LOOP;
END;
