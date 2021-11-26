-- kullan�c� taraf�ndan tan�mlanan exclipt cursor   
set serveroutput on;
declare
cursor c_emp is select empno, ename from emp;
e_empno emp.empno%type;
e_ename emp.ename%type;

begin
open c_emp; --cursor a��ld�

loop -- s�ral� bir �ekilde okumak i�in
fetch c_emp into e_empno, e_ename;  -- fetch ile olu�turdu�umuz objelere at�yoruz
exit when c_emp%notfound; -- kay�t kalmad��� zaman looptan ��k
dbms_output.put_line(e_empno||' '||e_ename);
end loop;
close c_emp; --cursor� kapat
end;