-- kullan�c� taraf�ndan tan�mlanan exclipt cursor   
set serveroutput on;
declare
cursor c_emp is select empno, ename from emp;
c_rec c_emp%rowtype; -- selectiondan d�nenleri tek kay�tta tutacak

begin
open c_emp; --cursor a��ld�

loop -- s�ral� bir �ekilde okumak i�in
fetch c_emp into c_rec;  -- fetch ile olu�turdu�umuz tek kay�tta tutuyor 
exit when c_emp%notfound; -- kay�t kalmad��� zaman looptan ��k
dbms_output.put_line(c_rec.empno||' '|| c_rec.ename);
end loop;
close c_emp; --cursor� kapat
end;