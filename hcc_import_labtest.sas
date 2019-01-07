/*PROC IMPORT OUT= BIB.Lab_test */
/*            DATAFILE= "D:\DANE clininet\transp-watroby.csv" */
/*            DBMS=DLM REPLACE;*/
/*			delimiter=';';*/
/*     GETNAMES=YES;*/
/*     DATAROW=2; */
/*RUN;*/


/*Importuje dane z pliku tekstowego oddzielonego znakiem ; */
      data BIB.LAB_TEST    ;
      %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
      infile 'D:\DANE clininet\transp-watroby.csv' delimiter = ';' MISSOVER DSD lrecl=32767 firstobs=2 ;
         informat EpisodeId best32. ;
         informat EventId best32. ;
         informat PersonId best32. ;
         informat Pesel $13. ;
         informat ServiceId best32. ;
         informat ServiceCode $10. ;
         informat ServiceFullName $100. ;
         informat PerfServiceId best32. ;
         informat OrderDT anydtdtm40. ;
         informat PerfDT anydtdtm40. ;
         informat AttrCode $20. ;
         informat AttrFullName $50. ;
         informat AttrTypeId best32. ;
         informat Result $100. ;
         informat UnitId best32. ;
         informat UnitCode $20. ;
         informat LowerNorm $20. ;
         informat UpperNorm $20. ;
         format EpisodeId best12. ;
         format EventId best12. ;
         format PersonId best12. ;
         format Pesel $13. ;
         format ServiceId best12. ;
         format ServiceCode $10. ;
         format ServiceFullName $100. ;
         format PerfServiceId best12. ;
         format OrderDT datetime. ;
         format PerfDT datetime. ;
         format AttrCode $20. ;
         format AttrFullName $50. ;
         format AttrTypeId best12. ;
         format Result $100. ;
         format UnitId best12. ;
         format UnitCode $20. ;
         format LowerNorm $20. ;
         format UpperNorm $20. ;
      input
                  EpisodeId
                  EventId
                  PersonId
                  Pesel $
                  ServiceId
                  ServiceCode $
                  ServiceFullName $
                  PerfServiceId
                  OrderDT
                  PerfDT
                  AttrCode $
                  AttrFullName $
                  AttrTypeId
                  Result $
                  UnitId
                  UnitCode $
                  LowerNorm $
                  UpperNorm $
      ;
      if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
      run;



data work.lab_test; set bib.lab_test;
/*Rozdziela zmienn¹ typu string na wyrazy*/
first=scan(Result,1,' ');
second=scan(Result,2,' ');
third=scan(Result,3,' ');
fourth=scan(Result,4,' ');
last=scan(Result,-1,' ');
/*Pokazuje gdzie zaczyna sie liczba*/
ktoryNumer=anydigit(Result);
/*Pokazuje czy w wyniku jest znak nierównoœci*/
ktoryZnak=kindexc(Result,'<')+kindexc(Result,'>');
if ktoryNumer=1 then ResultNumeric=first;
if ktoryNumer=2 then ResultInequality=substr(first,2);
if ktoryNumer=2 then SignInequality=substr(first,1,1);
if ktoryNumer=3 and ktoryZnak=1 then ResultInequality=second;
if ktoryNumer=3 and ktoryZnak=1 then SignInequality=first;
if (ktoryNumer>3 or ktoryNumer<1) and .<ktoryZnak<1 then ResultString=Result;

/*Zmienia string na numeric*/
ResultNumericNum=input(ResultNumeric,best12.);
ResultInequalityNum=input(ResultInequality,best12.);
;run;

proc print data=work.lab_test;
where contains(first,">") or contains(first,"<")
;run;
proc print data=work.lab_test;
where first^=last and second^=last and third^=last and fourth^=last 
;run;
proc print data=work.lab_test;
where find(Result,"<") or find(Result,">")
;run;
proc print data=work.lab_test;
where ResultString^="";
;run;


