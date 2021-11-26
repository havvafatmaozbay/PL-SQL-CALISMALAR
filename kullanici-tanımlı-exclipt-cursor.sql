-- kullanýcý tarafýndan tanýmlanan exclipt cursor   
set serveroutput on;
declare
cursor c_emp is select empno, ename from emp;
e_empno emp.empno%type;
e_ename emp.ename%type;

begin
open c_emp; --cursor açýldý

loop -- sýralý bir þekilde okumak için
fetch c_emp into e_empno, e_ename;  -- fetch ile oluþturduðumuz objelere atýyoruz
exit when c_emp%notfound; -- kayýt kalmadýðý zaman looptan çýk
dbms_output.put_line(e_empno||' '||e_ename);
end loop;
close c_emp; --cursorý kapat
end;