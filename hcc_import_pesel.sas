/*PROC IMPORT OUT= HCC.HCC1 */
/*            DATAFILE= "C:\datasetshcc\liver_hcc_z_PESEL.txt" */
/*            DBMS=TAB REPLACE;*/
/*     GETNAMES=YES;*/
/*     DATAROW=2; */
/*RUN;*/

     data HCC.HCC1    ;
     %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
     infile 'C:\datasetshcc\liver_hcc_z_PESEL.txt' delimiter='09'x MISSOVER DSD lrecl=32767 firstobs=2 ;
        informat Nr_w_roku best12. ;
        informat Nazwisko $30. ;
        informat Imie $30. ;
        informat dataLT yymmdd10. ;
        informat dataReLT yymmdd10. ;
        informat dataReReLT yymmdd10. ;
        informat DOB yymmdd10. ;
        informat PESEL best32. ;
        informat ZIPcode $6. ;
        informat telefon $20. ;
        informat VAR11 $20. ;
        informat VAR12 $20. ;
        informat telefonOpiekun $20. ;
        informat mail $30. ;
        informat gender $1. ;
        informat dataAktywacjiKLO yymmdd10. ;
        informat grupaKrwi $5. ;
        informat masa best12. ;
        informat wysokosc best12 ;
        informat podejrzenieHCC $1. ;
        informat masaDawcy best12. ;
        informat wysokoscDawcy best12. ;
        informat dataObserwacji yymmdd10. ;
        informat zgon best32. ;
        informat dataZgon yymmdd10. ;
        informat przyczynaZgon $1. ;
        informat nawrot $1. ;
        informat dataNawrot $1. ;
        informat etHCV best32. ;
        informat etHBV best32. ;
        informat etEtOH best32. ;
        informat etcrypt best32. ;
        informat etNoCirrh best32. ;
        informat PBC best32. ;
        informat inne best32. ;
        informat pretreat best32. ;
        informat liverresection best32. ;
        informat cryoablation best32. ;
        informat RFA best32. ;
        informat TACE best32. ;
        informat CTrzedPrereat best32. ;
        informat CTiloscZmian best32. ;
        informat CTwymiar1 best32. ;
        informat CTwymiar2 best32. ;
        informat CTwymiar3 best32. ;
        informat CTwymiar4 best32. ;
        informat dataOstatniegoCT yymmdd10. ;
        informat diffused best32. ;
        informat PVTT best32. ;
        informat cTNM_T_AJCC $10. ;
        informat cTNM_T_ALTSTG $10. ;
        informat OPTNclass_1 $10. ;
        informat OPTNclass_2 $10. ;
        informat SPECT_MDP $10. ;
        informat potwierdzenieHCC best32. ;
        informat iloscZmian best32. ;
        informat martwica_guza best32. ;
        informat typMakroskopowy $20. ;
        informat typMarskosci $20. ;
        informat extrahepaticGrowth best32. ;
        informat grading $10. ;
        informat wariant $20. ;
        informat pTNM_Tpatolog best32. ;
        informat pTNM $20. ;
        informat HepPar $10. ;
        informat CK7 $10. ;
        informat CK19 $10. ;
        informat wymiar1 best32. ;
        informat wymiar2 best32. ;
        informat wymiar3 best32. ;
        informat wymiar4 best32. ;
        informat wymiar5 best32. ;
        informat wymiar6 best32. ;
        informat TTV best32. ;
        informat CalkowitaLiczbaZmian best32. ;
        informat stluszczenieWlasna $20. ;
        informat procentStluszczeniaWlasnaWielko best32. ;
        informat procentStluszczeniaWlasnaDrobno best32. ;
        informat cechyAngioinwazji best32. ;
        informat stluszczenieGraftu $50. ;
        informat procentStluszceniaGraftWielko best32. ;
        informat procentStluszceniaGraftDrobno best32. ;
        informat cechyOdrzucania best32. ;
        informat VAR84 $1. ;
        informat VAR85 $1. ;
        informat wysokiosc $1. ;
        informat masaCiala $1. ;
        informat cukrzyca $1. ;
        informat metabolicSyndrome $1. ;
        informat AFPpre $1. ;
        informat VAR91 $1. ;
        informat VAR92 $1. ;
        informat VAR93 $1. ;
        informat VAR94 $1. ;
        informat VAR95 $1. ;
        informat VAR96 $1. ;
        informat VAR97 $1. ;
        informat VAR98 $1. ;
        informat VAR99 $1. ;
        informat VAR100 $1. ;
        informat VAR101 $1. ;
        format Nr_w_roku best12. ;
        format Nazwisko $30. ;
        format Imie $30. ;
        format dataLT yymmdd10. ;
        format dataReLT yymmdd10. ;
        format dataReReLT yymmdd10. ;
        format DOB yymmdd10. ;
        format PESEL best32. ;
        format ZIPcode $6. ;
        format telefon $20. ;
        format VAR11 $20. ;
        format VAR12 $20. ;
        format telefonOpiekun $20. ;
        format mail $30. ;
        format gender $1. ;
        format dataAktywacjiKLO yymmdd10. ;
        format grupaKrwi $5. ;
        format masa best12. ;
        format wysokosc best12. ;
        format podejrzenieHCC $1. ;
        format masaDawcy best12. ;
        format wysokoscDawcy best12. ;
        format dataObserwacji yymmdd10. ;
        format zgon best32. ;
        format dataZgon yymmdd10. ;
        format przyczynaZgon $1. ;
        format nawrot $1. ;
        format dataNawrot $1. ;
        format etHCV best12. ;
        format etHBV best12. ;
        format etEtOH best12. ;
        format etcrypt best12. ;
        format etNoCirrh best12. ;
        format PBC best12. ;
        format inne best12. ;
        format pretreat best12. ;
        format liverresection best12. ;
        format cryoablation best12. ;
        format RFA best12. ;
        format TACE best12. ;
        format CTrzedPrereat best32. ;
        format CTiloscZmian best32. ;
        format CTwymiar1 best32. ;
        format CTwymiar2 best32. ;
        format CTwymiar3 best32. ;
        format CTwymiar4 best32. ;
        format dataOstatniegoCT yymmdd10. ;
        format diffused best32. ;
        format PVTT best32. ;
        format cTNM_T_AJCC $10. ;
        format cTNM_T_ALTSTG $10. ;
        format OPTNclass_1 $10. ;
        format OPTNclass_2 $10. ;
        format SPECT_MDP $10. ;
        format potwierdzenieHCC best12. ;
        format iloscZmian best12. ;
        format martwica_guza best12. ;
        format typMakroskopowy $20. ;
        format typMarskosci $20. ;
        format extrahepaticGrowth best32. ;
        format grading $10. ;
        format wariant $20. ;
        format pTNM_Tpatolog best32. ;
        format pTNM $20. ;
        format HepPar $10. ;
        format CK7 $10. ;
        format CK19 $10. ;
        format wymiar1 best12. ;
        format wymiar2 best12. ;
        format wymiar3 best12. ;
        format wymiar4 best12. ;
        format wymiar5 best12. ;
        format wymiar6 best12. ;
        format TTV best12. ;
        format CalkowitaLiczbaZmian best12. ;
        format stluszczenieWlasna $20. ;
        format procentStluszczeniaWlasnaWielko best12. ;
        format procentStluszczeniaWlasnaDrobno best12. ;
        format cechyAngioinwazji best12. ;
        format stluszczenieGraftu $50. ;
        format procentStluszceniaGraftWielko best12. ;
        format procentStluszceniaGraftDrobno best12. ;
        format cechyOdrzucania best12. ;
        format VAR84 $1. ;
        format VAR85 $1. ;
        format wysokiosc $1. ;
        format masaCiala $1. ;
        format cukrzyca $1. ;
        format metabolicSyndrome $1. ;
        format AFPpre $1. ;
        format VAR91 $1. ;
        format VAR92 $1. ;
        format VAR93 $1. ;
        format VAR94 $1. ;
        format VAR95 $1. ;
        format VAR96 $1. ;
        format VAR97 $1. ;
        format VAR98 $1. ;
        format VAR99 $1. ;
        format VAR100 $1. ;
        format VAR101 $1. ;
     input
                 Nr_w_roku 
                 Nazwisko $
                 Imie $
                 dataLT
                 dataReLT 
                 dataReReLT 
                 DOB
                 PESEL
                 ZIPcode $
                 telefon $
                 VAR11 $
                 VAR12 $
                 telefonOpiekun $
                 mail $
                 gender $
                 dataAktywacjiKLO
                 grupaKrwi $
                 masa 
                 wysokosc 
                 podejrzenieHCC $
                 masaDawcy 
                 wysokoscDawcy 
                 dataObserwacji
                 zgon
                 dataZgon
                 przyczynaZgon $
                 nawrot $
                 dataNawrot $
                 etHCV
                 etHBV
                 etEtOH
                 etcrypt
                 etNoCirrh
                 PBC
                 inne
                 pretreat
                 liverresection
                 cryoablation
                 RFA 
                 TACE
                 CTrzedPrereat
                 CTiloscZmian
                 CTwymiar1
                 CTwymiar2
                 CTwymiar3
                 CTwymiar4
                 dataOstatniegoCT
                 diffused
                 PVTT
                 cTNM_T_AJCC $
                 cTNM_T_ALTSTG $
                 OPTNclass_1 $
                 OPTNclass_2 $
                 SPECT_MDP $
                 potwierdzenieHCC
                 iloscZmian
                 martwica_guza
                 typMakroskopowy $
                 typMarskosci $
                 extrahepaticGrowth
                 grading $
                 wariant $
                 pTNM_Tpatolog
                 pTNM $
                 HepPar $
                 CK7 $
                 CK19 $
                 wymiar1
                 wymiar2
                 wymiar3
                 wymiar4
                 wymiar5
                 wymiar6
                 TTV
                 CalkowitaLiczbaZmian
                 stluszczenieWlasna $
                 procentStluszczeniaWlasnaWielko
                 procentStluszczeniaWlasnaDrobno
                 cechyAngioinwazji
                 stluszczenieGraftu $
                 procentStluszceniaGraftWielko
                 procentStluszceniaGraftDrobno
                 cechyOdrzucania $
                 VAR84 $
                 VAR85 $
                 wysokiosc $
                 masaCiala $
                 cukrzyca $
                 metabolicSyndrome $
                 AFPpre $
                 VAR91 $
                 VAR92 $
                 VAR93 $
                 VAR94 $
                 VAR95 $
                 VAR96 $
                 VAR97 $
                 VAR98 $
                 VAR99 $
                 VAR100 $
                 VAR101 $
     ;
     if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
     run;
