--PAKET ARACILIÐI ÝLE EXCEL DOSYASI OLUÞTURMAK PL SQL PACHAGE

BEGIN
    as_xlsx.query2sheet('SELECT * FROM EMP');
    as_xlsx.save('EXCEL_DIR','DENEME1.XLSX');

END;

BEGIN
    as_xlsx.new_sheet('EMP');
    as_xlsx.query2sheet('SELECT * FROM EMP',P_SHEET=>1);
    as_xlsx.new_sheet('DEPT');
    as_xlsx.query2sheet('SELECT * FROM DEPT ', P_SHEET=>2);
    as_xlsx.save('EXCEL_DIR', 'DENEME2.XLSX');
END;