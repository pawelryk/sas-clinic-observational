PROC IMPORT OUT= HCC.zgony_styczen_2018 
            DATAFILE= "C:\datasetshcc\zgony_styczen2018.txt" 
            DBMS=TAB REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

 data HCC.zgony_styczen2018    ;
       %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
       infile 'C:\datasetshcc\zgony_styczen2018.txt' delimiter='09'x MISSOVER DSD lrecl=32767 firstobs=2 ;
          informat Lp best32. ;
          informat Nazwisko $30. ;
          informat Imie1 $30. ;
          informat Imie2 $30. ;
          informat PESEL best32. ;
          informat Data_zgonu ddmmyy10. ;
          informat Komentarz $100. ;
          format Lp best12. ;
          format Nazwisko $18. ;
          format Imie1 $30. ;
          format Imie2 $30. ;
          format PESEL best32. ;
          format Data_zgonu yymmdd10. ;
          format Komentarz $100. ;
       input
                   Lp
                   Nazwisko $
                   Imie1 $
                   Imie2 $
                   PESEL
                   Data_zgonu
                   Komentarz $
       ;
       if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
       run;
