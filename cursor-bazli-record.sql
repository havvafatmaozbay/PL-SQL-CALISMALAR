--- cursor bazlý record

declare
cursor c_emp is select * from emp;
emp_rec c_emp%rowtype;
begin
open c_emp;
loop
fetch c_emp into emp_rec;
exit when c_emp%notfound;
dbms_output.put_line(emp_rec.empno);

end loop;
close c_emp;
end;