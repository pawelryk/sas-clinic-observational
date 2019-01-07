ods graphics on;
ods listing sge = on;
proc sort data=work.hcc_life01; by gender; run;
proc phreg data=work.hcc_life01 plots=survival PLOTS=CUMHAZ;
where dataLT>'19jan2012'd;
class gender;
model czasZgonu*censor(1)=gender
;run;

  ods graphics on; ods trace on/listing label;

title "Survival omparision before and after 2012-01-19 updated 2018-01-18";
proc lifetest data=work.hcc_life01 plots=survival(cb=hw atrisk=0 to 5 by 1) maxtime=5;

	time czasZgonu5 * censor(1);
	strata staragrupa / test=all 
/*adjust=sidak*/
;
    run;
	ods html close; ods html;
proc lifetest data=work.hcc_life01 plots=survival( atrisk=0 to 5 by 1) maxtime=5;

	time czasZgonu5 * censor(1);
	strata staragrupa / test=logrank adjust=sidak;
    run;
proc phreg data=work.hcc_life01; model czasZgonu * censor(1)=pretreat;strata staragrupa; run;
data work.hcc_life01; set work.hcc_life01; rokLT=year(dataLT); run;

proc freq data=work.hcc_life01;
 tables pretreat*rokLT/ chisq; run;



title "Comparision Milan criteria before 2012-01-19 survival updated 2018-01-18";
	proc lifetest data=work.hcc_life01 plots=survival( cb=hw atrisk=0 to 5 by 1) maxtime=5;
/*	where dataLT>'19jan2012'd;*/
	time czasZgonu5 * censor(1) ;
	strata MilanCriteria / test=all adjust=sidak  ;
    run;
title "Comparision Milan vs UCSF criteria after 2012-01-19 survival updated 2018-01-18";
proc lifetest data=work.hcc_life01 plots=survival( cb=hw atrisk=0 to 5 by 1) maxtime=5;
	where dataLT>'19jan2012'd;
	time czasZgonu * censor(1) ;
	strata MilanCriteria UCSFCriteria / test=logrank adjust=sidak  ;
    run;

title "Comparision Milan criteria after 2012-01-19 survival updated 2018-01-18";
proc lifetest data=work.hcc_life01 plots=survival( cb=hw atrisk=0 to 5 by 1) maxtime=5;
	where dataLT>'19jan2012'd;
	time czasZgonu5 * censor(1) ;
	strata MilanCriteria / test=all adjust=sidak  ;
    run;
/*	Do Zbigniewa*/

  ods graphics on; ods trace on/listing label;

title "Comparision Milan vs UCSF criteria for whole group survival updated 2018-01-18";
proc lifetest data=work.hcc_life01 plots=survival( cb=hw atrisk=0 to 5 by 1) maxtime=5;
/*	where dataLT>'19jan2012'd;*/
	time czasZgonu5 * censor(1);
	strata MilanCriteria / test=all adjust=sidak;
    run;
	ods html close; ods html;

	title "Comparision pretreatment vs treatment for whole group survival updated 2018-01-18";
proc lifetest data=work.hcc_life01 plots=survival( cb=hw atrisk=0 to 5 by 1) maxtime=5;
/*	where dataLT>'19jan2012'd;*/
	time czasZgonu * censor(1);
	strata pretreat / test=logrank adjust=sidak;
    run;

proc sort data=work.hcc_life01; by MilanCriteria; run;
proc phreg data=work.hcc_life01 plots=survival PLOTS=CUMHAZ;
/*where dataLT>'19jan2012'd;*/
class MilanCriteria;
model czasZgonu*censor(1)=MilanCriteria
;run;


    title '2000-2018';
proc lifetest data=work.hcc_life01 plots=survival(atrisk=0 to 5 by 1);
	time czasZgonu * censor(1);
	strata gender / test=logrank adjust=sidak;
    run;
	title '>2012';
proc lifetest data=work.hcc_life01 plots=survival(atrisk=0 to 5 by 1) maxtime=5;
	where dataLT<'19jan2012'd;
	time czasZgonu * censor(1);
	strata gender/ test=logrank adjust=sidak;
    run;
proc lifetest data=work.hcc_life01 plots=survival(atrisk=0 to 5 by 1);
	where dataLT>'19jan2012'd;
	time czasZgonu * censor(1);
	strata grupaKrwi / test=logrank adjust=sidak;
    run;
	
proc lifetest data=work.hcc_life01 plots=survival(atrisk=0 to 5 by 1);
	where dataLT>'19jan2012'd;
	time czasZgonu * censor(1);
	strata etHCV / test=logrank adjust=sidak;
    run;

proc lifetest data=work.hcc_life01 plots=survival(atrisk=0 to 5 by 1);
/*	where dataLT>'19jan2012'd;*/
	time czasZgonu * censor(1);
	strata etHCV / test=logrank adjust=sidak;
    run;
proc lifetest data=work.hcc_life01 plots=survival(atrisk=0 to 5 by 1);
	where dataLT>'19jan2012'd;
	time czasZgonu * censor(1);
	strata rokLT / 
/*test=logrank adjust=sidak;*/
    ;run;


title "abstrakt przed i po 2012 roku";
proc freq data=work.hcc_life01; 
tables MilanCriteria*staragrupa
pretreat*staragrupa
gender*staragrupa
staragrupa*cechyAngioinwazji/chisq;run;
proc freq data=work.hcc_life02; 
tables staragrupa*_name_/chisq;weight col1;run;

proc freq data=work.hcc_life03; 
tables staragrupa*_name_/chisq;weight col1;run;


proc sort data=work.hcc_life01; by staragrupa;run;
proc univariate data=work.hcc_life01; var
wiek wymiar1; by staragrupa;run;

proc npar1way data=work.hcc_life01; 
var wiek wymiar1 TTV iloscZmian; class staragrupa;run;
proc univariate data=work.hcc_life01; 
var wiek wymiar1 TTV iloscZmian; class staragrupa;run;
/*	proc contents data=work.hcc_life01 varnum;run;*/

/**/
/*proc phreg;*/
/*model czasdo110*z65_70(0)=DuzoZNW /risklimits;*/
/**/
/*run;*/
/*proc phreg; plots=surviaval;*/
/*model czasdo110*z70plus(0)=DuzoZNW /risklimits;*/
/**/
/*run;*/
