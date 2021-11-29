SELECT EXTRACT(VALUE(D), '//EMPNO/text()').getNumberVal() AS EMPNO,
       EXTRACT(VALUE(D), '//ENAME/text()').getStringVal() AS ENAME,
       EXTRACT(VALUE(D), '//SAL/text()').getNumberVal() AS SAL
FROM EMP_XML X,
        TABLE(XMLSEQUENCE(EXTRACT(VALUE(X), '/ROWSET/EMP'))) D