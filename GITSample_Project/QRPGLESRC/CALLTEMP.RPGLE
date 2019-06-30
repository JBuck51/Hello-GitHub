000001170514       // ********************************************************************
000105170514       //                                                                    *
000106170514       //  To Run program - call calltemp parm('50')                         *
000107170514       //                                                                    *
000108170514       //   Written: Jim Buck  Email: jbuck@impowertechnologies              *
000109170514       //   Copyright 2017 - imPower Technologies                            *
000110170514       //   These examples are for demonstration purposes. There are         *
000111170514       //   NO Express of implied warranties. Have fun with the code!        *
000112170514       // ********************************************************************
000113170514       //  Compiled using the CRTBNDPGM command                              *
000114170514       //  CRTBNDRPG PGM(SPKING16/CALLTEMP) SRCFILE(SPKING16/QRPGLESRC)      *
000115170514       //  SRCMBR(CALLTEMP) OPTION(*EVENTF) DBGVIEW(*SOURCE) REPLACE(*YES)   *
000116160604       //===============================================================*
000117170514
000118170312       // Control Options ==============================================*
000119170312         Ctl-Opt Option(*NoDebugIO) DftActGrp(*No);
000120170312
000121160519          Dcl-pr CallTemp ExtPgm;
000122170312            *N char(5);
000123160519          End-pr;
000124160519
000125160519          Dcl-pi CallTemp;
000126170312            CharTemp char(5);
000127160519          End-pi;
000128160519
000129160519         // ----------------------------------------- Prototypes
000130170312          Dcl-pr Celsius Zoned(5:2);
000131170312             *N Zoned(5:2);
000132160519          End-pr;
000133160519
000134160519         // ----------------------------------- Global variables
000135170312         Dcl-s Message      Char(52);
000136170312         Dcl-s Metrictemp   Zoned(5:2);
000137170312         Dcl-s State        Varchar(8);
000138170312         Dcl-s EnglishTemp  Zoned(5:2);
000139160519         // ------------------------------------- Main procedure
000140160519
000141170312         EnglishTemp = %Dec(CharTemp:5:2);
000142160519         Metrictemp = Celsius(Englishtemp);
000143160519
000144160519         Select;
000145160519           When Metrictemp < 0;
000146160519              State = 'solid';
000147160519           When Metrictemp = 0;
000148160519              State = 'freezing';
000149160519           When Metrictemp = 100;
000150160519              State = 'boiling';
000151160519           When Metrictemp > 100;
000152160519              State = 'gaseous';
000153160519           Other;
000154160519              State = 'liquid';
000155160519           Endsl;
000156160519
000157160519           Message = 'At ' + %Char(Englishtemp) + ' degrees (' +
000158160519                    %Char(Metrictemp) + ' Celsius), water is ' +
000159160519                        State + '.';
000160170312
000161170312           Dsply Message '*REQUESTER';
000162160519           *Inlr = *On;
000163160519           Return;
000164160519
000165160519           // ----------------------------------------------------
000166160519           // Procedure  Celsius  Converts Fahrenheit to Celsius
000167160802           // ----------------------------------------------------
000168160519          Dcl-proc Celsius;
000169160519
000170160519            // ------------------------------ Procedure interface
000171170312            Dcl-pi *N  Zoned(5:2);
000172170312               Fahrenheit Zoned(5:2);
000173160519            End-pi;
000174160519
000175170312            // ---------------------------------- Local variables
000176170312            Dcl-s Temperature  Zoned(5:2);
000177160519
000178160519            Eval(H) Temperature = (5/9) * (Fahrenheit - 32);
000179160519            Return Temperature;
000180160519
000181160519          End-proc Celsius;
000182160519
000183160519
