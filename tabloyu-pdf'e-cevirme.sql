create or replace 
Package Plsql_Pdf As
      Procedure Pdf_Uret(P_Pdfname Varchar2);
      PROCEDURE EMP_PDF (P_Pdfname Varchar2);
End;
/
create or replace 
Package Body Plsql_Pdf Is
     Procedure Pdf_Uret(P_Pdfname Varchar2) Is
        Font_Ariel  Pls_Integer;
        Font_Arieli  Pls_Integer;
        Font_Arielb  Pls_Integer;
        Font_ArielBI  Pls_Integer;
     BEGIN
        As_Pdf3.Init;
        As_Pdf3.Set_Page_Format('A4');
        As_Pdf3.Set_Page_Orientation('PORTRAIT');
        
         Font_Ariel := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arial.ttf','CID', P_Compress => True);
         Font_Arieli := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'ariali.ttf','CID', P_Compress => True);
         Font_Arielb := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbd.ttf','CID', P_Compress => True);
         Font_Arielbi := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbi.ttf','CID', P_Compress => True);
         
         As_Pdf3.Put_Image('PDF_DIR', 'RESÝM.JPG', 100, 780, 100, 40, 'left');
         
         /*as_pdf3.set_font('helvetica',15);
         as_pdf3.Write('Türkçe Karakter Testi öçþiðüý ÖÇÞÝÐÜI',-1,730);
         
         as_pdf3.set_font(Font_Ariel,15);
         as_pdf3.Write('Türkçe Karakter Testi öçþiðüý ÖÇÞÝÐÜI',-1,710);*/
        
         /*as_pdf3.set_font(Font_Ariel,15);
         as_pdf3.write('PL/SQL ADNVANCE LEVEL DERSÝ', P_Y=>665, P_ALIGNMENT => 'CENTER');
         
         as_pdf3.write(Chr(10));
         
         as_pdf3.set_font(Font_Arielbi,15);
         as_pdf3.write('HAVVA FATMA ÖZBAY', P_Y=>765, P_ALIGNMENT => 'CENTER');
         
         as_pdf3.write(Chr(10));
         
         as_pdf3.set_font(Font_Arielbi,10);
         as_pdf3.write('ELEKTRÝK ELEKTRONÝK MÜHENDÝSÝ', P_Y=>745, P_ALIGNMENT => 'CENTER');*/
         
         /*as_pdf3.set_font(Font_Arielbi,10);
         as_pdf3.write('PDF RAPOR', P_Y=>765, P_ALIGNMENT => 'CENTER');
         as_pdf3.Horizontal_Line(20,720,550,1.5);
         as_pdf3.Write('Ders No: 123', p_x =>20, p_y=>700, p_alignment =>'left');
         as_pdf3.Write('Merhaba Sayýn Kullanýcý', p_x =>20, p_y=>680, p_alignment =>'left');
         as_pdf3.Write('Nasýlsýnýz', p_x =>20, p_y=>660, p_alignment =>'left');*/
         
        
    
    END;
    Procedure EMP_PDF(P_Pdfname Varchar2) Is
        Font_Ariel  Pls_Integer;
        Font_Arieli  Pls_Integer;
        Font_Arielb  Pls_Integer;
        Font_ArielBI  Pls_Integer;
        WYAZ VARCHAR2(2000);
        I NUMBER:= -1;
     BEGIN
        As_Pdf3.Init;
        As_Pdf3.Set_Page_Format('A4');
        As_Pdf3.Set_Page_Orientation('PORTRAIT');
        
         Font_Ariel := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arial.ttf','CID', P_Compress => True);
         Font_Arieli := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'ariali.ttf','CID', P_Compress => True);
         Font_Arielb := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbd.ttf','CID', P_Compress => True);
         Font_Arielbi := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbi.ttf','CID', P_Compress => True);
         
         as_pdf3.set_font(Font_Arielb,15);
         as_pdf3.Write(RPAD('SÝCÝL NO',15,' ')||RPAD('ÝSMÝ',15,' ')||RPAD('ÝÞÝ',20,' '),P_Alignment=>'CENTER');
         as_pdf3.horizontal_line(20,725,550,1.5);
         
         as_pdf3.set_font(Font_Ariel,12);
         
         for oku IN (SELECT Empno, Ename , Job From Emp) Loop
            I := I-20;
            WYAZ := RPAD(OKU.EMPNO,15,' ')|| RPAD(OKU.ENAME,15,' ')|| RPAD(OKU.JOB,20,' ');
            AS_PDF3.Write(WYAZ, -1,I, P_Alignment =>'CENTER');
            as_pdf3.write(chr(10));
            as_pdf3.horizontal_line(20,300,550,1.5);
            
            
         end loop;
         as_pdf3.horizontal_line(20,300,550,1.5);
         as_pdf3.set_font(Font_Arieli,30);
         as_pdf3.put_txt(150,200,'Havva Fatma Özbay',45);--watermark
         
         as_pdf3.SAVE_PDF(p_filename => P_Pdfname ||'.pdf');
    END;
         

END;
/
EXECUTE Plsql_Pdf.EMP_PDF('emp_test');