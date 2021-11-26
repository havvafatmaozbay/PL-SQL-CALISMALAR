-- kullanýcý tarafýndan tanýmlanan exclipt cursor   
set serveroutput on;
declare
cursor c_emp is select empno, ename from emp;
c_rec c_emp%rowtype; -- selectiondan dönenleri tek kayýtta tutacak

begin
open c_emp; --cursor açýldý

loop -- sýralý bir þekilde okumak için
fetch c_emp into c_rec;  -- fetch ile oluþturduðumuz tek kayýtta tutuyor 
exit when c_emp%notfound; -- kayýt kalmadýðý zaman looptan çýk
dbms_output.put_line(c_rec.empno||' '|| c_rec.ename);
end loop;
close c_emp; --cursorý kapat
end;