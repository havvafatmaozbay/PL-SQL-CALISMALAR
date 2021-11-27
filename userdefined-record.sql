-- user defined record

declare
type kitaplar is record(
  kitapAdi varchar2(60),
  yazar varchar2(40),
  konusu varchar2(100),
  ISBN number,
  yayinevi varchar2(40),
  kitap_,c, bfile
);
kitap1 kitaplar;
kitap2 kitaplar;
begin
kitap1.kitapAdi:='sql dersleri';
kitap1.yazar ='mehmet celebi';


end;