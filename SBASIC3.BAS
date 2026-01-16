DECLARE FUNCTION Far2Ran! (E!)
DECLARE FUNCTION Cel2Rea! (E!)
DECLARE FUNCTION Far2Kel! (E!)
DECLARE FUNCTION Cel2Far! (E!)
DECLARE FUNCTION Far2Rea! (E!)
DECLARE FUNCTION Far2Cel! (E!)
DECLARE SUB SbArcCos ()
DECLARE SUB SbArcCot ()
DECLARE SUB SbArcCoth ()
DECLARE SUB SbArcCsc ()
DECLARE SUB SbArcCsch ()
DECLARE SUB SbArcSec ()
DECLARE SUB SbArcSech ()
DECLARE SUB SbArcSin ()
DECLARE SUB SbArcTanh ()
DECLARE SUB SbArcCosh ()
DECLARE FUNCTION ArcCosh! (E!)
DECLARE FUNCTION ArcTanh! (E!)
DECLARE FUNCTION ArcSech! (E!)
DECLARE FUNCTION ArcCsch! (E!)
DECLARE FUNCTION ArcCoth! (E!)
DECLARE FUNCTION ArcSin! (E!)
DECLARE FUNCTION ArcCos! (E!)
DECLARE FUNCTION ArcSec! (E!)
DECLARE FUNCTION ArcCsc! (E!)
DECLARE FUNCTION ArcCot! (E!)
DECLARE SUB SbArcSinh ()
DECLARE FUNCTION ArcSinh! (E!)
DECLARE SUB SbCosh ()
DECLARE FUNCTION Cosh! (E!)
DECLARE SUB SbTanh ()
DECLARE FUNCTION Tanh! (E!)
DECLARE SUB SbSinh ()
DECLARE FUNCTION Sinh! (E!)
DECLARE FUNCTION Sec! (E!)
DECLARE FUNCTION Rad! (E!)
DECLARE FUNCTION Deg! (E!)
DECLARE FUNCTION Csc! (E!)
DECLARE FUNCTION Cot! (E!)
DECLARE SUB SbTan ()
DECLARE SUB SbCdbl ()
DECLARE SUB SbCsng ()
DECLARE SUB SbSec ()
DECLARE SUB SbCsc ()
DECLARE SUB SbCot ()
DECLARE SUB SbDeg ()
DECLARE SUB SbRad ()
DECLARE SUB SbSqr ()
DECLARE SUB SbSin ()
DECLARE SUB SbSgn ()
DECLARE SUB SbRnd ()
DECLARE SUB SbLog ()
DECLARE SUB SbInt ()
DECLARE SUB SbCint ()
DECLARE SUB SbCos ()
DECLARE SUB SbExp ()
DECLARE SUB SbFix ()
DECLARE SUB SbAtn ()
DECLARE SUB SbAbs ()
DECLARE SUB Commands (A$)
DECLARE SUB Ready ()
DECLARE SUB Center (row!, text$)
DECLARE SUB Box (Row1!, Col1!, Row2!, Col2!)
DECLARE SUB Intro ()
COMMON SHARED A$
CLS
LCN = 2
Intro

'SUPER BASIC ARCCOS FUNCTION VERSION 1.00
FUNCTION ArcCos (E)
ArcCos = 1.570796 - ATN(E / SQR(ABS(1 - E * E)))
END FUNCTION

'SUPER BASIC ARCCOSH FUNCTION VERSION 1.00
FUNCTION ArcCosh (E)
ArcCosh = LOG(E + SQR(E * E - 1))
END FUNCTION

'SUPER BASIC ARCCOT FUNCTION VERSION 1.00
FUNCTION ArcCot (E)
ArcCot = 1.57096 - ATN(E)
END FUNCTION

'SUPER BASIC ARCCOTH FUNCTION VERSION 1.00
FUNCTION ArcCoth (E)
ArcCoth = LOG((E + 1) / (E - 1)) / 2
END FUNCTION

'SUPER BASIC ARCCSC FUNCTION VERSION 1.00
FUNCTION ArcCsc (E)
ArcCsc = ATN(1 / SQR(E * E - 1)) + (E < 0) * 3.141593
END FUNCTION

'SUPER BASIC ARCCSCH FUNCTION VERSION 1.00
FUNCTION ArcCsch (E)
ArcCsch = LOG((1 + SGN(E) * SQR(1 + E * E)) / E)
END FUNCTION

'SUPER BASIC ARCSEC FUNCTION VERSION 1.00
FUNCTION ArcSec (E)
ArcSec = ATN(SQR(E * E - 1)) + (E < 0) * 3.141593
END FUNCTION

'SUPER BASIC ARCSECH FUNCTION VERSION 1.00
FUNCTION ArcSech (E)
ArcSech = LOG((1 + SQR(ABS(1 - E * E))) / E)
END FUNCTION

'SUPER BASIC ARCSIN FUNCTION VERSION 1.00
FUNCTION ArcSin (E)
ArcSin = ATN(E / SQR(ABS(1 - E * E)))
END FUNCTION

'SUPER BASIC ARCSINH FUNCTION VERSION 1.00
FUNCTION ArcSinh (E)
ArcSinh = LOG(E + SQR(E * E + 1))
END FUNCTION

'SUPER BASIC ARCTANH FUNCTION VERSION 1.00
FUNCTION ArcTanh (E)
ArcTanh = LOG(ABS((1 + E) / (1 - E))) / 2
END FUNCTION

SUB Box (Row1, Col1, Row2, Col2) STATIC

    BoxWidth = Col2 - Col1 + 1

    LOCATE Row1, Col1
    PRINT "Ú"; STRING$(BoxWidth - 2, "Ä"); "¿";

    FOR A = Row1 + 1 TO Row2 - 1
        LOCATE A, Col1
        PRINT "³"; SPACE$(BoxWidth - 2); "³";
    NEXT A

    LOCATE Row2, Col1
    PRINT "À"; STRING$(BoxWidth - 2, "Ä"); "Ù";


END SUB

FUNCTION Cel2Far (E)
T1 = 32 + E * 1.8
Cel2Far = T1
END FUNCTION

FUNCTION Cel2Rea (E)
T1 = 32 + E * 1.8
Cel2Rea = 4 * (T1 - 32) / 9
END FUNCTION

SUB Center (row, text$)
    LOCATE row, 41 - LEN(text$) / 2
    PRINT text$;
END SUB

SUB Commands (A$)
IF LEFT$(A$, 4) = "SINH" THEN
        SbSinh
GOTO B:
END IF
IF LEFT$(A$, 4) = "COSH" THEN
        SbCosh
GOTO B:
END IF
IF LEFT$(A$, 4) = "TANH" THEN
        SbTanh
GOTO B:
END IF
IF LEFT$(A$, 7) = "ARCSINH" THEN
        SbArcSinh
GOTO B:
END IF
IF LEFT$(A$, 7) = "ARCCOSH" THEN
        SbArcCosh
GOTO B:
END IF
IF LEFT$(A$, 7) = "ARCTANH" THEN
        SbArcTanh
GOTO B:
END IF
IF LEFT$(A$, 7) = "ARCSECH" THEN
        SbArcSech
GOTO B:
END IF
IF LEFT$(A$, 7) = "ARCCSCH" THEN
        SbArcCsch
GOTO B:
END IF
IF LEFT$(A$, 7) = "ARCCOTH" THEN
        SbArcCoth
GOTO B:
END IF
IF LEFT$(A$, 6) = "ARCSIN" THEN
        SbArcSin
GOTO B:
END IF
IF LEFT$(A$, 6) = "ARCCOS" THEN
        SbArcCos
GOTO B:
END IF
IF LEFT$(A$, 6) = "ARCSEC" THEN
        SbArcSec
GOTO B:
END IF
IF LEFT$(A$, 6) = "ARCCSC" THEN
        SbArcCsc
GOTO B:
END IF
IF LEFT$(A$, 6) = "ARCCOT" THEN
        SbArcCot
GOTO B:
END IF
IF LEFT$(A$, 3) = "ABS" THEN
        SbAbs
GOTO B:
END IF
IF LEFT$(A$, 3) = "ATN" THEN
        SbAtn
GOTO B:
END IF
IF LEFT$(A$, 3) = "COS" THEN
        SbCos
GOTO B:
END IF
IF LEFT$(A$, 3) = "EXP" THEN
        SbExp
GOTO B:
END IF
IF LEFT$(A$, 3) = "FIX" THEN
        SbFix
GOTO B:
END IF
IF LEFT$(A$, 3) = "INT" THEN
        SbInt
GOTO B:
END IF
IF LEFT$(A$, 4) = "CINT" THEN
        SbCint
GOTO B:
END IF
IF LEFT$(A$, 3) = "LOG" THEN
        SbLog
GOTO B:
END IF
IF LEFT$(A$, 3) = "RND" THEN
        SbRnd
GOTO B:
END IF
IF LEFT$(A$, 3) = "SGN" THEN
        SbSgn
GOTO B:
END IF
IF LEFT$(A$, 3) = "SIN" THEN
        SbSin
GOTO B:
END IF
IF LEFT$(A$, 3) = "SQR" THEN
        SbSqr
GOTO B:
END IF
IF LEFT$(A$, 3) = "TAN" THEN
        SbTan
GOTO B:
END IF
IF LEFT$(A$, 4) = "CDBL" THEN
        SbCdbl
GOTO B:
END IF
IF LEFT$(A$, 4) = "CSNG" THEN
        SbCsng
GOTO B:
END IF
IF LEFT$(A$, 3) = "SEC" THEN
        SbSec
GOTO B:
END IF
IF LEFT$(A$, 3) = "CSC" THEN
        SbCsc
GOTO B:
END IF
IF LEFT$(A$, 3) = "COT" THEN
        SbCot
GOTO B:
END IF
IF LEFT$(A$, 3) = "DEG" THEN
        SbDeg
GOTO B:
END IF
IF LEFT$(A$, 3) = "RAD" THEN
        SbRad
GOTO B:
END IF
B:
END SUB

'SUPER BASIC COSH FUNCTION VERSION 1.00
FUNCTION Cosh (E)
Cosh = (EXP(E) + EXP(-E)) / 2
END FUNCTION

'SUPER BASIC COT FUNCTION VERSION 1.00
FUNCTION Cot (E)
Cot = 1 / TAN(E)
END FUNCTION

'SUPER BASIC CSC FUNCTION VERSION 1.00
FUNCTION Csc (E)
Csc = 1 / SIN(E)
END FUNCTION

'SUPER BASIC DEG FUNCTION VERSION 1.00
FUNCTION Deg (E)
Deg = E * 180 / 3.141593
END FUNCTION

'SUPER BASIC FAR2CEL FUNCTION VERSION 1.00
FUNCTION Far2Cel (E)
T1 = E
Far2Cel = 5 * (T1 - 32) / 9
END FUNCTION

FUNCTION Far2Kel (E)
T1 = E
Far2Kel = 5 * (T1 - 32) / 9 + 273.1
END FUNCTION

FUNCTION Far2Ran (E)
T1 = E
Far2Ran = T1 + 459.58
END FUNCTION

'SUPER BASIC FAR2REA FUNCTION VERSION 1.00
FUNCTION Far2Rea (E)
T1 = E
Far2Rea = 4 * (T1 - 32) / 9
END FUNCTION

SUB Intro
COLOR 15, 1
CLS
COLOR 15, 1
Box 2, 1, 24, 79
COLOR 0, 15
LOCATE 1, 1
PRINT SPACE$(80)
VIEW PRINT 2 TO 23
COLOR 0, 15
Box 8, 13, 14, 69
Center 11, "Super Advanced Super Basic Version 3.00"
Center 12, "BASICB Version 5.00"
WHILE INKEY$ = ""
WEND
VIEW PRINT
COLOR 1, 1
Box 8, 13, 14, 69
COLOR 15, 1
Box 2, 1, 24, 79
VIEW PRINT 3 TO 23
A:
Ready
GOTO A:
END SUB

'SUPER BASIC RAD FUNCTION VERSION 1.00
FUNCTION Rad (E)
Rad = E * 3.141593 / 180
END FUNCTION

SUB Ready
LOCATE , 1
PRINT "³";
LOCATE , 79
PRINT "³";
LOCATE , 2
LINE INPUT A$
Commands (A$)
END SUB

'SUPER BASIC ABS VERSION 3.00
SUB SbAbs
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ABS(E)
        END IF
END SUB

'SUPER BASIC ARCCOS VERSION 1.00
SUB SbArcCos
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcCos(E)
        END IF

END SUB

'SUPER BASIC ARCCOSH VERSION 1.00
SUB SbArcCosh
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcCosh(E)
        END IF

END SUB

'SUPER BASIC ARCCOT VERSION 1.00
SUB SbArcCot
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcCot(E)
        END IF

END SUB

'SUPER BASIC ARCCOTH VERSION 1.00
SUB SbArcCoth
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcCoth(E)
        END IF

END SUB

'SUPER BASIC ARCCSC VERSION 1.00
SUB SbArcCsc
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcCsc(E)
        END IF

END SUB

'SUPER BASIC ARCCSCH VERSION 1.00
SUB SbArcCsch
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcCsch(E)
        END IF

END SUB

'SUPER BASIC ARCSEC VERSION 1.00
SUB SbArcSec
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcSec(E)
        END IF

END SUB

'SUPER BASIC ARCSECH VERSION 1.00
SUB SbArcSech
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcSech(E)
        END IF

END SUB

'SUPER BASIC ARCSIN VERSION 1.00
SUB SbArcSin
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcSin(E)
        END IF

END SUB

'SUPER BASIC ARCSINH VERSION 1.00
SUB SbArcSinh
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcSinh(E)
        END IF

END SUB

'SUPER BASIC ARCTANH VERSION 1.00
SUB SbArcTanh
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ArcTanh(E)
        END IF

END SUB

'SUPER BASIC ATN VERSION 3.00
SUB SbAtn
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT ATN(E)
        END IF

END SUB

'SUPER BASIC CDBL VERSION 3.00
SUB SbCdbl
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT CDBL(E)
        END IF

END SUB

SUB SbCel2Far
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Cel2Far(E)
        END IF

END SUB

SUB SbCel2Rea
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Cel2Rea(E)
        END IF

END SUB

'SUPER BASIC CINT VERSION 3.00
SUB SbCint
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT CINT(E)
        END IF

END SUB

'SUPER BASIC COS VERSION 3.00
SUB SbCos
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT COS(E)
        END IF

END SUB

'SUPER BASIC COSH VERSION 1.00
SUB SbCosh
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Cosh(E)
        END IF

END SUB

'SUPER BASIC COT VERSION 1.00
SUB SbCot
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Cot(E)
        END IF

END SUB

'SUPER BASIC CSC VERSION 1.00
SUB SbCsc
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Csc(E)
        END IF

END SUB

'SUPER BASIC CSNG VERSION 3.00
SUB SbCsng
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT CSNG(E)
        END IF

END SUB

'SUPER BASIC DEG VERSION 1.00
SUB SbDeg
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Deg(E)
        END IF

END SUB

'SUPER BASIC EXP VERSION 3.00
SUB SbExp
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT EXP(E)
        END IF

END SUB

'SUPER BASIC FAR2CEL VERSION 1.00
SUB SbFar2Cel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Far2Cel(E)
        END IF

END SUB

SUB SbFar2Kel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Far2Kel(E)
        END IF

END SUB

SUB SbFar2Ran
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Far2Ran(E)
        END IF

END SUB

'SUPER BASIC FAR2REA VERSION 1.00
SUB SbFar2Rea
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Far2Rea(E)
        END IF

END SUB

'SUPER BASIC FIX VERSION 3.00
SUB SbFix
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT FIX(E)
        END IF

END SUB

'SUPER BASIC INT VERSION 3.00
SUB SbInt
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT INT(E)
        END IF

END SUB

'SUPER BASIC LOG VERSION 3.00
SUB SbLog
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT LOG(E)
        END IF

END SUB

'SUPER BASIC RAD VERSION 1.00
SUB SbRad
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Rad(E)
        END IF

END SUB

'SUPER BASIC RND VERSION 3.00
SUB SbRnd
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT RND(E)
        END IF
END SUB

'SUPER BASIC SEC VERSION 1.00
SUB SbSec
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Sec(E)
        END IF

END SUB

'SUPER BASIC SGN VERSION 3.00
SUB SbSgn
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT SGN(E)
        END IF

END SUB

'SUPER BASIC SIN VERSION 3.00
SUB SbSin
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT SIN(E)
        END IF

END SUB

'SUPER BASIC SINH VERSION 1.00
SUB SbSinh
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Sinh(E)
        END IF

END SUB

'SUPER BASIC SQR VERSION 3.00
SUB SbSqr
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT SQR(E)
        END IF

END SUB

'SUPER BASIC TAN VERSION 3.00
SUB SbTan
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT TAN(E)
        END IF

END SUB

'SUPER BASIC TANH VERSION 1.00
SUB SbTanh
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 79
                PRINT "³";
                LOCATE , 2
                PRINT Tanh(E)
        END IF

END SUB

'SUPER BASIC SEC FUNCTION VERSION 1.00
FUNCTION Sec (E)
Sec = 1 / COS(E)
END FUNCTION

'SUPER BASIC SINH FUNCTION VERSION 1.00
FUNCTION Sinh (E)
Sinh = (EXP(E) - EXP(-E)) / 2
END FUNCTION

'SUPER BASIC TANH FUNCTION VERSION 1.00
FUNCTION Tanh (E)
Tanh = (EXP(E) - EXP(-E)) / (EXP(E) + EXP(-E))
END FUNCTION

