--deðiþkenlere deðer atamak

DESC EMP;

declare
  p_empno EMP.empno%type;
  p_ename EMP.ename%type;
  p_sal EMP.sal%type;
  p_deptno EMP.DEPTNO%type;
begin
  select empno, ename, sal, deptno into p_empno, p_ename , p_sal,p_deptno from EMP
  where empno =(select max(empno) from EMP);
  
  DBMS_OUTPUT.PUT_LINE('EMPNO ='||p_empno||'ENAME ='||p_ename);

end;