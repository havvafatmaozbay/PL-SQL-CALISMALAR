--- table bazl� recordlar
set serveroutput on;
declare
emp_rec emp%rowtype;-- table bazl� record rowtype

begin
select * into emp_rec from emp where rownum = 1;
dbms_output.put_line(emp_rec.empno);
end;