create or replace 
Package Plsql_Pdf As
      Procedure Pdf_Uret(P_Pdfname Varchar2);
      --PROCEDURE EMP_PDF (P_Pdfname Varchar2);
End;
/
create or replace 
Package Body Plsql_Pdf Is
     Procedure Pdf_Uret(P_Pdfname Varchar2) Is
        Font_Ariel  Pls_Integer;
        Font_Arieli  Pls_Integer;
        Font_Arielb  Pls_Integer;
        Font_ArielBI  Pls_Integer;
     Begin
        As_Pdf3.Init;
        As_Pdf3.Set_Page_Format('A4');
        As_Pdf3.Set_Page_Orientation('PORTRAIT');
        
         Font_Ariel := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arial.ttf','CID', P_Compress => True);
         Font_Arieli := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'ariali.ttf','CID', P_Compress => True);
         Font_Arielb := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbd.ttf','CID', P_Compress => True);
         Font_Arielbi := As_Pdf3.Load_Ttf_Font('FONT_DIR',  'arialbi.ttf','CID', P_Compress => True);
         
         As_Pdf3.Put_Image('PDF_DIR', 'RES�M.JPG', 100, 780, 100, 40, 'left');
         
         /*as_pdf3.set_font('helvetica',15);
         as_pdf3.Write('T�rk�e Karakter Testi ���i��� ������I',-1,730);
         
         as_pdf3.set_font(Font_Ariel,15);
         as_pdf3.Write('T�rk�e Karakter Testi ���i��� ������I',-1,710);*/
        
         /*as_pdf3.set_font(Font_Ariel,15);
         as_pdf3.write('PL/SQL ADNVANCE LEVEL DERS�', P_Y=>665, P_ALIGNMENT => 'CENTER');
         
         as_pdf3.write(Chr(10));
         
         as_pdf3.set_font(Font_Arielbi,15);
         as_pdf3.write('HAVVA FATMA �ZBAY', P_Y=>765, P_ALIGNMENT => 'CENTER');
         
         as_pdf3.write(Chr(10));
         
         as_pdf3.set_font(Font_Arielbi,10);
         as_pdf3.write('ELEKTR�K ELEKTRON�K M�HEND�S�', P_Y=>745, P_ALIGNMENT => 'CENTER');*/
         
         as_pdf3.set_font(Font_Arielbi,10);
         as_pdf3.write('PDF RAPOR', P_Y=>765, P_ALIGNMENT => 'CENTER');
         as_pdf3.Horizontal_Line(20,720,550,1.5);
         as_pdf3.Write('Ders No: 123', p_x =>20, p_y=>700, p_alignment =>'left');
         as_pdf3.Write('Merhaba Say�n Kullan�c�', p_x =>20, p_y=>680, p_alignment =>'left');
         as_pdf3.Write('Nas�ls�n�z', p_x =>20, p_y=>660, p_alignment =>'left');
         
        
        as_pdf3.SAVE_PDF(p_filename => P_Pdfname ||'.pdf');
        
        
        
        
    
    END;

END;
/
EXECUTE Plsql_Pdf.PDF_URET('turkce_TEST');