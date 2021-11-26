-- parametreli cursorlar nasýl tanýmlanýr
set serveroutput on;

declare
cursor cur_dept is select deptno, dname from dept;
cursor cur_emp (p_deptno dept.deptno%type) is select empno, ename, sal from emp where deptno = p_deptno; -- parametre ile cursor tanýmlamak
rec_emp cur_emp%rowtype;
rec_dept cur_dept%rowtype;
toplam_maas number(10,2);
begin
open cur_dept;

loop
fetch cur_dept into rec_dept;
exit when cur_dept%notfound;
dbms_output.put_line(rec_dept.deptno||' '||rec_dept.dname);
dbms_output.put_line('---------------------');
toplam_maas:= 0;
open cur_emp(rec_dept.deptno);
loop
fetch cur_emp into rec_emp;
exit when cur_emp%notfound;
dbms_output.put_line(rec_emp.ename||' '||rec_emp.sal);
toplam_maas := toplam_maas+rec_emp.sal;

end loop;
dbms_output.put_line(rec_dept.deptno||' bölümünün maaþ toplammý'||toplam_maas);
close cur_emp;
end loop;

close cur_dept;

end;