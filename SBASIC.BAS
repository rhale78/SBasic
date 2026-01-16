DECLARE SUB RUNTIME ()
DECLARE SUB ABOLUTE ()
DECLARE SUB ACC ()
DECLARE SUB ACCEPT ()
DECLARE SUB ACKNOWLEDGE ()
DECLARE SUB ADD ()
DECLARE SUB ADVANCE ()
DECLARE SUB ALARM ()
DECLARE SUB ALERT ()
DECLARE SUB ALLOW ()
DECLARE SUB ASLEEP ()
DECLARE SUB AUTO ()
DECLARE SUB BELL ()
DECLARE SUB BEP ()
DECLARE SUB BLANK ()
DECLARE SUB BLINK ()
DECLARE SUB BOX ()
DECLARE SUB CLR ()
DECLARE SUB CLSE ()
DECLARE SUB TMR ()
DECLARE SUB SUBTRACT ()
DECLARE SUB DIVIDE ()
DECLARE SUB MULTIPLY ()
DECLARE SUB MODULATION ()
DECLARE SUB INTDIVIDE ()
DECLARE SUB POWER ()
DECLARE SUB RN ()
DECLARE SUB LST ()
DECLARE SUB CS ()
DECLARE SUB CRCLE ()
DECLARE SUB DTE ()
DECLARE SUB DAT ()
DECLARE SUB DRW ()
DECLARE SUB ERO ()
DECLARE SUB FLS ()
DECLARE SUB DIR ()
DECLARE SUB MEMORY ()
DECLARE SUB GTO ()
DECLARE SUB INPT ()
DECLARE SUB KY ()
DECLARE SUB LNE ()
DECLARE SUB PEK ()
DECLARE SUB PLY ()
DECLARE SUB PKE ()
DECLARE SUB PRNT ()
DECLARE SUB RAN ()
DECLARE SUB RST ()
DECLARE SUB SND ()
DECLARE SUB STEM ()
DECLARE SUB WDTH ()
DECLARE SUB TME ()
DECLARE SUB OT ()
DECLARE SUB PNT ()
DECLARE SUB PRSET ()
DECLARE SUB PST ()
DECLARE SUB NW ()
DECLARE SUB SVE ()
DECLARE SUB SCRN ()
DECLARE SUB LAD ()
DECLARE SUB USER ()
DECLARE SUB PI ()
DECLARE SUB EXPAND ()
DECLARE SUB HELP ()
DECLARE SUB EMERGSTOP ()
DECLARE SUB ADVANCED ()
DECLARE SUB DICTIONARY ()
DECLARE SUB VLUME ()
DECLARE SUB HIDESURFACE ()
DECLARE SUB COMMANDS ()
DECLARE SUB GRAPHICS ()
DECLARE SUB SBSOUND ()
DECLARE SUB READY ()
COMMON SHARED A$, A$(), VOLUME, SCREENMODE, KOLOR, VOLUMEERROR, VAR(), VAR$(), Z.CHR(), LN
DIM A$(255), VAR(255), VAR$(255), Z.CHR(9)
CLS
ON ERROR GOTO C:
SCREEN 0, 0, 0, 0
SCREENMODE = 0
COLOR 15
KOLOR = 15
PRINT "Super Advanced Super Basic Version 1.00"
PRINT "Super Advanced Graphic Basic Version 1.00"
PRINT "Super Advanced Sound Basic Version 1.00"
PRINT "BASICB Version 2.00"
PRINT LTRIM$(STR$(FRE(0))); " bytes of free memory available."
PRINT "Current Volume is set to"; VOLUME
PRINT "Current Screen Mode is set to"; SCREENMODE
PRINT "Current Color is set to"; KOLOR
1 READY
GOTO 1
C:
RUNTIME
RESUME NEXT

SUB ABOLUTE
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
SELECT CASE E$
CASE "A" TO "Z"
        PRINT ABS(VAR(ASC(MID$(A$, A + 1, LEN(A$)))))
CASE ELSE
E = VAL(E$)
PRINT ABS(E)
END SELECT
END SUB

SUB ACC
        A = INSTR(A$, " ")
        PASSWORD$ = MID$(A$, A + 1, LEN(A$))
END SUB

SUB ACCEPT
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ = PASSWORD$ THEN
                PRINT "Access Accepted"
                AC = -1
                ELSE
                PRINT "Access Denied"
        END IF
END SUB

SUB ACKNOWLEDGE
        A = INSTR(A$, " ")
        IF A = 0 THEN
                QUOTE$ = "Press any key to continue."
                ELSE QUOTE$ = MID$(A$, A + 1, LEN(A$))
                END IF
        PRINT QUOTE$
        DO WHILE INKEY$ = ""
        LOOP
END SUB

SUB ADD
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q + W
END SUB

SUB ADVANCE
A = INSTR(A$, " ")
E = VAL(MID$(A$, A + 1, LEN(A$)))
FOR J = 1 TO E
PRINT
NEXT J
END SUB

SUB ADVANCED
IF LEFT$(A$, 5) = "TIMER" THEN
        TMR
GOTO 30
END IF
IF LEFT$(A$, 8) = "ABSOLUTE" THEN
        ABOLUTE
GOTO 30
END IF
IF LEFT$(A$, 6) = "ACCEPT" THEN
        ACCEPT
GOTO 30
END IF
IF LEFT$(A$, 6) = "ACCESS" THEN
        ACC
GOTO 30
END IF
IF LEFT$(A$, 11) = "ACKNOWLEDGE" THEN
        ACKNOWLEDGE
GOTO 30
END IF
IF LEFT$(A$, 3) = "ADD" THEN
        ADD
GOTO 30
END IF
IF LEFT$(A$, 8) = "SUBTRACT" THEN
        SUBTRACT
GOTO 30
END IF
IF LEFT$(A$, 6) = "DIVIDE" THEN
        DIVIDE
GOTO 30
END IF
IF LEFT$(A$, 8) = "MULTIPLY" THEN
        MULTIPLY
GOTO 30
END IF
IF LEFT$(A$, 10) = "MODULATION" THEN
        MODULATION
GOTO 30
END IF
IF LEFT$(A$, 10) = "INT DIVIDE" THEN
        INTDIVIDE
GOTO 30
END IF
IF LEFT$(A$, 5) = "POWER" THEN
        POWER
GOTO 30
END IF
IF LEFT$(A$, 7) = "ADVANCE" THEN
        ADVANCE
GOTO 30
END IF
IF LEFT$(A$, 4) = "BELL" THEN
        BELL
GOTO 30
END IF
IF LEFT$(A$, 5) = "BLANK" THEN
        BLANK
GOTO 30
END IF
IF LEFT$(A$, 5) = "BLINK" THEN
        BLINK
GOTO 30
END IF
IF LEFT$(A$, 5) = "ALARM" THEN
        ALARM
GOTO 30
END IF
IF LEFT$(A$, 5) = "ALERT" THEN
        ALERT
GOTO 30
END IF
IF LEFT$(A$, 5) = "ALLOW" THEN
        ALLOW
GOTO 30
END IF
IF LEFT$(A$, 6) = "ASLEEP" THEN
        ASLEEP
GOTO 30
END IF
IF LEFT$(A$, 4) = "AUTO" THEN
        AUTO
GOTO 30
END IF
IF LEFT$(A$, 3) = "RUN" THEN
        RN
GOTO 30
END IF
IF LEFT$(A$, 4) = "LIST" THEN
        LST
GOTO 30
END IF
IF LEFT$(A$, 10) = "BACKGROUND" THEN
GOTO 30
END IF
IF LEFT$(A$, 5) = "CLOSE" THEN
        CLSE
GOTO 30
END IF
IF LEFT$(A$, 3) = "CLS" THEN
        CS
GOTO 30
END IF
IF LEFT$(A$, 4) = "BEEP" THEN
        BEP
GOTO 30
END IF
IF LEFT$(A$, 6) = "CIRCLE" THEN
        CRCLE
GOTO 30
END IF
IF LEFT$(A$, 5) = "COLOR" THEN
        CLR
GOTO 30
END IF
IF LEFT$(A$, 4) = "DATE" THEN
        DTE
GOTO 30
END IF
IF LEFT$(A$, 5) = "DATE$" THEN
        DAT
GOTO 30
END IF
IF LEFT$(A$, 4) = "DRAW" THEN
        DRW
GOTO 30
END IF
IF LEFT$(A$, 5) = "ERROR" THEN
        ERO
GOTO 30
END IF
IF LEFT$(A$, 5) = "FILES" THEN
        FLS
GOTO 30
END IF
IF LEFT$(A$, 3) = "DIR" THEN
        DIR
GOTO 30
END IF
IF LEFT$(A$, 9) = "DIRECTORY" THEN
        DIR
GOTO 30
END IF
IF LEFT$(A$, 3) = "MEM" THEN
        MEMORY
GOTO 30
END IF
IF LEFT$(A$, 6) = "MEMORY" THEN
        PRINT FRE(0)
GOTO 30
END IF
IF LEFT$(A$, 4) = "GOTO" THEN
        GTO
GOTO 30
END IF
IF LEFT$(A$, 5) = "INPUT" THEN
        INPT
GOTO 30
END IF
IF LEFT$(A$, 3) = "KEY" THEN
        KY
GOTO 30
END IF
IF LEFT$(A$, 4) = "LINE" THEN
        LNE
GOTO 30
END IF
IF LEFT$(A$, 4) = "PEEK" THEN
        PEK
GOTO 30
END IF
IF LEFT$(A$, 4) = "PLAY" THEN
        PLY
GOTO 30
END IF
IF LEFT$(A$, 4) = "POKE" THEN
        PKE
GOTO 30
END IF
IF LEFT$(A$, 5) = "PRINT" THEN
        PRNT
GOTO 30
END IF
IF LEFT$(A$, 1) = "?" THEN
        PRNT
GOTO 30
END IF
IF LEFT$(A$, 9) = "RANDOMIZE" THEN
        RAN
GOTO 30
END IF
IF LEFT$(A$, 3) = "REM" THEN
GOTO 30
END IF
IF LEFT$(A$, 1) = "'" THEN
GOTO 30
END IF
IF LEFT$(A$, 5) = "RESET" THEN
        RST
GOTO 30
END IF
IF LEFT$(A$, 5) = "SOUND" THEN
        SND
GOTO 30
END IF
IF LEFT$(A$, 6) = "SYSTEM" THEN
        STEM
GOTO 30
END IF
IF LEFT$(A$, 5) = "WIDTH" THEN
        WDTH
GOTO 30
END IF
IF LEFT$(A$, 5) = "WRITE" THEN
        PRNT
GOTO 30
END IF
IF LEFT$(A$, 5) = "TIME$" THEN
        TME
GOTO 30
END IF
IF LEFT$(A$, 4) = "TIME" THEN
        TME
GOTO 30
END IF
IF LEFT$(A$, 3) = "OUT" THEN
        OT
GOTO 30
END IF
IF LEFT$(A$, 5) = "PAINT" THEN
        PNT
GOTO 30
END IF
IF LEFT$(A$, 6) = "PRESET" THEN
        PRSET
GOTO 30
END IF
IF LEFT$(A$, 4) = "PSET" THEN
        PST
GOTO 30
END IF
IF LEFT$(A$, 3) = "BOX" THEN
        BOX
GOTO 30
END IF
IF LEFT$(A$, 3) = "NEW" THEN
        NW
GOTO 30
END IF
IF LEFT$(A$, 4) = "SAVE" THEN
        SVE
GOTO 30
END IF
IF LEFT$(A$, 6) = "SCREEN" THEN
        SCRN
GOTO 30
END IF
IF LEFT$(A$, 4) = "LOAD" THEN
        LAD
GOTO 30
END IF
IF LEFT$(A$, 4) = "USER" THEN
        USER
GOTO 30
END IF
IF LEFT$(A$, 2) = "PI" THEN
        PI
GOTO 30
END IF
IF LEFT$(A$, 6) = "EXPAND" THEN
        EXPAND
GOTO 30
END IF
IF LEFT$(A$, 4) = "HELP" THEN
        HELP
END IF
IF LEFT$(A$, 14) = "EMERGENCY STOP" THEN
        EMERGSTOP
GOTO 30
END IF
IF A$ = "" THEN
        GOTO 30
END IF
SHELL A$
30 END SUB

SUB ALARM
        A = INSTR(A$, " ")
         B = INSTR(A$, ",")
        FREQ = VAL(MID$(A$, A + 1, B - 1))
        DUR = VAL(MID$(A$, B + 1, LEN(A$)))
        SOUND FREQ, DUR
END SUB

SUB ALERT
        A = INSTR(A$, " ")
         IF A = 0 THEN
                QUOTE$ = "Alert !!!"
                ELSE QUOTE$ = MID$(A$, A + 1, LEN(A$))
                END IF
        IF MODE = 0 THEN
                COLOR 20
                PRINT QUOTE$
        END IF
        DO WHILE INKEY$ = ""
        SOUND 400, .09
        LOOP
        COLOR 15
END SUB

SUB ALLOW
        A = INSTR(A$, " ")
        C = INSTR(A$, "=")
         E$ = MID$(A$, A + 1, LEN(A$))
        B = INSTR(A$, "$")
        R = ASC(E$)
        D$ = MID$(A$, C + 1, LEN(A$))
        IF B = 0 THEN
                VAR(R) = VAL(D$)
        ELSE
                VAR$(R) = D$
        END IF
END SUB

SUB ASLEEP
        A = INSTR(A$, " ")
        E = VAL(MID$(A$, A + 1, LEN(A$)))
        SLEEP E
END SUB

SUB AUTO
        DO
        LN = LN + 1
        PRINT LTRIM$(STR$(LN * 10)); " ";
        LINE INPUT A$(LN)
                LOOP UNTIL A$(LN) = ""
        LN = LN - 1
END SUB

SUB BACKGROUND
        IF MODE > 0 THEN
                A = INSTR(A$, " ")
                E$ = MID$(A$, A + 1, LEN(A$))
                SELECT CASE E$
                        CASE "YELLOW"
                                COLOR 14
                        CASE "BLACK"
                                COLOR 0
                        CASE "BLUE"
                                COLOR 1
                        CASE "GREEN"
                                COLOR 2
                        CASE "CYAN"
                                COLOR 3
                        CASE "RED"
                                COLOR 4
                        CASE "MAGENTA"
                                COLOR 5
                        CASE "BROWN"
                                COLOR 6
                        CASE "WHITE"
                                COLOR 7
                        CASE "GREY"
                                COLOR 8
                        CASE "LIGHTBLUE"
                                COLOR 9
                        CASE "LIGHTGREEN"
                                COLOR 10
                        CASE "LIGHTCYAN"
                                COLOR 11
                        CASE "LIGHTRED"
                                COLOR 12
                        CASE "LIGHT MAGENTA"
                                COLOR 13
                        CASE "BOLD WHITE"
                                COLOR 15
                        CASE "1" TO "15"
                                COLOR VAL(E$)
                        CASE "A" TO "Z"
                                COLOR VAR(ASC(MID$(A$, A + 1, LEN(A$))))
                END SELECT
ELSE
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        SELECT CASE E$
                CASE "YELLOW"
                        COLOR , 14
                CASE "BLACK"
                        COLOR , 0
                CASE "BLUE"
                        COLOR , 1
                CASE "GREEN"
                        COLOR , 2
                CASE "CYAN"
                        COLOR , 3
                CASE "RED"
                        COLOR , 4
                CASE "MAGENTA"
                        COLOR , 5
                CASE "BROWN"
                        COLOR , 6
                CASE "WHITE"
                        COLOR , 7
                CASE "GREY"
                        COLOR , 8
                CASE "LIGHTBLUE"
                        COLOR , 9
                CASE "LIGHTGREEN"
                        COLOR , 10
                CASE "LIGHTCYAN"
                        COLOR , 11
                CASE "LIGHTRED"
                        COLOR , 12
                CASE "LIGHT MAGENTA"
                        COLOR , 13
                CASE "BOLD WHITE"
                        COLOR , 15
                CASE "1" TO "15"
                        COLOR , VAL(E$)
                CASE "A" TO "Z"
                        COLOR VAR(ASC(MID$(A$, A + 1, LEN(A$))))
                END SELECT
END IF
END SUB

SUB BELL
BEEP
END SUB

SUB BEP
BEEP
END SUB

SUB BLANK
CLS
END SUB

SUB BLINK
                A = INSTR(A$, " ")
                E$ = MID$(A$, A + 1, LEN(A$))
                SELECT CASE E$
                        CASE "YELLOW"
                                COLOR 14 + 16
                        CASE "BLACK"
                                COLOR 0 + 16
                        CASE "BLUE"
                                COLOR 1 + 16
                        CASE "GREEN"
                                COLOR 2 + 16
                        CASE "CYAN"
                                COLOR 3 + 16
                        CASE "RED"
                                COLOR 4 + 16
                        CASE "MAGENTA"
                                COLOR 5 + 16
                        CASE "BROWN"
                                COLOR 6 + 16
                        CASE "WHITE"
                                COLOR 7 + 16
                        CASE "GREY"
                                COLOR 8 + 16
                        CASE "LIGHTBLUE"
                                COLOR 9 + 16
                        CASE "LIGHTGREEN"
                                COLOR 10 + 16
                        CASE "LIGHTCYAN"
                                COLOR 11 + 16
                        CASE "LIGHTRED"
                                COLOR 12 + 16
                        CASE "LIGHT MAGENTA"
                                COLOR 13 + 16
                        CASE "BOLD WHITE"
                                COLOR 15 + 16
                        CASE "1" TO "15"
                                COLOR VAL(E$) + 16
                        CASE "A" TO "Z"
                                COLOR VAR(ASC(MID$(A$, A + 1, LEN(A$))))
                END SELECT
END SUB

SUB BOX
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, "-")
        D = INSTR(A$, ",")
        IF A > C THEN
                X2 = VAL(MID$(A$, A + 1, D - 1))
                Y2 = VAL(MID$(A$, D + 1, B - 1))
                C = INSTR(D + 1, A$, ",")
                C = VAL(MID$(A$, C + 1, LEN(A$)))
                LINE -(X2, Y2), C, B
        GOTO 57
        END IF
        A2 = INSTR(C, A$, "(")
        B2 = INSTR(C, A$, ")")
        D2 = INSTR(C, A$, ",")
        X1 = VAL(MID$(A$, A + 1, D - 1))
        Y1 = VAL(MID$(A$, D + 1, B - 1))
        X2 = VAL(MID$(A$, A2 + 1, D2 - 1))
        Y2 = VAL(MID$(A$, D2 + 1, B2 - 1))
        C = INSTR(D2 + 1, A$, ",")
        C = VAL(MID$(A$, C + 1, LEN(A$)))
        LINE (X1, Y1)-(X2, Y2), C, B
57 END SUB

SUB CLR
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF MODE > 0 THEN
                SELECT CASE E$
                        CASE "YELLOW"
                                COLOR , 14
                        CASE "BLACK"
                                COLOR , 0
                        CASE "BLUE"
                                COLOR , 1
                        CASE "GREEN"
                                COLOR , 2
                        CASE "CYAN"
                                COLOR , 3
                        CASE "RED"
                                COLOR , 4
                        CASE "MAGENTA"
                                COLOR , 5
                        CASE "BROWN"
                                COLOR , 6
                        CASE "WHITE"
                                COLOR , 7
                        CASE "GRAY"
                                COLOR , 8
                        CASE "LIGHT BLUE"
                                COLOR , 9
                        CASE "LIGHT GREEN"
                                COLOR , 10
                        CASE "LIGHT CYAN"
                                COLOR , 11
                        CASE "LIGHT RED"
                                COLOR , 12
                        CASE "LIGHT MAGENTA"
                                COLOR , 13
                        CASE "BOLD WHITE"
                                COLOR , 15
                        CASE "1" TO "15"
                                COLOR , VAL(E$)
                        CASE "A" TO "Z"
                                COLOR , VAR(ASC(MID$(A$, A + 1, LEN(A$))))
                        END SELECT
ELSE
        E$ = MID$(A$, A + 1, LEN(A$))
        SELECT CASE E$
                CASE "YELLOW"
                        COLOR 14
                CASE "BLACK"
                        COLOR 0
                CASE "BLUE"
                        COLOR 1
                CASE "GREEN"
                        COLOR 2
                CASE "CYAN"
                        COLOR 3
                CASE "RED"
                        COLOR 4
                CASE "MAGENTA"
                        COLOR 5
                CASE "BROWN"
                        COLOR 6
                CASE "WHITE"
                        COLOR 7
                CASE "GRAY"
                        COLOR 8
                CASE "LIGHT BLUE"
                        COLOR 9
                CASE "LIGHT GREEN"
                        COLOR 10
                CASE "LIGHT CYAN"
                        COLOR 11
                CASE "LIGHT RED"
                        COLOR 12
                CASE "LIGHT MAGENTA"
                        COLOR 13
                CASE "BOLD WHITE"
                        COLOR 15
                CASE "1" TO "15"
                        COLOR VAL(E$)
                CASE "A" TO "Z"
                        COLOR VAR(ASC(MID$(A$, A + 1, LEN(A$))))
        END SELECT
END IF
END SUB

SUB CLSE
CLOSE
END SUB

SUB COMMANDS
IF LEFT$(A$, 3) = "CLS" THEN
        CLS
        GOTO B:
END IF
IF LEFT$(A$, 8) = "ABSOLUTE" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT ABS(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "ABS" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT ABS(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "ASC" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        PRINT ASC(E$)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "ATN" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT ATN(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "CDBL" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT CDBL(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "CHR$" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT CHR$(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "CINT" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT CINT(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "COS" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT COS(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "CSNG" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT CSNG(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "EXP" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT EXP(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "FIX" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT FIX(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "FRE" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT FRE(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "HEX$" THEN
        A = INSTR(A$, "HEX$")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT HEX$(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "INP" THEN
        A = INSTR(A$, "INP")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT INP(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "LEN" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        PRINT LEN(E$)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "LOG" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT LOG(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "OCT$" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT OCT$(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "PEEK" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT PEEK(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "PEN" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT PEN(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "PLAY" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT PLAY(E)
        GOTO B:
END IF
IF LEFT$(A$, 5) = "POINT" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT POINT(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "POS" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT POS(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "RND" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT RND(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "SGN" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT SGN(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "SIN" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT SIN(E)
        GOTO B:
END IF
IF LEFT$(A$, 6) = "SPACE$" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT SPACE$(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "SPC" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT SPC(E);
        GOTO B:
END IF
IF LEFT$(A$, 3) = "SQR" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT SQR(E)
        GOTO B:
END IF
IF LEFT$(A$, 5) = "STICK" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT STICK(E)
        GOTO B:
END IF
IF LEFT$(A$, 4) = "STR$" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT STR$(E)
        GOTO B:
END IF
IF LEFT$(A$, 5) = "STRIG" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT STRIG(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "TAB" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT TAB(E);
        GOTO B:
END IF
IF LEFT$(A$, 3) = "TAN" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT TAN(E)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "VAL" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        PRINT VAL(E$)
        GOTO B:
END IF
IF LEFT$(A$, 7) = "VARPTR$" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        PRINT VARPTR$(E$)
        GOTO B:
END IF
IF LEFT$(A$, 3) = "ADD" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO B:
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                PRINT Q + W
        END IF
        GOTO B:
END IF
IF LEFT$(A$, 8) = "SUBTRACT" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO B:
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                PRINT Q - W
        END IF
        GOTO B:
END IF
IF LEFT$(A$, 8) = "MULTIPLY" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO B:
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                PRINT Q * W
        END IF
        GOTO B:
END IF
IF LEFT$(A$, 6) = "DIVIDE" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                SBERROR = -1
                GOTO B:
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                        IF Q = 0 OR W = 0 THEN
                                PRINT "Division By Zero Error."
                                SBERROR = -1
                        END IF
                        IF SBERROR = -1 THEN
                                GOTO B:
                        END IF
                PRINT Q / W
        END IF
        GOTO B:
END IF
IF LEFT$(A$, 3) = "MOD" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO B:
        ELSE
                Q$ = MID$(A$, A + 1, B - 1)
                W$ = MID$(A$, B + 1, LEN(A$))
                Q = VAL(Q$)
                W = VAL(W$)
                PRINT Q MOD W
        END IF
        GOTO B:
END IF
IF LEFT$(A$, 10) = "INT DIVIDE" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO B:
        ELSE
                Q$ = MID$(A$, A + 1, B - 1)
                W$ = MID$(A$, B + 1, LEN(A$))
                Q = VAL(Q$)
                W = VAL(W$)
                PRINT Q \ W
        END IF
        GOTO B:
END IF
IF LEFT$(A$, 3) = "INT" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT INT(E)
        GOTO B:
END IF
IF LEFT$(A$, 5) = "POWER" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO B:
        ELSE
                Q$ = MID$(A$, A + 1, B - 1)
                W$ = MID$(A$, B + 1, LEN(A$))
                Q = VAL(Q$)
                W = VAL(W$)
                PRINT Q ^ W
        END IF
        GOTO B:
END IF
DICTIONARY
ADVANCED
GRAPHICS
SBSOUND
B:
END SUB

SUB CRCLE
        A = INSTR(A$, "(")
        B = INSTR(A$, ",")
        C = INSTR(A$, ")")
        XC = VAL(MID$(A$, A + 1, B - 1))
        YC = VAL(MID$(A$, B + 1, C - 1))
        A = INSTR(C, A$, ",")
        B = INSTR(A + 1, A$, ",")
        C = B
        IF B = 0 THEN
                B = LEN(A$) + 1
                ER = -1
        END IF
        RA = VAL(MID$(A$, A + 1, B - 1))
        IF ER = -1 THEN
                CIRCLE (XC, YC), RA
        END IF
END SUB

SUB CS
CLS
END SUB

SUB DAT
        A = INSTR(A$, " ")
        IF A = 0 THEN
                PRINT DATE$
        ELSE
                E$ = MID$(A$, A, LEN(A$))
                DATE$ = E$
        END IF
END SUB

SUB DICTIONARY
IF A$ = "AAAI" THEN PRINT "AMERICAN ASSOCIATION FOR ARTIFICIAL INTELLIGENCE.ORGANIZATION FORMED IN 1981 TO FURTHER THE WORK IN AI"
IF A$ = "ABA" THEN PRINT "AMERICAN BAR ASSOCIATION"
IF A$ = "ABACUS" THEN PRINT "PROGRAMMING LANGUAGE"
IF A$ = "ABET" THEN PRINT "ACCREDITATION BOARD FOR ENGINEERING & TECHNOLOGY.  ORGANIZATION RESPONSIBLE FOR ACCREDITATION OF MFG. RELATED CURRICULUM"
IF A$ = "ABM" THEN PRINT "ANTI-BALLISTIC MISSILE.  MISSILE DEFENSE CONCEPT"
IF A$ = "AC" THEN PRINT "AIR CONDITIONING.  5 HP/TON A.C.= 12K BTU/HR.= 3.52 KW"
IF A$ = "ACC" THEN PRINT "ACCELERATION.  INCREASE IN VELOCITY OF AN N/C MACHINE TOOL SERVO FEED"
IF A$ = "ACLU" THEN PRINT "AMERICAN CIVIL LIBERTIES UNION"
IF A$ = "ACM" THEN PRINT "ASSOCIATION FOR COMPUTER MACHINERY"
IF A$ = "ADA" THEN PRINT "COMPUTER LANGUAGE USED BY MILITARY FOR PROGRAMMING MISSLES"
IF A$ = "ADAPT" THEN PRINT "PROCESSOR LANGUAGE"
IF A$ = "ADC" THEN PRINT "ANALOG TO DIGITAL CONVERTER"
IF A$ = "ADCAP" THEN PRINT "ADVANCED CAPABILITIES"
IF A$ = "ADF" THEN PRINT "AUTOMATIC DESCRIPTION FILES.  CONFIGURATION FILES FOR PS/2 FAMILY"
IF A$ = "ADIH" THEN PRINT "ANALOG DISPLAY INTERFACE HARDWARE"
IF A$ = "ADRS" THEN PRINT "A DEPARTMENTAL REPORTING SYSTEM. PROCESSOR FOR DATA- BG PACKAGE IS BUSINESS GRAPHICS."
IF A$ = "AFA" THEN PRINT "ADVANCED FUNCTION ARRAY.  ULTRA-HIGH RESOLUTION GRAPHICS STANDARD FOR NEW IBM MONITOR"
IF A$ = "AFE" THEN PRINT "AUTHORIZATION FOR EXPENDITURE"
IF A$ = "AFP" THEN PRINT "ADVANCED FUNCTION PRINTING.   IBM PRINTING CAPABILITY WITH VARIABLE FONT, SIZE, DARKNESS, & SPACING"
IF A$ = "AFP/SME" THEN PRINT "ASSOCIATION FOR FINISHING PROCESS.  SME AFFILIATE SPECIALIZING IN FINISHING PROCESSES TECHNOLOGY"
IF A$ = "AGVS" THEN PRINT "AUTOMATIC GUIDED VEHICLES SYSTEM.   UNMANNED & AUTO-GUIDED WORKPIECE CARRIERS USED IN FMS"
IF A$ = "AI" THEN PRINT "ARTIFICIAL INTELLIGENCE.   THE USE OF HUMAN KNOWLEDGE BY COMPUTERS FOR PROBLEM SOLVING"
IF A$ = "AIM" THEN PRINT "AUTOMATIC IDENTIFICATION MANUFACTURERS.   A NOT-FOR-PROFIT TRADE ASSOCIATION"
IF A$ = "AISP" THEN PRINT "ASSOCIATION FOR INFORMATION SYSTEMS PROFESSIONALS"
IF A$ = "AIX" THEN PRINT "ADVANCED INTERACTIVE EXECUTIVE.  IBM UNIX-BASED OPERATING SYSTEM FOR RT PC"
IF A$ = "ALGOL" THEN PRINT "PROGRAMMING LANGUAGE"
IF A$ = "ALU" THEN PRINT "ARITHMETIC LOGIC UNIT.  ELECTRONIC COMPUTER CIRCUITRY WHICH PERFORMS ARITHMETIC OPERATIONS"
IF A$ = "AML" THEN PRINT "A MANUFACTURING LANGUAGE.  IBM DEVELOPED LANGUAGE FOR ROBOTICS APPLICATIONS"
IF A$ = "AMMSS" THEN PRINT "ADVANCED MULTI-MISSION SENSOR SYSTEM.  LOCKHEED'S NEXT GENERATION CARRIER-BASED TACTICAL SUPPORT AIRCRAFT"
IF A$ = "AMS" THEN PRINT "AMERICAN METAL SOCIETY. ORGANIZATION RESPONSIBLE FOR AMS SPECS."
IF A$ = "AMTDA" THEN PRINT "AMERICAN MACHINE TOOL DISTRIBUTORS' ASSOCIATION"
IF A$ = "ANMC" THEN PRINT "AMERICAN NATIONAL METRIC COUNCIL.   ORGANIZATION EST. IN 1973 TO ASSIST WITH INDUSTRIAL METRICIZATION"
IF A$ = "ANSI" THEN PRINT "AMERICAN NATIONAL STANDARDS INSTITUTE"
IF A$ = "APA" THEN PRINT "ALL POINT ADDRESSABLE. INDIVIDUAL PEL DISPLAY & MANIPULATION BIT MAPPED GRAPHICS"
IF A$ = "APD" THEN PRINT "ADVANCED PRODUCT DEALER.   DEALER/DISTRIBUTOR OF NEW IBM PERSONAL SYSTEM/2 EQUIPMENT"
IF A$ = "APF" THEN PRINT "APPLICATION PROGRAM FUNCTION. IBM INTERFACE COMPONENT TO PACS APPLICATION PROGRAMS"
IF A$ = "API" THEN PRINT "APPLICATION PROGRAM INTERFACE.   A MAJOR SUBSET OF SRPI"
IF A$ = "APIC/CS" THEN PRINT "APPLICATION PROG.INTERFACES/COMMUN. SERVICES.   IBM SERVICE"
IF A$ = "APICS" THEN PRINT "AUTOMATED PRODUCTION AND INVENTORY CTRL. SYSTEM"
IF A$ = "APL" THEN PRINT "A PROGRAMMING LANGUAGE . GEN. PURPOSE LANGUAGE FOR DP WORK, SCIENTIFIC COMP., & TEACHING MATH"
IF A$ = "APMES" THEN PRINT "ADVANCED PRODUCT MFG. & ENGINEERING STAFF"
IF A$ = "APP" THEN PRINT "AUTOMATIC PROCESS PLANNING.   SELF-GENERATING PROCESS PLANNING SOFTWARE SYSTEM"
IF A$ = "APPC" THEN PRINT "ADVANCED PROGRAM-TO-PROGRAM COMMUNICATIONS.  IBM PROTOCOL FOR PEER COMMUNICATIONS BETWEEN DIVERSE SYSTEMS"
IF A$ = "APPN" THEN PRINT "ADVANCED PEER-TO-PEER NETWORK.   IBM SOFTWARE USED TO LINK SYSTEM/36'S W/O MAINFRAME VIA SNA NETWORK"
IF A$ = "APSE" THEN PRINT "APPLICATION PROGRAM SUPPORT ENVIRONMENT"
IF A$ = "APT-AC" THEN PRINT "AUTOMATIC PROGRAMMING TOOL-ADVANCED CONTOURING . POPULAR NUMERICAL CONTROL PROGRAMMING LANGUAGE"
IF A$ = "AQMD" THEN PRINT "AIR QUALITY MANAGEMENT DISTRICT"
IF A$ = "ARELEM" THEN PRINT "ARITHMETIC ELEMENT.  PART OF GEN. POST PROCESSOR WHICH CALCULATES CUTTER LOCATION"
IF A$ = "ARPA" THEN PRINT "ADVANCED RESEARCH PROJECTS AGENCY.  D.O.D. AGENCY DOING RESEARCH IN A.I., SUPERCOMPUTERS, AEROSPACE PLANE"
IF A$ = "ARPANET" THEN PRINT "ADVANCED RESEARCH PROJECTS AGENCY.  1ST PACKET SWITCHING NETWORK DEVELOPED FOR D.O.D."
IF A$ = "ASCII" THEN PRINT "AMERICAN STD. CODE FOR INFORMATION INTERCHANGE. NC TAPE PUNCH FORMAT W/ ODD PARITY(ODD NUMBER OF HOLES PER TAPE ROW)"
IF A$ = "ASIC" THEN PRINT "APPLICATION-SPECIFIC INTEGRATED CIRCUITS. ROM CHIPS DEDICATED TO PRE-DEFINED APPLICATIONS"
IF A$ = "ASM" THEN PRINT "AMERICAN SOCIETY OF METALS"
IF A$ = "ASM" THEN PRINT "ASSOCIATION FOR SYSTEMS MANAGEMENT"
IF A$ = "ASP" THEN PRINT "PROPOSED ONE-MAN STEALTH HELICOPTER"
IF A$ = "ASRS" THEN PRINT "AUTOMATIC STORAGE & RETRIEVAL SYSTEM. COMPUTER CONTROLLED, HIGH DENSITY, RAPID RETRIEVAL,  STORAGE SYSTEM"
IF A$ = "ASSEMBLER" THEN PRINT "PROGRAMMING LANGUAGE"
IF A$ = "ASTM" THEN PRINT "AMERICAN SOCIETY OF TESTING AND METHODS.  ORGANIZATION RESPONSIBLE FOR ASTM SPECS."
IF A$ = "ATC" THEN PRINT "AUTOMATIC TOOL CHANGER"
IF A$ = "ATF" THEN PRINT "ADVANCED TECHNOLOGY FIGHTER.  AIR FORCE'S AIR SUPERIORITY FIGHTER FOR 1990'S"
IF A$ = "ATMS" THEN PRINT "ADVANCED TEXT MANAGEMENT SYSTEM. INTERACTIVE EDITOR FOR CICS."
IF A$ = "BA" THEN PRINT "BACHELOR OF ARTS . COLLEGE/UNIVERSITY ART DEGREE- TYPICALLY 4 YEARS"
IF A$ = "BASIC" THEN PRINT "BEGINNER'S ALL-PURPOSE SYMBOLIC INSTRUCTION CODE.  A POPULAR, PROBLEM SOLVING, ALGEBRA-LIKE, PROGRAMMING LANGUAGE"
IF A$ = "BAUD" THEN PRINT "OPERATIONAL CYCLE PER SECOND IN A COMMUNICATION NETWORK"
IF A$ = "BCD" THEN PRINT "BINARY CODED DECIMAL.  SYSTEM OF COMBINING BINARY BITS IN ROW TO DESIGNATE NUMERALS/LETTERS"
IF A$ = "BCL" THEN PRINT "BINARY CUTTER LOCATION (CLDATA) EIA RS-494 FORMAT"
IF A$ = "BERT" THEN PRINT "BIT ERROR RATE TESTER"
IF A$ = "BIOS" THEN PRINT "BASIC INPUT OUTPUT SYSTEM. PC I/O FUNCTION"
IF A$ = "BISYNCH" THEN PRINT "BISYNCHRONOUS. COMMUNICATION PROTOCOL"
IF A$ = "BIT" THEN PRINT "BINARY DIGIT.  SINGLE DIGIT OF BINARY NUMBER, EITHER A ONE OR A ZERO"
IF A$ = "BIT" THEN PRINT "BUILT IN TESTING. CONCEPT OF BUILT-IN SELF TEST CIRCUITRY"
IF A$ = "BMW" THEN PRINT "BAVARIAN MOTOR WORKS"
IF A$ = "BOB" THEN PRINT "BREAK OUT BOX"
IF A$ = "BPS" THEN PRINT "BITS PER SECOND.  COMPUTER DATA TRANSFER RATE"
IF A$ = "BS" THEN PRINT "BACHELOR OF SCIENCE. COLLEGE/UNIVERSITY SCIENCE OR TECHNOLOGY DEGREE- TYPICALLY 4 YEARS"
IF A$ = "BSC" THEN PRINT "BINARY SYNCHRONOUS COMMUNICATION.   USE OF CONTROL CHARACTERS & SEQUENCES FOR INTRA-STATION TRANSMISSION"
IF A$ = "BTR" THEN PRINT "BEHIND THE TAPE READER. DNC HARDWARE COMPONENT"
IF A$ = "BTU" THEN PRINT "BRITISH THERMAL UNIT"
IF A$ = "BYTE" THEN PRINT "BITS ORGANIZED TOGETHER INTO A WORD TO HOLD A SYMBOL LETTER/NUMBER"
IF A$ = "C" THEN PRINT "COMPUTER PROGRAMMING LANGUAGE KNOWN FOR TRANSPORTABILITY"
IF A$ = "CA" THEN PRINT "COLLISION AVOIDANCE"
IF A$ = "CAD" THEN PRINT "COMPUTER AIDED DESIGN.DESIGN ANALYSIS OR MODIFICATION THROUGH THE USE OF COMPUTERS."
IF A$ = "CAD/CAM" THEN PRINT "COMPUTER AIDED DESIGN/COMPUTER AIDED MFG.USUALLY REFERRING TO DESIGN, DRAFTING, AND N.C. PROGRAMMING SYSTEMS"
IF A$ = "CADAM" THEN PRINT "COMPUTER-GRAPHICS AIDED DESIGN AND MANUFACTURING.INTERACTIVE CAD/CAM SYSTEM DEVELOPED BY LOCKHEED INC.; IBM CAD/CAM"
IF A$ = "CAE" THEN PRINT "COMPUTER AIDED ENGINEERING.COMPUTER ASSIST WITH TASKS LIKE FINITE ELEMENT ANALYSIS, DESIGN, ETC"
IF A$ = "CAEDS" THEN PRINT "COMPUTER-AIDED ENGINEERING DESIGN SYSTEM.IBM INTEGRATED DESIGN SYSTEM FOR SOLVING STRESS/HEAT/DESIGN PROBLEMS"
IF A$ = "CAGD" THEN PRINT "COMPUTER AIDED GEOMETRIC DESIGN"
IF A$ = "CAIT" THEN PRINT "COALITION FOR ADVANCEMENT OF IND. TECHNOLOGY.CONGRESSIONAL LOBBYING GROUP ENCOURAGING INDUSTRIAL REASEARCH"
IF A$ = "CAIT" THEN PRINT "COMPUTER AIDED INSPECTION & TEST.COMPUTER ASSIST WITH TASKS LIKE FINITE ELEMENT ANALYSIS, DESIGN, ETC"
IF A$ = "CALS" THEN PRINT "COMPUTER-AIDED LOGISTICS SUPPORT.DOD PROGRAM TO APPLY COMMUNICATIONS & TECHNOLOGIES IN LOGISTICS"
IF A$ = "CAM" THEN PRINT "COMPUTER AIDED MANUFACTURING.DEVELOPMENT OF MANUFACTURED END PRODUCT THROUGH COMPUTER ASSISTANCE"
IF A$ = "CAMI" THEN PRINT "COMPUTER AIDED MANUFACTURING-INTERNATIONAL.INTERNATIONAL CONSORTIUM OF COMPANIES DOING C.A.M. R&D WORK"
IF A$ = "CAPE" THEN PRINT "COMPUTER AIDED PRODUCTION ENGINEERING"
IF A$ = "CAPP" THEN PRINT "COMPUTER ASSISTED PROCESS PLANNING.SOFTWARE THAT ASSISTS WITH THE CREATION OF PROCESS PLANS"
IF A$ = "CARIC" THEN PRINT "COMPUTERIZED AUTOMATION & ROBOTICS INFO. CENTER.SME PHONE ACCESS REFERENCE LIBRARY FOR MFG. PROCESSES & APPLICATIONS"
IF A$ = "CASA/SME" THEN PRINT "COMPUTER & AUTOMATED SYSTEMS ASSOCIATION.SME AFFILIATE SPECIALIZING IN CIM TECHNOLOGY"
IF A$ = "CASE" THEN PRINT "COMMON APPLICATION SERVICE ELEMENTS"
IF A$ = "CASE" THEN PRINT "COMPUTER AIDED SOFTWARE ENGINEERING"
IF A$ = "CAST" THEN PRINT "COMPUTER AIDED STORAGE & TRANSPORTATION"
IF A$ = "CAT" THEN PRINT "COMPUTER ASSISTED TESTING.COMPUTER CONTROLLED TESTING PROCEDURES"
IF A$ = "CATIA" THEN PRINT "COMPUTER AIDED 3D INTERACTIVE APPLICATION.IBM MARKETED DESSAULT CAD SOFTWARE W/ SOLIDS & WIRE FRAME CAPABILITY"
IF A$ = "CBDS 2" THEN PRINT "CIRCUIT BOARD DESIGN SYSTEM.IBM'S PRINTED CIRCUIT BOARD SYSTEM; DEV. BY BELL NORTHERN RESEARCH"
IF A$ = "CBIOS" THEN PRINT "COMPATIBILITY BIOS"
IF A$ = "CCD" THEN PRINT "CHARGE-COUPLED DEVICE.A KIND OF SOLID STATE CAMERA USED IN MACHINE VISION APPLICATIONS"
IF A$ = "CCITT" THEN PRINT "CONSULTATIVE COMMITTEE FOR INTERNATIONAL TELEPHONY AND TELEGRAPHY"
IF A$ = "CD" THEN PRINT "COLLISION DETECTION"
IF A$ = "CD-ROM" THEN PRINT "COMPACT DISK-READ ONLY MEMORY.OPTICAL DISK USED AS DATA STORAGE MEDIUM"
IF A$ = "CDC" THEN PRINT "CUTTER DIAMETER COMPENSATION.FEATURE WHICH ALTERS TOOL PATH TO COMPENSATE FOR OFFSETS & DIAMETERS"
IF A$ = "CDPF" THEN PRINT "COMPOSED DOCUMENT PRINTING FACILITY.SOFTWARE INTERFACE FOR 4250 PRINTER.  MERGES GDDM, DCF FILES."
IF A$ = "CEO" THEN PRINT "CHIEF EXECUTIVE OFFICER"
IF A$ = "CEO" THEN PRINT "COMPREHENSIVE ELECTRONIC OFFICE.DATA GENERAL BUSINESS AUTOMATION SOFTWARE"
IF A$ = "CFF" THEN PRINT "COMMUNICATION FACILITY FUNCTION.IBM PACS' MESSAGE TRANSACTION CAPABILITY"
IF A$ = "CFO" THEN PRINT "CUSTOMER FULFILLMENT OPTION.CREDITING PROCEDURE FOR IBM PRODUCTS PURCHASED FROM DISTRIBUTORS"
IF A$ = "CG" THEN PRINT "COMPUTER GRAPHICS.COMPUTER DATA INPUT TRANSFORMED INTO DRAWINGS OR GRAPHS"
IF A$ = "CGA" THEN PRINT "COLOR GRAPHICS ADAPTER.IBM COLOR PC GRAPHICS BOARD"
IF A$ = "CHGSC" THEN PRINT "CHANGE SCREEN.KEY MOVES SESSION FROM ONE DEFINED SCREEN PROFILE TO ANOTHER"
IF A$ = "CI-ROM" THEN PRINT "COMPACT DISK-INTERACTIVE.PHILLIPS INTERNATIONAL'S CD-ROM PRODUCT"
IF A$ = "CIB" THEN PRINT "COMPUTER INTEGRATED BUSINESS.BUSINESS HAVING ALL FUNCTIONS INTEGRATED THRU COMMON DATABASE"
IF A$ = "CICS" THEN PRINT "CUSTOMER INFORMATION AND CONTROL SYSTEM.IBM DATA COMMUNICATIONS OPERATING SYSTEM"
IF A$ = "CID" THEN PRINT "CHARGE-INJECTION DEVICE.A KIND OF SOLID STATE CAMERA USED IN MACHINE VISION APPLICATIONS"
IF A$ = "CIEDS" THEN PRINT "COMPUTER-AIDED ELECTRICAL DESIGN SERIES.IBM ELEC. CIRCUIT DESIGN VERIFICATION SIMULATION PROGRAMS FOR RT PC"
IF A$ = "CIM" THEN PRINT "COMPUTER INTEGRATED MANUFACTURING.COMMON DATABASING OF ALL MANUFACTURING RELATED INFORMATION"
IF A$ = "CIPREC" THEN PRINT "CONVERS. & INTERACTIVE PROJECT EVAL. & CNTRL.IBM INTERACTIVE PROJECT MANAGEMENT APPLICATION PROGRAM"
IF A$ = "CL" THEN PRINT "CENTER LINE (OR) CUTTER LINE.N/C PROGRAM OUTPUT SPECIFYING COORDINATE LOCATIONS OF TOOL TRAVEL"
IF A$ = "CLDATA" THEN PRINT "CUTTER LOCATION DATA (BCL).EIA RS-494 FORMAT"
IF A$ = "CMFGE" THEN PRINT "CERTIFIED MANUFACTURING ENGINEER.SME ACCREDITATION STATUS FOR QUALIFYIED MFG. PROFESSIONALS"
IF A$ = "CMFGT" THEN PRINT "CERTIFIED MANUFACTURING TECHNOLOGIST.SME ACCREDITATION STATUS FOR QUALIFYIED MFG. PROFESSIONALS"
IF A$ = "CMM" THEN PRINT "COORDINATE MEASUREMENT MACHINE"
IF A$ = "CMOS" THEN PRINT "COMPLEMENTARY METAL-OXIDE SEMICONDUCTOR.TYPE OF ELECTRONIC CIRCUITRY"
IF A$ = "CMS" THEN PRINT "CONVERSATIONAL MONITORING SYSTEM.ENVIRONMENT - RUNS UNDER VM OPERATING SYSTEM"
IF A$ = "CMU" THEN PRINT "CARNEGIE-MELON UNIVERSITY.PITTSBURGH BASED SCHOOL RENOWN FOR HIGH TECH ACHIEVEMENTS"
IF A$ = "CNC" THEN PRINT "COMPUTER NUMERICAL CONTROL.USE OF COMPUTER TO MANAGE MACHINE TOOL INSTRUCTIONS"
IF A$ = "COAX" THEN PRINT "COAXIAL WIRE.CONNECTING WIRE BETWEEN TERMINALS AND CONTROLLERS/COMPUTERS"
IF A$ = "COBOL" THEN PRINT "COMMON BUSINESS ORIENTED LANGUAGE.FIRST MAJOR COMMON BUSINESS APPLICATION PROGRAMMING LANGUAGE"
IF A$ = "COG/SME" THEN PRINT "COMPOSITES GROUP OF SME.SME AFFILIATE SPECIALIZING IN COMPOSITE MATERIAL TECHNOLOGY"
IF A$ = "COI" THEN PRINT "CITY OF INDUSTRY.A&S SATELLITE MFG. FACILITY"
IF A$ = "COLORCOPY" THEN PRINT "TOOL FOR INQUIRING IN CADAM DATABASE.  BETTER THAN GDQF."
IF A$ = "COMMON" THEN PRINT "IBM USERS GROUP"
IF A$ = "COMPILER" THEN PRINT "TRANSLATES HIGH LEVEL LANGUAGES INTO BINARY COMPUTER CODE"
IF A$ = "COPICS" THEN PRINT "COMMUN. BASED PROD./INVENTORY CNTRL SYSTEM.IBM QUASI-MRP SOFTWARE"
IF A$ = "COS" THEN PRINT "CORPORATION FOR OPEN SYSTEMS"
IF A$ = "COS" THEN PRINT "CORPORATION OF OPEN SYSTEMS"
IF A$ = "CP" THEN PRINT "CONTROL PROGRAM"
IF A$ = "CPI" THEN PRINT "CHARACTERS PER INCH.PRINTING FORMAT PARAMETER"
IF A$ = "CPI" THEN PRINT "COMPUTER TO PBX INTERFACE.DEC DEVICE CAPABLE OF 24 COMMUNICATION CHANNELS/LINK; 750 FT. RANGE"
IF A$ = "CPR" THEN PRINT "CRITICAL PROBLEM REPORT"
IF A$ = "CPS" THEN PRINT "CHARACTERS PER SECOND.PRINTING SPEED"
IF A$ = "CPS" THEN PRINT "CYCLES PER SECOND.OPERATING FREQUENCY OF COMPUTER BUSES"
IF A$ = "CPU" THEN PRINT "CENTRAL PROCESSING UNIT.HEART OF COMPUTER COMPRISING ARITHMETIC, CONTROL, & LOGIC ELEMENTS."
IF A$ = "CPUC" THEN PRINT "CALIFORNIA PUBLIC UTILITIES COMMISSION"
IF A$ = "CRP" THEN PRINT "CAPACITY RESOURCE PLANNING.SAME AS MRPSTING COBAL PROGRAMS INTO STRUCTURED CODE (IBM)"
IF A$ = "CRS" THEN PRINT "CURSOR SELECT.IN HOST SESSION, THIS KEY CHOOSES FIELDS FOR PROCESSING"
IF A$ = "CRT" THEN PRINT "CATHODE RAY TUBE.DISPLAY TUBE FPR COMPUTER GENERATED GRAPHICS AND/OR TEXT"
IF A$ = "CSDS" THEN PRINT "CIRCUIT SWITCHED DIGITAL SERVICES"
IF A$ = "CSF" THEN PRINT "COBAL STRUCTURING FACILITY.CHANGES EXISTING COBAL PROGRAMS INTO STRUCTURED CODE (IBM)"
IF A$ = "CSMA/CD" THEN PRINT "CARRIER SENSED MULTIPLE ACCESS W/ COLLISION DETECTION"
IF A$ = "CSMP" THEN PRINT "CONTINUOUS SYSTEM MODELING PROGRAM.IBM CONTINUOUS SIMULATION PROGRAM"
IF A$ = "CSP" THEN PRINT "CROSS SYSTEM PRODUCT.IBM SOFTWARE PRODUCT FAMILY FOR PROGRAMMING PROCESS ENHANCEMENTS"
IF A$ = "CTOL" THEN PRINT "CONVENTIONAL TAKE-OFF AND LANDING"
IF A$ = "CTPA" THEN PRINT "COAX TO TWISTED PAIR ADAPTER.IBM DEVICE FOR 32XX COMMUNICATION VIA TWISTED-PAIR TELEPHONE WIRE"
IF A$ = "CUAI" THEN PRINT "COMMON USER ACCESS INTERFACE"
IF A$ = "CULPRIT" THEN PRINT "PROGRAMMING LANGUAGE"
IF A$ = "CUT" THEN PRINT "CONTROL UNIT TERMINAL.TERMINAL W/ LESS INTELLIGENCE THAN DFT TYPE"
IF A$ = "CUTTECH" THEN PRINT "METCUT CUSTOMIZED MACHINING TECHNOLOGY SOFTWARE SYSTEM"
IF A$ = "CV" THEN PRINT "COMPUTERVISION.MAJOR MANUFACTURER OF CAD/CAM SYSTEMS"
IF A$ = "DAA" THEN PRINT "DATA ACCESS ARRANGEMENTS"
IF A$ = "DAC" THEN PRINT "DIGITAL TO ANALOG CONVERTER"
IF A$ = "DACU" THEN PRINT "DEVICE ATTACHMENT CONTROL UNIT.ALLOWS ATTACHMENT OF NON-IBM DEVICES TO 30XX OR 4300 PROCESSORS"
IF A$ = "DARPA" THEN PRINT "DEFENSE ADVANCED RESEARCH PROJECTS AGENCY.D.O.D. AGENCY DOING RESEARCH IN A.I., SUPERCOMPUTERS, AEROSPACE PLANE"
IF A$ = "DASD" THEN PRINT "DIRECT ACCESS STORAGE DEVICE.PERMANENT MEMORY STORAGE AREA(USUALLY MAGNETIC TAPE OR DISK)"
IF A$ = "DBMS" THEN PRINT "DATA BASE MANAGEMENT SYSTEMS.SOFTWARE PROGRAMS THAT PROVIDE ORGANIZATION FOR A DATABASE"
IF A$ = "DB2" THEN PRINT "IBM'S PREMIER MVS RELATIONAL DATABASE MANAGEMENT SYSTEM"
IF A$ = "DCA" THEN PRINT "DIGITAL COMMUNICATIONS ASSOCIATION.MANUFACTURER OF IRMA BOARD"
IF A$ = "DCA" THEN PRINT "DOCUMENT CONTENT ARCHITECTURE.IBM'S WORD PROCESSING DEFINITION ARCHITECTURE"
IF A$ = "DCAS" THEN PRINT "DEFENSE CONTRACT ADMINISTRATION SERVICES.U.S. GOV. AGENCY RESPONSIBLE FOR REGULATING DEFENSE CONTRACTORS"
IF A$ = "DCE" THEN PRINT "DATA COMMUNICATION EQUIPMENT"
IF A$ = "DCF" THEN PRINT "DOCUMENT COMPOSITION FACILITY.ALLOWS FORMATTED IN UT, CONTAINS SCRIPT"
IF A$ = "DCLASS" THEN PRINT "DECISION CLASSIFICATION INFORMATION SYSTEM.BYU'S HIERARCHICAL INFORMATION TREE STORAGE AND RETRIEVAL SYSTEM"
IF A$ = "DDC" THEN PRINT "DIRECT DIGITAL CONTROL.USE OF DIGITAL COMPUTER TO GOVERN PROCESS CONTROL OPERATIONS"
IF A$ = "DDIH" THEN PRINT "DIGITAL DISPLAY INTERFACE HARDWARE"
IF A$ = "DDM" THEN PRINT "DISTRIBUTED DATA MANAGEMENT.IBM PC TO HOST CONNECTIVITY PRODUCT"
IF A$ = "DDS" THEN PRINT "DATAPHONE DIGITAL SERVICES"
IF A$ = "DE" THEN PRINT "DOMAIN EXPERT.PERSON W/ EXPERTISE IN THE DOMAIN OF THE EXPERT SYSTEM BEING DEVELOPE"
IF A$ = "DEC" THEN PRINT "DECELERATION.DECREASE IN VELOCITY OF AN N/C MACHINE TOOL SERVO FEED"
IF A$ = "DEC" THEN PRINT "DIGITAL EQUIPMENT CORPORATION"
IF A$ = "DES" THEN PRINT "DATA ENCRYPTION STANDARD.IBM ENCRYPTION ALGORITHM"
IF A$ = "DEXPO" THEN PRINT "DIGITAL EQUIPMENT CORPORATION EXPOSITION.NATIONAL EXPOSITION FOR DEC AND DEC-COMPATIBLE COMPUTER EQUIPMENT"
IF A$ = "DFD" THEN PRINT "DATA FLOW DIAGRAMS"
IF A$ = "DFHSM" THEN PRINT "DATA FACILITY HIERARCHICAL STORAGE MANAGER.IBM DATA MANAGEMENT TOOL FOR DISK/TAPE DATA ARCHIVING"
IF A$ = "DFM/A" THEN PRINT "DESIGN FOR MANUFACTURABILITY/AUTOMATION.ATTENTION DURING DESIGN PROCESS TO IMPACT ON MANUFACTURING"
IF A$ = "DFP" THEN PRINT "DATA FACILITY PRODUCT.IBM DATA MANAGEMENT TOOL FOR DISK/TAPE DATA ARCHIVING"
IF A$ = "DFT" THEN PRINT "DISTRIBUTED FUNCTION TERMINAL.TERMINAL W/ KEYBOARD CODES PROCESSED @ TERMINAL VS. @ CONTROLLER"
IF A$ = "DIA" THEN PRINT "DOCUMENT INTERCHANGE ARCHITECTURE.IBM'S INTERCOMPUTER DOCUMENT TRANSFER SPECIFICATION"
IF A$ = "DIF" THEN PRINT "DEVICE INPUT FORMAT"
IF A$ = "DISSOS" THEN PRINT "DISTRIBUTED OFFICE SYSTEMS.FRAMEWORK FOR INTEGRATING MULTIPLE WORKSTATIONS & OFFICE SYSTEMS"
IF A$ = "DM" THEN PRINT "DELTA MODULATION"
IF A$ = "DMA" THEN PRINT "DIRECT MEMORY ACCESS.TYPE OF COMPUTER CONTROLLER"
IF A$ = "DMF" THEN PRINT "DATA MANAGER FUNCTION.IBM PACS DISK/STORAGE RESIDENT DATA STRUCTURES & ORGANIZATIONS"
IF A$ = "DMIS" THEN PRINT "DIMENSIONAL MEASURING INTERFACE STANDARD.DATA EXCHANGE STANDARD FOR INSPECTION DEVICES; CAD TO CMM"
IF A$ = "DNA" THEN PRINT "DIGITAL NETWORKING ARCHITECTURE.DEC CONCEPT OF MULTIPLE CLUSTER INTER-COMMUNICATION"
IF A$ = "DNC" THEN PRINT "DISTRIBUTIVE(OR DIRECT) NUMERICAL CONTROL.TRANSFER OF MACHINE TOOL INSTRUCTIONS VIA HARDWIRE METHOD"
IF A$ = "DOD" THEN PRINT "DEPARTMENT OF DEFENSE"
IF A$ = "DOL" THEN PRINT "DEPARTMENT OF LABOR.U.S. GOVT. AGENCY"
IF A$ = "DOS" THEN PRINT "DISK OPERATING SYSTEM.IBM GEN. PURPOSE, LOW FUNCTION, DISK MEMORY ORIENTED OPERATING SYSTEM"
IF A$ = "DOSF" THEN PRINT "DISTRIBUTED OFFICE SUPPORT FACILITY"
IF A$ = "DPCM" THEN PRINT "DIFFERENTIAL PULSE CODE MODULATION"
IF A$ = "DRAM" THEN PRINT "DYNAMIC RANDOM ACCESS MEMORY"
IF A$ = "DRO" THEN PRINT "DIGITAL READ-OUT.NUMERICAL VALUE DISPLAY DEVICE; OFTEN TO SHOW TOOL LOCATION/MOVEMENT"
IF A$ = "DSP" THEN PRINT "DIGITAL SIGNAL PROCESSING"
IF A$ = "DSS" THEN PRINT "DECISION SUPPORT SYSTEMS"
IF A$ = "DTE" THEN PRINT "DATA TERMINAL EMULATION"
IF A$ = "DVF" THEN PRINT "DEVICE FUNCTION.IBM PACS AREA PROVIDING PROGRAMMED COMM. TO VENDOR DEVICES"
IF A$ = "DVI" THEN PRINT "DIGITAL VIDEO INTERACTIVE.RCA CD-ROM STANDARD"
IF A$ = "EAROM" THEN PRINT "ELECTRICALLY ALTERABLE READ-ONLY MEMORY.TYPE OF COMPUTER MEMORY COMBINING CHARACTERISTICS OF RAM & ROM"
IF A$ = "EBCDIC" THEN PRINT "EXTENDED BINARY CODED DECIMAL INTERCHANGE CODE.N/C TAPE FORMAT USING PATTERN OF EIGHT BINARY BITS PER CHARACTER"
IF A$ = "ECC" THEN PRINT "ERROR CHECKING AND CORRECTION"
IF A$ = "ECF" THEN PRINT "ENHANCED CONNECTIVITY FACILITIES.IBM MICRO TO MAINFRAME LINKS; LINKS PC'S WITH SNA HOST OMPUTERS"
IF A$ = "ECMA" THEN PRINT "EUROPEAN COMPUTER MANUFACTURERS ASSOCIATION"
IF A$ = "EDM" THEN PRINT "ELECTRICAL DISCHARGE MACHINING.CONTROLLED MATERIAL REMOVAL VIA ELECTRICAL CURRENT"
IF A$ = "EDP" THEN PRINT "ELECTRONIC DATA PROCESSING.BROAD FIELD OF ELECTRONIC COMPUTERS & RELATED ACTIVITIES (DP)"
IF A$ = "EDS" THEN PRINT "EXTENDED DATA STREAM.CHARACTER ATTRIBUTES REPRESENTED BY 1 BYTE CODE ATTACHED TO CHARACTER"
IF A$ = "EEHLLAPI" THEN PRINT "ENTRY LEVEL HLLAPI"
IF A$ = "EEMS" THEN PRINT "ENHANCED EXPANDED MEMORY SPECIFICATION"
IF A$ = "EEOC" THEN PRINT "EQUAL EMPLOYMENT OPPORTUNITY COUNCIL"
IF A$ = "EGA" THEN PRINT "ENHANCED GRAPHICS ADAPTER.IBM ENHANCED PC GRAPHICS ADAPTER CARD"
IF A$ = "EIA" THEN PRINT "ELECTRONIC INDUSTRIES ASSOCIATION.NC TAPE PUNCH FORMAT W/ EVEN PARITY(8 HOLES PER ROW ON 1 TAPE)"
IF A$ = "EII" THEN PRINT "ELECTRONIC INDUSTRIES INSTITUTE"
IF A$ = "ELV" THEN PRINT "EXPENDABLE LAUNCH VEHICLE.NON-REUSABLE HARDWARE FOR PLACING PAYLOADS INTO SPACE"
IF A$ = "EM" THEN PRINT "EXPANDED MEMORY.PC MEMORY ABOVE DOS' 640K LIMIT: USED FOR PAGING, RAMDISK, CACHING"
IF A$ = "EM/SME" THEN PRINT "ELECTRONICS MANUFACTURING GROUP OF SME.SME AFFILIATE SPECIALIZING IN ELECTRONICS MANUFACTURING"
IF A$ = "EMI" THEN PRINT "ELECTROMAGNETIC INTERFERENCE.STRAY OR UNWANTED ELECTRICAL ENERGY WITHIN COMPUTER CIRCUITRY"
IF A$ = "EMM" THEN PRINT "EXPANDED MEMORY MANAGER.DOS DRIVER ALLOWING CONCURRENTLY RUNNING PROGRAMS TO PAGE MEMORY"
IF A$ = "EMS" THEN PRINT "EXPANDED MEMORY SPECIFICATION"
IF A$ = "EOB" THEN PRINT "END OF BLOCK.CHARACTER REPRESENTING END OF LINE/BLOCK OF INFO IN N/C PROGRAM TAPE"
IF A$ = "EOF" THEN PRINT "END OF FIELD"
IF A$ = "EOP" THEN PRINT "END OF WORKPIECE PROGRAM"
IF A$ = "EOT" THEN PRINT "END OF TAPE"
IF A$ = "EPA" THEN PRINT "ENVIRONMENTAL PROTECTION AGENCY.U.S. GOVERNMENT AGENCY RESPONSIBLE FOR OVERSEEING POLLUTION CONCERNS"
IF A$ = "EPA" THEN PRINT "EXTENDED PERFORMANCE ARCHITECTURE"
IF A$ = "EPROM" THEN PRINT "ERASABLE PROGRAMMABLE READ-ONLY MEMORY.COMPUTER MEMORY WHICH CAN BE ERASED & REPROGRAMMED VIA UV LIGHT"
IF A$ = "EQUAL" THEN PRINT "ELECTRONIC QUICK ANSWER LIBRARY.IBM ON-LINE INFORMATION LIBRARY FOR IBM EMPLOYEES"
IF A$ = "ERINP" THEN PRINT "ERASE INPUT.IN A HOST SESSION, THIS KEY ERASES ALL INPUT FIELDS & HOMES CURSOR"
IF A$ = "EROM" THEN PRINT "ERASABLE READ-ONLY MEMORY.COMPUTER MEMORY WHICH CAN BE ERASED & REPROGRAMMED VIA UV LIGHT"
IF A$ = "ES" THEN PRINT "EXTENDED SELF-CONTAINED PROLOG.AI DEVELOPMENT LANGUAGE"
IF A$ = "ES**3" THEN PRINT "ENGINEERING SCIENTIFIC SUPPORT SYSTEM.E-S CUBED: A SOFTWARE PRODUCTIVITY TOOL FOR ENGINEERS & SCIENTISTS"
IF A$ = "ESDI" THEN PRINT "ENHANCED SMALL DEVICE INTERFACE"
IF A$ = "ESPIRIT" THEN PRINT "EUROPEAN STRATEGIC PROG. FOR R&D IN INFO TECH"
IF A$ = "EXM" THEN PRINT "EXTENDED MEMORY PARAMETER"
IF A$ = "EXSEL" THEN PRINT "EXTENDED SELECT.IN HOST SESSION, ALLOWS KEYBOARD TO EMULATE SOME TYPEWRITER FEATURES"
IF A$ = "FAT" THEN PRINT "FILE ALLOCATION TABLE.IN ESSENCE, A VOLUME.TABLE OF CONTENTS FOR PC STORAGE FILES"
IF A$ = "FCC" THEN PRINT "FEDERAL COMMUNICATIONS COMMISSION"
IF A$ = "FDM" THEN PRINT "FREQUENCY DIVISION MULTIPLEXING"
IF A$ = "FEA" THEN PRINT "FINITE ELEMENT ANALYSIS"
IF A$ = "FFT" THEN PRINT "FAST FOURIER TRANSFORMERS"
IF A$ = "FFTDCA" THEN PRINT "FINAL-FORM TEXT DOCUMENT CONTENT ARCHITECTURE.IBM DISPLAYWRITE/370 TEXT FORMAT"
IF A$ = "FIPS" THEN PRINT "FEDERAL INFORMATION PROCESSING STANDARD"
IF A$ = "FIR" THEN PRINT "FINITE IMPULSE RESPONSE"
IF A$ = "FLIR" THEN PRINT "FORWARD LOOKING INFRA RED.NIGHT VISION SIGHTS USED ON APACHE HELICOPTERS"
IF A$ = "FMC" THEN PRINT "FLEXIBLE MANUFACTURING CELL.MACHINE(S) PRODUCING VARIOUS PARTS W/ MIN. CHANGE OVER TIME"
IF A$ = "FMS" THEN PRINT "FLEXIBLE MANUFACTURING SYSTEM.GROUP(S) OF FLEXIBLE CELLS INTEGRATED INTO A SYSTEM"
IF A$ = "FOD" THEN PRINT "FIBER OPTIC GUIDANCE"
IF A$ = "FORTRAN" THEN PRINT "FORMULA TRANSLATION.UNIVERSAL COMPUTER LANGUAGE FOR MATHEMATICAL APPLICATIONS, LIKE N/C"
IF A$ = "FRG" THEN PRINT "FEDERAL REPUBLIC OF GERMANY.WEST GERMANY"
IF A$ = "FRN" THEN PRINT "FEEDRATE NUMBER.NUMBER DESIGNATING RATE OF TRAVEL OF A MACHINE TOOL"
IF A$ = "FRO" THEN PRINT "FEEDRATE OVERRIDE.N/C CONTROL FEATURE ALLOWING OPERATOR TO OVERRIDE PROGRAMMED FEEDRATE"
IF A$ = "FTAM" THEN PRINT "FILE TRANSFER, ACCESS, & MANAGEMENT"
IF A$ = "FTC" THEN PRINT "FEDERAL TRADE COMMISSION.U.S. GOVT. DEPT."
IF A$ = "FUD" THEN PRINT "FEAR, UNCERTAINTY, & DOUBT"
IF A$ = "GAA" THEN PRINT "GALLIUM ARSENIDE.INTEGRATED CIRCUIT CHIP MATERIAL ALLOWING SUPER FAST CLOCK SPEEDS"
IF A$ = "GAL" THEN PRINT "GALLIUM ARSENITE LASER.TYPE OF MINIATURE LASER USED IN IBM 3280 PRINTER"
IF A$ = "GBL" THEN PRINT "GROUND BASED LASER"
IF A$ = "GCP" THEN PRINT "GRAPHICS CONTROL PROGRAM"
IF A$ = "GDDM" THEN PRINT "GRAPHICAL DATA DISPLAY MANAGER.ALLOWS GRAPHICS ON COLOR TERMINAL.  ASSY LANGUAGE."
IF A$ = "GDF" THEN PRINT "GRAPHICAL DISPLAY FILE.VM OR MVS FILES WITH GRAPHICAL CONTENT"
IF A$ = "GDP" THEN PRINT "GEOMETRIC DESIGN PROCESSOR.IBM DEVELOPED PROGRAMMING SYSTEM FOR DEFINING GEOMETRIC MODELS"
IF A$ = "GDQF" THEN PRINT "GRAPHICAL DISPLAY AND QUERY FACILITY  USED TO INQUIRE ON CADAM DRAWINGS"
IF A$ = "GEMOS" THEN PRINT "GENERAL ELECTRIC MACHINING OPTIMIZATION SYSTEM.G.E. EXPERT SYSTEM TO AID CUTTING TOOL SELCTION/PATH, MACH. PARAMETER"
IF A$ = "GGXA" THEN PRINT "COLOR GRAPHICS EXTENDED APPLICATIONS.IBM GRAPHICS SOFTWARE WITH PLOTTING, GRAPHING, & EDITING CAPABILITY"
IF A$ = "GIF" THEN PRINT "GRAPHICAL INFORMATION SYSTEM.IBM GRAPHICS SOFTWARE USED IN CONJUNCTION WITH GDQF"
IF A$ = "GIN" THEN PRINT "GRAPHIC INPUT.IBM GRAPHICS SOFTWARE USED IN CONJUNCTION WITH GDQF"
IF A$ = "GKS" THEN PRINT "GRAPHICS KERNEL SYSTEM"
IF A$ = "GML" THEN PRINT "GENERAL MARKUP LANGUAGE.IBM'S DOCUMENT CHARACTERISTIC DESCRIPTION LANGUAGE; SCRIPT"
IF A$ = "GPI" THEN PRINT "GRAPHICS PROCEDURE INTERFACE.COMMUNICATION INTERFACE BETWEEN APPLICATION PROGRAM & GCP"
IF A$ = "GPIB" THEN PRINT "GENERAL PURPOSE INTERFACE BUS"
IF A$ = "GPSS" THEN PRINT "GENERAL PURPOSE SIMULATION SYSTEM.IBM SIMULATOR PROGRAM FOR EVENT-DRIVEN MODELS"
IF A$ = "GT" THEN PRINT "GROUP TECHNOLOGY.CLASSIFICATION AND CODING ORGANIZATIONAL PRINCIPLE"
IF A$ = "HALON" THEN PRINT "HYDROGENATED HYDROCARBON.FIRE EXTINGUISHING GAS; DECOMPOSES TO HYD. FLOURIDE/CHLORIDE/BROMIDE"
IF A$ = "HASP" THEN PRINT "TYPE OF ELECTRONIC LINK OR CONVERSION"
IF A$ = "HCI" THEN PRINT "HUMAN-COMPUTER INTERFACE"
IF A$ = "HCL" THEN PRINT "HYDROCHLORIC ACID"
IF A$ = "HGC" THEN PRINT "HERCULES GRAPHICS CARD"
IF A$ = "HLLAPI" THEN PRINT "HIGH LEVEL LANGUAGE APPLICATION PROGRAM INTERFACE IBM CUSTOMIZATION PROGRAMMING SOFTWARE FOR 3270PC"
IF A$ = "HP" THEN PRINT "HORSE POWER"
IF A$ = "I/O" THEN PRINT "INPUT/OUTPUT DEVICE.DEVICES WHICH CAN BOTH RECEIVE & SEND DATA"
IF A$ = "IBM" THEN PRINT "INTERNATIONAL BUSINESS MACHINE"
IF A$ = "IBM PC/AT" THEN PRINT "ADVANCED TECHNOLOGY PERSONAL COMPUTER"
IF A$ = "IBM PC/ET" THEN PRINT "EXTENDED TECHNOLOGY PERSONAL COMPUTER.NEW IBM BOTTOM OF THE LINE PC; HOME/SCHOOL USE; 8086 MICROPROCESSOR"
IF A$ = "IBM PC/XT" THEN PRINT "IBM PC"
IF A$ = "IBM PC2" THEN PRINT "NEW IBM PC: 4 TIMES FASTER THAN PC/XT; 80286 MICROPROCESSOR"
IF A$ = "IBM 3090" THEN PRINT "IBM SIERRA MAINFRAME.IBM TOP-OF-THE-LINE MAINFRAME, 1 STEP UP FROM 308X'S"
IF A$ = "IBM 3161" THEN PRINT "IBM ASCII DISPLAY STATION-ENTRY LEVEL, 25 LINES X 80 CHAR."
IF A$ = "IBM 3163" THEN PRINT "IBM ASCII DISPLAY STATION-8 COLORS, 4 PAGES ON EACH OF 3 WINDOWS"
IF A$ = "IBM 3164" THEN PRINT "IBM ASCII DISPLAY STATION-MULTIPLE DATA/MULTIPLE COLORS"
IF A$ = "IBM 3174" THEN PRINT "IBM LARGE MODEL CLUSTER CONTROLLER"
IF A$ = "IBM 3178" THEN PRINT "IBM LIGHT-WEIGHT MODULAR DUMB TERMINAL"
IF A$ = "IBM 3179" THEN PRINT "IBM COLOR TERMINAL; WILL SUPPORT GRAPHICS; LESS EXPENSIVE THAN 3279"
IF A$ = "IBM 3179-G" THEN PRINT "IBM COLOR TERMINAL; WILL SUPPORT SCREEN DUMPS OF HOST GRAPHICS"
IF A$ = "IBM 3180" THEN PRINT "IBM "; SEMI - DUMB; " TERMINAL W/ 132 CHARACTER SCREEN CAPABILITY"
IF A$ = "IBM 3191" THEN PRINT "IBM TERMINAL W/ SMALL FOOTPRINT, LESS $, GREEN OR AMBER SCREEN"
IF A$ = "IBM 3194" THEN PRINT "IBM TERMINAL W/ 4 HOST SESSION CAPABILITY; CNTRL PROG ON 3 1/2"; DISK
IF A$ = "IBM 3268-2" THEN PRINT "IBM PRINTER- DOT MATRIX REMOTE PRINTER"
IF A$ = "IBM 3270 PC-G" THEN PRINT "IBM COLOR PC; SUPPORTS GRAPHICS: HAS MOUSE, PRINTER, HARD DISK"
IF A$ = "IBM 3270 PC-GX" THEN PRINT "IBM COLOR PERSONAL COMPUTER; WILL SUPPORT GRAPHICS"
IF A$ = "IBM 3274" THEN PRINT "IBM CONTROL UNIT CONNECTING TERMINALS WITH THE MAINFRAME."
IF A$ = "IBM 3278-2" THEN PRINT "IBM "; DUMB; " TERMINAL"
IF A$ = "IBM 3278-5" THEN PRINT "IBM "; DUMB; " TERMINAL WITH 132 CHARACTER SCREEN CAPABILITY"
IF A$ = "IBM 3279" THEN PRINT "IBM COLOR TERMINAL; WILL SUPPORT GRAPHICS"
IF A$ = "IBM 3290" THEN PRINT "IBM GAS PLASMA FLAT DISPLAY DEVICE FOR 4 SIMULATANEOUS SESSIONS"
IF A$ = "IBM 3290" THEN PRINT "IBM 3290 GAS PLASMA DISPLAY FOR 3270 PC'S"
IF A$ = "IBM 3641" THEN PRINT "IBM REPORTING TERMINAL FOR PLANT FLOOR MAGNETIC DOCUMENT DECODING"
IF A$ = "IBM 3812" THEN PRINT "IBM PAGE PRINTER- 12 PG./MIN., 240 DPI, USER INSTALLED CARTRIDGES"
IF A$ = "IBM 3820" THEN PRINT "IBM LASER PRINTER- CAPABLE OF MERGING TEXT & GRAPHICS"
IF A$ = "IBM 3852" THEN PRINT "IBM COLOR INK JET PRINTER"
IF A$ = "IBM 4250" THEN PRINT "IBM ELECTRO-EROSION PAPER PRINTER FOR MERGING TEXT & GRAPHICS(600 DPI"
IF A$ = "IBM 5152" THEN PRINT "IBM MONOCROME PRINTER"
IF A$ = "IBM 5182" THEN PRINT "IBM PERSONAL COMPUTER COLOR PRINTER"
IF A$ = "IBM 5279" THEN PRINT "IBM COLOR DISPLAY TERMINAL"
IF A$ = "IBM 5520" THEN PRINT "IBM EMULATION BOARD FOR PC'S"
IF A$ = "IBM 5531" THEN PRINT "IBM INDUSTRIAL PC-XT COMPUTER"
IF A$ = "IBM 5532" THEN PRINT "IBM INDUSTRIAL COLOR DISPLAY"
IF A$ = "IBM 5533" THEN PRINT "IBM INDUSTRIAL GRAPHICS PRINTER"
IF A$ = "IBM 6300 PC" THEN PRINT "IBM INDUSTRIAL PC; PC-AT COMPATIBLE"
IF A$ = "IBM 7456" THEN PRINT "IBM HARDENED MULTI-MEDIA PLANT FLOOR TERMINAL"
IF A$ = "IBM 7531" THEN PRINT "DESK VERSION OF 7532, HIGHER SCREEN RESOLUTION THAN 7532"
IF A$ = "IBM 7532" THEN PRINT "PC-AT VERSION OF 5531, WITH WIDER TEMP. RANGE; RACK MOUNTED"
IF A$ = "IC" THEN PRINT "INFORMATION CENTER.MIS DEPARTMENT RESPONSIBLE FOR SUPPORTING END USER COMPUTING NEEDS"
IF A$ = "IC" THEN PRINT "INTEGRATED CIRCUITS.VERY SMALL SINGLE STAGE STRUCTURE ASSY. OF ELECTRONIC COMPONENTS"
IF A$ = "ICAM" THEN PRINT "INTEGRATED COMPUTER AIDED MANUFACTURING.AIR FORCE R&D MANUFACTURING PROJECT"
IF A$ = "ICBM" THEN PRINT "INTER-CONTINENTAL BALLISTIC MISSILE"
IF A$ = "ICCA" THEN PRINT "INDEPENDENT COMPUTER CONSULTANTS ASSOCIATION"
IF A$ = "ICCF" THEN PRINT "INTERACTIVE COMPUTING AND CONTROL FACILITY.EDITOR FOR VSE"
IF A$ = "ICCP" THEN PRINT "INSTITUTE FOR CERT. OF COMPUTER PROFESSIONALS"
IF A$ = "ICG" THEN PRINT "INTERACTIVE COMPUTER GRAPHICS.COMPUTER SYSTEM CAPABLE OF GRAPHIC INFO DISPLAY & USER INTERACTION"
IF A$ = "ICMP" THEN PRINT "INTERNET CONTROL MESSAGE PROTOCOL"
IF A$ = "ICS" THEN PRINT "IBM CABLING SYSTEM"
IF A$ = "ICU" THEN PRINT "INTERACTIVE CHART UTILITY.PRETTY BASIC CHARTING ROUTINES. USES PGF."
IF A$ = "IEEE" THEN PRINT "INSTITUTE OF ELECTRICAL & ELECTRONIC ENGINEERS"
IF A$ = "IGES" THEN PRINT "INTERNATIONAL GRAPHIC EXCHANGE STANDARD.COMMON DENOMINATOR FOR DIFFERENT SYSTEMS TO INTER-COMMUNICATE"
IF A$ = "IHF" THEN PRINT "IMAGE HANDLING FACILITY.IBM GRAPHICS SOFTWARE"
IF A$ = "IHPVA" THEN PRINT "INTERNATIONAL HUMAN POWERED VEHICLE ASSOCIATION"
IF A$ = "IIR" THEN PRINT "INFINITE IMPULSE RESPONSE"
IF A$ = "IMAGEWARE" THEN PRINT "PROGRAMS AND/OR PRESENTATIONS USING VIDEODISK TECHNOLOGY"
IF A$ = "IMS" THEN PRINT "INFORMATION MANAGEMENT SYSTEM.IBM HIERARCHICAL DATA BASE OPERATING SYSTEM"
IF A$ = "IMW" THEN PRINT "INTELLIGENT MACHINING WORKSTATION"
IF A$ = "INTERLISP" THEN PRINT "USER-SENSITIVE LISP DEVELOPED BY BOLT/BERANEK/NEWMAN & XEROX PARC"
IF A$ = "IOCS" THEN PRINT "INPUT/OUTPUT CONTROL SYSTEM.SOFTWARE FOR EXECUTING I/O OPERATIONS"
IF A$ = "IPCS" THEN PRINT "INTERACTIVE PROBLEM CONTROL SYSTEM.IBM SYSTEM SERVICE PRODUCT"
IF A$ = "IPG" THEN PRINT "INTERACTIVE PRESENTATION GRAPHICS.TOOL FOR ILLUSTRATORS TO DRAW ON SCREEN USING LIGHT PEN"
IF A$ = "IPL" THEN PRINT "INITIAL PROGRAM LOAD.USED IN CP MODE OF VM/CMS TO PRESET USER PARAMETERS"
IF A$ = "IPPS" THEN PRINT "INTEGRATED PACKET-SWITCHING SERVICE.AT&T'S ISDN PRODUCT"
IF A$ = "IRI" THEN PRINT "INTERNATIONAL ROBOMATION INTELLIGENCE.CARLSBAD CALIF. COMPANY; PUBLICLY HELD; NEW TECHNOLOGY APPLICATIONS"
IF A$ = "ISAM" THEN PRINT "INDEXED SEQUENTIAL ACCESS METHOD.TYPE OF FILE STRUCTURE"
IF A$ = "ISDN" THEN PRINT "INTEGRATED SERVICES DIGITAL NETWORK.COMBINED VOICE AND DATA COMMUNICATION CAPABILITY"
IF A$ = "ISIS" THEN PRINT "CMU/WESTINGHOUSE DEVELOPED EXPERT PRODUCTION SCHEDULING SYSTEM"
IF A$ = "ISO" THEN PRINT "INTERNATIONAL STANDARDS ORGANIZATION"
IF A$ = "ISPC" THEN PRINT "INDUSTRIAL STANDARD PLOT COMMAND.IBM GRAPHICAL PLOTTING COMMAND FILE"
IF A$ = "ISPF" THEN PRINT "INTERACTIVE SYSTEM PRODUCTIVITY FACILITY.IBM DIALOG MANAGER: PANEL DRIVEN ACCESS TO VARIOUS APPLICATIONS"
IF A$ = "IT" THEN PRINT "INFORMATION TECHNOLOGY"
IF A$ = "ITI" THEN PRINT "INDUSTRIAL TECHNOLOGY INSTITUTE"
IF A$ = "ITPS" THEN PRINT "INTERNAL TELEPROCESSING SYSTEM"
IF A$ = "IVDT" THEN PRINT "INTEGRATED VOICE DATA TERMINAL.SELF EXPLANATORY"
IF A$ = "IVS" THEN PRINT "INTERACTIVE VIDEO SYSTEMS .USE OF USER FEEDBACK DEVICES, I.E. TOUCH SCREENS, W/ LASER VIDEO DISK"
IF A$ = "JCL" THEN PRINT "JOB CONTROL LANGUAGE.INSTRUCTIONS WHICH CONTROL THE EXECUTION OF A COMPUTER PROGRAM"
IF A$ = "JIT" THEN PRINT "JUST IN TIME.MFG. PHILOSOPHY NOTED FOR TIMELY DELIVERIES AND MINIMAL INVENTORY"
IF A$ = "KAIZEN" THEN PRINT "CONTINUAL IMPROVEMENT .JAPANESE MANUFACTURING PHILOSOPHY"
IF A$ = "KANBAN" THEN PRINT "JAPANESE MANUFACTURING SCHEDULING PHILOSOPHY"
IF A$ = "KB" THEN PRINT "KILOBYTE.1000 BYTES (STORES APPROX. 1/2 STD. TYPED PAGES OF INFO./KILOBYTE)"
IF A$ = "KE" THEN PRINT "KNOWLEDGE ENGINEERING .A FORM OF ARTIFICIAL INTELLIGENCE"
IF A$ = "KLIPS" THEN PRINT "A THOUSAND(ONE K) LOGICAL INFERENCES PER SECOND .A MEANS OF MEASURING THE SPEED OF COMPUTERS USED FOR AI APPLICATIONS"
IF A$ = "KW" THEN PRINT "KILOWATT"
IF A$ = "KW" THEN PRINT "KNOWLEDGE-WARE"
IF A$ = "LADT" THEN PRINT "LOCAL AREA DATA TRANSPORT"
IF A$ = "LAN" THEN PRINT "LOCAL AREA NETWORKING .THE TYING TOGETHER OF COMPUTER TERMINALS & SYSTEMS VIA COMMON LINKS"
IF A$ = "LEAD" THEN PRINT "LEADERSHIP & EXCELLENCE IN CIM ADV. & DEVELOP..SME AWARD FOR INDUSTRIAL & ACADEMIC EXCELLEMCE & DEVELOPMENT IN CIM"
IF A$ = "LEAF" THEN PRINT "LOTUS EXTENDED APPLICATIONS FACILITY.TEXT AND GRAPHICS PRODUCTS INTERFACE MANAGER"
IF A$ = "LED" THEN PRINT "LIGHT EMITTING DIODE.A DEVICE WHICH GIVES OFF VISIBLE LIGHT WHEN CURRENT PASSES THRU IT"
IF A$ = "LHX" THEN PRINT "LIGHTWEIGHT EXPERIMENTAL HELICOPTER .ARMY ADVANCED HELICOPTER DEVELOPMENT PROGRAM"
IF A$ = "LIM" THEN PRINT "LOTUS/INTEL/MICROSOFT EXPANDED MEMORY SPEC. .SURPASS 640K RAM LIMIT IMPOSED BY MS-DOS; COMPAQ 386 RAM TO 8 MEG."
IF A$ = "LIPS" THEN PRINT "LOGICAL INFERENCES PER SECOND .A MEANS OF MEASURING THE SPEED OF COMPUTERS USED FOR AI APPLICATIONS"
IF A$ = "LISP" THEN PRINT "LIST PROCESSOR.1ST SYMBOLIC PROGR. LANG. DEVELOPED BY JOHN MCCARTHY AT MIT IN 1958"
IF A$ = "LLC" THEN PRINT "LOGICAL LINK CONTROL"
IF A$ = "LMF" THEN PRINT "LIBRARY MANAGEMENT FACILITY .IBM SOFTWARE PRODUCT FOR HIERARCHICAL CONTROL OF DEVELOPMENT PROCESSE"
IF A$ = "LPI" THEN PRINT "LINES PER INCH.PRINTING FORMAT PARAMETER"
IF A$ = "LPM" THEN PRINT "LINES PER MINUTE.PRINTING SPEED"
IF A$ = "LSI" THEN PRINT "LARGE SCALE INTEGRATION .ORGANIZATION OF NUMEROUS INTEGRATED CIRCUITS; BASIS OF MICROPROCESSOR"
IF A$ = "LU 6.2" THEN PRINT "COMMUNICATIONS STANDARD SPECIFICATION; SEE APPC"
IF A$ = "MAC" THEN PRINT "MEDIA ACCESS CONTROL"
IF A$ = "MACLISP" THEN PRINT "PROJECT "; MAC; "LISP LANGUAGE DERIVATIVE.MIT LISP LANG. FOR DEC; GOOD SPEED, ECON. OF STORAGE, FLEXIBILITY"
IF A$ = "MANTIS" THEN PRINT "APPLICATION IN MVS ENVIRONMENT"
IF A$ = "MAP" THEN PRINT "MANUFACTURING AUTOMATION PROTOCOL .O.S.I. STANDARD FOR FACTORY COMPUTER NETWORKING; IEEE 802.4 STD."
IF A$ = "MAP" THEN PRINT "MARKETING ASSISTANCE PROGRAM.IBM PROGRAM OF TOP INDUSTRY EXPERTS ASSISTING IN TECHNOLOGY MARKETING"
IF A$ = "MAS" THEN PRINT "MULTI-ACCESS SPOOL"
IF A$ = "MB" THEN PRINT "MEGABYTE.1,000,000 BYTES OF COMPUTER STORAGE CAPACITY"
IF A$ = "MBA" THEN PRINT "MASTERS OF BUSINESS ADMINISTRATION.COLLEGE/UNIVERSITY BUSINESS DEGREE- GRADUATE LEVEL"
IF A$ = "MBPS" THEN PRINT "MEGABITS (MILLION BITS) PER SECOND"
IF A$ = "MCA" THEN PRINT "MICRO CHANNEL ARCHITECTURE"
IF A$ = "MCAE" THEN PRINT "MECHANICAL COMPUTER-AIDED ENGINEERING"
IF A$ = "MCC" THEN PRINT "MICROELECTRONICS & COMPUTERS TECHNOLOGY CORP. .CONSORTIUM OF U.S COMPANIES INVOLVED IN ADVANCED COMPUTER RESEARCH"
IF A$ = "MCU" THEN PRINT "MACHINE CONTROL UNIT.N/C MACHINE TOOL ELECTRONIC CONTROL"
IF A$ = "MDA" THEN PRINT "MONOCHROME DISPLAY ADAPTER.SINGLE COLOR PC DISPLAY ADAPTER"
IF A$ = "MDI" THEN PRINT "MANUAL DATA INPUT .MCU FEATURE ALLOWING DIRECT DATA INPUT BY OPERATOR/PROGRAMMER"
IF A$ = "MEEF" THEN PRINT "MANUFACTURING ENGINEERING EDUCATION FOUNDATION.SME ORGANIZATION WHICH PROVIDES GRANTS TO MFG. SCHOOLS & INSTITUTIONS"
IF A$ = "MFLOPS" THEN PRINT "ONE MILLION FLOATING OPERATING PER SECOND"
IF A$ = "MFM" THEN PRINT "MODIFIED FREQUENCY MODULATION .DOUBLE DENSITY DISKETTES"
IF A$ = "MGA" THEN PRINT "MONO-COLOR GRAPHICS ADAPTER"
IF A$ = "MHS" THEN PRINT "MATERIAL HANDLING SYSTEM.METHOD(S) OF TRANSPORTING MATERIALS DURING MFG. PROCESS"
IF A$ = "MHZ" THEN PRINT "MEGA HERTZ.MILLIONS OF CYCLES PER SECOND"
IF A$ = "MIPS" THEN PRINT "MILLIONS OF INSTRUCTIONS PER SECOND .A MEASURE OF MACHINE PERFORMANCE"
IF A$ = "MIS" THEN PRINT "MANAGEMENT INFORMATION SYSTEMS"
IF A$ = "MMC" THEN PRINT "METAL MATRIX COMPOSITES"
IF A$ = "MMFS" THEN PRINT "MANUFACTURING MESSAGE FORMAT STANDARD"
IF A$ = "MMIC" THEN PRINT "MONOLITHIC MICROWAVE INTEGRATED CIRCUITS"
IF A$ = "MMU" THEN PRINT "MEMORY MANAGEMENT UNIT.LOAD DATA FROM SLOW TO FAST MEMORY JUST AHEAD OF PROCESSOR NEEDS"
IF A$ = "MNP" THEN PRINT "MICROCOM NETWORK PROTOCOL"
IF A$ = "MP&CS" THEN PRINT "MANUFACTURING PLANNING & CONTROL SYSTEMS"
IF A$ = "MPA" THEN PRINT "MONOCHROME DISPLAY ADAPTER"
IF A$ = "MPROLOG" THEN PRINT "ENHANCED VERSION OF PROLOG ESPECIALLY SUITED TO A.I. APPLICATIONS"
IF A$ = "MRB" THEN PRINT "MANUFACTURING REVIEW BOARD.MULTI-DEPT. REVIEW & DISPOSITION OF DISCREPANT PARTS"
IF A$ = "MRP" THEN PRINT "MATERIAL REQUIREMENTS PLANNING.COMPUTERIZED MATERIALS MNGMNT., PROD. SCHEDULING, & SHOP FLOOR CNTRL"
IF A$ = "MRP II" THEN PRINT "MANUFACTURING RESOURCE PLANNING .COMBINING MRP & CRP INTO SINGLE COMPUTER-AIDED FUNCTION"
IF A$ = "MS" THEN PRINT "BACHELOR OF SCIENCE .COLLEGE/UNIVERSITY SCIENCE OR TECHNOLOGY DEGREE- GRADUATE LEVEL"
IF A$ = "MS" THEN PRINT "MICROSOFT .MAJOR SOFTWARE SUPPLIER: SOMETIMES USED BY IBM FOR PC SOFTWARE"
IF A$ = "MSG" THEN PRINT "MESSAGE/MESSENGER"
IF A$ = "MSS" THEN PRINT "MASSIVE STORAGE SYSTEM"
IF A$ = "MUDA" THEN PRINT "ELIMINATING WASTE .JAPANESE MANUFACTURING PHILOSOPHY"
IF A$ = "MUX" THEN PRINT "MULTIPLEXER"
IF A$ = "MVA/SME" THEN PRINT "MACHINE VISION ASSOCIATION.SME AFFILIATE SPECIALIZING IN MACHINE VISION TECHNOLOGY"
IF A$ = "MVS" THEN PRINT "MULTIPLE VIRTUAL STORAGE.IBM GENERAL PURPOSE, TOP OF THE LINE, OPERATING SYSTEM"
IF A$ = "MVS/XA" THEN PRINT "MULTIPLE VIRTUAL STORAGE/EXTENDED ARCHITECTURE"
IF A$ = "NAM" THEN PRINT "NATIONAL ASSOCIATION OF MANUFACTURERS"
IF A$ = "NAMRI" THEN PRINT "NORTH AMERICAN MFG. RESEARCH INSTITUTION.GROUP DEDICATED TO ADVANCING THE CAUSE OF MFG. RESEARCH"
IF A$ = "NASA" THEN PRINT "NATIONAL AERONAUTICS AND SPACE ADMINISTRATION"
IF A$ = "NATA" THEN PRINT "NORTH AMERICAN TELECOMMUNICATIONS ASSOCIATION"
IF A$ = "NATO" THEN PRINT "NORTH ATLANTIC TREATY ORGANIZATION"
IF A$ = "NBS" THEN PRINT "NATIONAL BUREAU OF STANDARDS"
IF A$ = "NC" THEN PRINT "NUMERICAL CONTROL .PRE-ASSIGNED INSTRUCTIONS FOR MACHINE TOOLS"
IF A$ = "NCGA" THEN PRINT "NATIONAL COMPUTER GRAPHICS ASSOCIATION.ORGANIZATION DEDICATED TO ADVANCING THE CAUSE OF COMPUTER GRAPHICS"
IF A$ = "NCMA" THEN PRINT "NATIONAL COMPUTER MAINTENANCE ASSOCIATION"
IF A$ = "NDT" THEN PRINT "NON-DESTRUCTIVE TESTING"
IF A$ = "NETBIOS" THEN PRINT "NETWORK BASIC INPUT/OUTPUT SYSTEM .TOKEN-RING PROGRAM FOR IBM PC LAN"
IF A$ = "NIU" THEN PRINT "NETWORK INTERFACE UNIT.A COMPUTER DEVICE TO MAP NETWORK INTERFACE W/O BACKPLANE INTERFACE"
IF A$ = "NLP" THEN PRINT "NATURAL LANGUAGE PROCESSING .PEOPLE LITERATE COMPUTERS VIA COMPUTATIONAL LINGUISTICS & A.I."
IF A$ = "NMTBA" THEN PRINT "NATIONAL MACHINE TOOL BUILDERS ASSOCIATION"
IF A$ = "NORC" THEN PRINT "NAVAL ORDNANCE RESEARCH CALCULATOR.IBM'S MOST POWERFUL COMPUTER IN 1954"
IF A$ = "NSEA" THEN PRINT "NATIONAL SPECIAL EDUCATION ALLIANCE .ORGANIZATION HELPING DISABLED PERSONS BENEFIT FROM COMPUTERS"
IF A$ = "NSF" THEN PRINT "NATIONAL SCIENCE FOUNDATION"
IF A$ = "NSPE" THEN PRINT "NATIONAL SOCIETY OF PROFESSIONAL ENGINEERS.SOCIETY OF PROFESSIONALLY REGISTERED ENGINEERS"
IF A$ = "NTDA" THEN PRINT "NATIONAL TELECOMMUNICATIONS DEALERS ASSOC."
IF A$ = "NTU" THEN PRINT "NATIONAL TECHNOLOGICAL UNIVERSITY .U.S. UNIV. DEDICATED TO SATELLITE BROADCASTS OF TECHNICAL STUDIES"
IF A$ = "NUMMI" THEN PRINT "NEW UNITED MOTORS MANUFACTURING INC..G.M./TOYOTA AUTOMOBILE PLANT JOINT VENTURE"
IF A$ = "O/S" THEN PRINT "OPERATING SYSTEM.SUPERVISORY COMPUTER PROGRAM WHICH CONTROLS CPU-I/O DATA FLOW"
IF A$ = "OC" THEN PRINT "OPEN CONNECTOR.TYPE OF PERIPHERAL DRIVER"
IF A$ = "OCR" THEN PRINT "OPTICAL CHARACTER RECOGNITION .MACHINE IDENTIFICATION OF PRINTED CHARACTERS"
IF A$ = "OEM" THEN PRINT "ORIGINAL EQUIPMENT MANUFACTURER"
IF A$ = "OEM" THEN PRINT "OTHER/ORIGINAL EQUIPMENT MANUFACTURER"
IF A$ = "OIA" THEN PRINT "OPERATOR INFORMATION AREA .OPERATING AND STATUS INFORMATION LINE AT BOTTOM OF PC SCREEN"
IF A$ = "OLTP" THEN PRINT "ON LINE TRANSACTION PROCESSING.ACTION OF UPDATING BUSINESS AS RESULT OF CHANGE IN BUSINESS DATABASE"
IF A$ = "OM" THEN PRINT "OPERATIONS MANAGEMENT"
IF A$ = "ORACLE" THEN PRINT "OPERATING SYSTEM USING QUERY/PARALLEL PROCESSING"
IF A$ = "OSI" THEN PRINT "OPEN SYSTEMS INTERCONNECTION.7 LAYER MODEL NETWORK COMMUNICATION STANDARD"
IF A$ = "OTA" THEN PRINT "OFFICE OF TECHNOLOGY MANAGEMENT .GOVERNMENT DEPARTMENT"
IF A$ = "OTV" THEN PRINT "ORBIT TRANSFER VEHICLE.SPACE TUG FOR RAISING PAYLOADS FROM LOW TO HIGH ORBITS"
IF A$ = "PACS" THEN PRINT "PLANT AUTOMATION COMMUNICATIONS SYSTEM.IBM SERIES 1 CONTROLLER-BASED APPLICATION ENABLER"
IF A$ = "PAD" THEN PRINT "PACKET ASSEMBLER/DISASSEMBLER .ACCESS DEVICE FOR PACKET SWITCHING NODE (PSN) COMPUTER"
IF A$ = "PARC" THEN PRINT "PALO ALTO RESEARCH CENTER .XEROX THINK TANK"
IF A$ = "PASCAL" THEN PRINT ""
IF A$ = "PBX" THEN PRINT "PRIVATE AUTOMATIC BRANCH EXCHANGE .TYPE OF BUSINESS TELEPHONE SYSTEM"
IF A$ = "PC" THEN PRINT "PERSONAL COMPUTER .COMPUTER CAPABLE OF STAND-ALONE PROCESSING OR LINKING TO HOST"
IF A$ = "PC/IDU" THEN PRINT "PERSONAL COMPUTER IMAGE DOCUMENT UTILITY.IBM DOCUMENT IMAGE HANDLING FACILITY BETWEEN HOST AND PC"
IF A$ = "PCB" THEN PRINT "PRINTED CIRCUIT BOARDS.CIRCUIT BOARD W/ ELECT. CONNECTIONS VIA CONDUCTIVE MATERIAL ON BOARD"
IF A$ = "PCD" THEN PRINT "POLYCRYSTALLINE DIAMOND"
IF A$ = "PCD" THEN PRINT "PROCESS CONTROL DEVICES"
IF A$ = "PCLP" THEN PRINT "PERSONAL COMPUTER LAN PROGRAM .IBM'S LOCAL AREA NETWORK PROGRAM"
IF A$ = "PCM" THEN PRINT "PULSE CODE MODULATION"
IF A$ = "PCTFE" THEN PRINT "POLYCHLOROTRIFLUOROETHYLENE"
IF A$ = "PDDI" THEN PRINT "PRODUCT DEFINITION DATA INTERFACE .MINIMUM DATA NEEDED TO FOR INTEGRATED PARTS MANUFACTURING SYSTEM"
IF A$ = "PDES" THEN PRINT "PRODUCT DESIGN EXCHANGE SPECIFICATION .2ND GEN. IGES FILE FOR PRODUCT MODEL INFO CAPTURE & TRANSMITTAL"
IF A$ = "PDF" THEN PRINT "PROGRAM DEVELOPMENT FACILITY.AN IBM ENVIRONMENT IN (ES)**3 {E-S CUBED}"
IF A$ = "PDL" THEN PRINT "PROGRAM DEVELOPMENT LANGUAGE"
IF A$ = "PDM" THEN PRINT "PLASMA DISPLAY MATRIX .ORANGE COLORED, HIGH RESOLUTION, NEON GAS, FLAT SCREEN TECHNOLOGY"
IF A$ = "PDS" THEN PRINT "PERSONAL DECISION SERIES.AN IBM DSS DESIGNED FOR BUSINESS PROFESSIONAL IBM PC USERS"
IF A$ = "PE" THEN PRINT "PROCESSING ELEMENT"
IF A$ = "PE" THEN PRINT "PROFESSIONAL ENGINEER .PROFESSIONAL & LEGAL ACCREDIDATION FOR ENGINEERING PROFESSIONALS"
IF A$ = "PEL" THEN PRINT "PICTURE ELEMENT .SAME AS PIXEL"
IF A$ = "PFKEY" THEN PRINT "PROGRAM FUNCTION KEY.KEY WHICH PASSES SIGNAL TO PROGRAM CALLING FOR PRTICULAR FUNCTION"
IF A$ = "PGF" THEN PRINT "PRESENTATION GRAPHICS FEATURE .HIGH LEVEL GRAPHICS MACROS USING GDDM INSTRUCTIONS"
IF A$ = "PHD" THEN PRINT "DOCTORATE DEGREE.COLLEGE/UNIVERSITY SCIENCE DEGREE- GRADUATE LEVEL"
IF A$ = "PICS" THEN PRINT "PRODUCTION INVENTORY CONTROL SYSTEM .IBM SOFTWARE UTILIZED BY IRVINE DIVISIONS FOR MRP-CONTAINS IR SCREENS"
IF A$ = "PIF" THEN PRINT "PROGRAM INFORMATION FILES .FILES USED FOR PRINTING/PLOTTING FROM A PC"
IF A$ = "PILOT" THEN PRINT "PROGRAMMED INQUIRY LEARNING OR TEACHING .IBM COMMAND-TYPE AUTHORING LANGUAGE FOR COMPUTER ASSISTED INSTRUCTION"
IF A$ = "PIO" THEN PRINT "PROGRAMMED INPUT/OUTPUT"
IF A$ = "PIXEL" THEN PRINT "PICTURE ELEMENT .SMALLEST INDEPENDENTLY CONTROLLABLE ELEMENT OF DISPLAY SPACE"
IF A$ = "PLC" THEN PRINT "PROGRAMMABLE LOGIC CONTROLLER .MICROPROCESSOR BASED DEVICE CAPABLE OF CONTROLLING MULT. FUNCTIONS"
IF A$ = "PLD" THEN PRINT "PROGRAMMABLE LOGIC DEVICE"
IF A$ = "PL1" THEN PRINT "PROGRAMMING LANGUAGE"
IF A$ = "PMS IV" THEN PRINT "PROJECT MANAGEMENT SYSTEM IV.IBM FULL FEATURE PROJECT MANAGEMENT SYSTEM"
IF A$ = "POS" THEN PRINT "PROGRAMMABLE OPTIONS SELECT"
IF A$ = "POSI" THEN PRINT "PROMOTION OF OPEN SYSTEMS INTERCONNECTION .JAPANESE NETWORKING STANDARDIZATION GROUP"
IF A$ = "POST" THEN PRINT "POST PROCESSOR.SOFTWARE THAT CUSTOMIZES CLFILES FOR SPECIFIC MACHINE TOOL CONTROLS"
IF A$ = "PPM" THEN PRINT "PAGES PER MINUTE.PRINTING SPEED"
IF A$ = "PROFS" THEN PRINT "PROFESSIONAL OFFICE SYSTEMS .IBM SOFTWARE SYSTEM WITH PERSONAL CALENDARING, DOCUMENT CREATION, ETC"
IF A$ = "PROJACS" THEN PRINT "PROJECT ANALYSIS AND CONTROL SYSTEM .SET OF IBM PROGRAMS FOR CONTROLLING PROJECTS WITHIN CONSTRAINTS"
IF A$ = "PROLOG" THEN PRINT "PROGRAMMING IN LOGIC.AI PROG. LANG. DEVELOPED AT UNIV. OF MARSEILLES; USED IN EUROPE/JAPAN"
IF A$ = "PROM" THEN PRINT "PROGRAMMABLE READ ONLY MEMORY .USER PROGRAMMABLE COMPUTER MEMORY FOR DATA READS"
IF A$ = "PROPLAN" THEN PRINT "PROCESS PLANNING SYSTEM .SIEMENS RESEARCH LAB LISP-BASED SOFTWARE FOR TURNED PARTS"
IF A$ = "PSL" THEN PRINT "PORTABLE STANDARD LISP.TRANSPORTABLE LISP USED AT U. OF U.; INTERMACHINE TRANSPARENT"
IF A$ = "PSN" THEN PRINT "PACKET SWITCHING NODE .AN INTELLIGENT COMMUNICATIONS PROCESSOR"
IF A$ = "PTFE" THEN PRINT "POLYTETRAFLUOROETHYLENE"
IF A$ = "PTP" THEN PRINT "POINT TO POINT.PROGRAMMING & MACHINING VIA POSITIONING, RATHER THAN CONTROLLED MOVES"
IF A$ = "PWM" THEN PRINT "PROFESSIONAL WORK MANAGER .IBM PC/HOST ENVIRON; MANAGE PROJECTS, CREATE TASKS, AUTOMATE ACTIVITY"
IF A$ = "QBE" THEN PRINT "QUERY-BY-EXAMPLE.IBM DEVELOPED DATABASE MANAGEMENT SYSTEM"
IF A$ = "QMF" THEN PRINT "QUERY MANAGEMENT FACILITY"
IF A$ = "R&D" THEN PRINT "RESEARCH AND DEVELOPMENT.IBM DATABASE QUERY FEATURE"
IF A$ = "R/W" THEN PRINT "READ/WRITE"
IF A$ = "R/W" THEN PRINT "READ/WRITE MEMORY .CONTINUOUSLY CHANGEABLE MEMORY; RAM'S ARE R/W MEMORIES"
IF A$ = "RADAR" THEN PRINT "RADIO DETECTING AND RANGING"
IF A$ = "RAM" THEN PRINT "RANDOM ACCESS MEMORY.COMPUTER MEMORY AVAILABLE FOR WRITING OR READING-TEMP. WORKING AREA"
IF A$ = "RAV" THEN PRINT "ROBOTIC AIR VEHICLE .PILOTLESS AIRCRAFT EMPLOYING AI SOFTWARE TO FLY THE PLANE"
IF A$ = "RDR" THEN PRINT "RE-DIRECTOR"
IF A$ = "RDR" THEN PRINT "READER"
IF A$ = "RECCE" THEN PRINT "GENERAL DYNAMICS EXTERNAL AIRCRAFT RECONNAISANCE POD"
IF A$ = "RESLIM" THEN PRINT "RESOURCE LIMITER.IBM SYSTEM USAGE MONITOR/LIMITER"
IF A$ = "RFE" THEN PRINT "REACH FOR EXCELLENCE"
IF A$ = "RFI" THEN PRINT ""
IF A$ = "RFP" THEN PRINT "REQUEST FOR PROPOSAL"
IF A$ = "RFTDCA" THEN PRINT "REVISABLE-FORM TEXT DOCUMENT CONTENT ARCHITECTURE .IBM DISPLAYWRITE/370 TEXT FORMAT"
IF A$ = "RI/SME" THEN PRINT "ROBOTICS INTERNATIONAL.SME AFFILIATE SPECIALIZING IN MANUFACTURING-ROBOTICS TECHNOLOGY"
IF A$ = "RIA" THEN PRINT "ROBOTICS INDUSTRIES ASSOCIATION .ORGANIZATION OF ROBOTICS INDUSTRY"
IF A$ = "RISC" THEN PRINT "REDUCED INSTRUCTION SET CODE"
IF A$ = "RJE" THEN PRINT "REMOTE JOB ENTRY.COMPUTER DATA INPUT FROM REMOTE TERMINAL VIA COMMUNICATION LINE"
IF A$ = "RLL" THEN PRINT ""
IF A$ = "RLL" THEN PRINT "RUN LENGTH LIMITED.PC CONTROLLER CAPABLE OF INCREASING HARD DISK STORAGE AND SPEED"
IF A$ = "RO" THEN PRINT "READ ONLY"
IF A$ = "ROCF" THEN PRINT "REMOTE OPERATOR CONSOLE FACILITY.CAPABLE OF ROUTING SELECTED MESSAGES TO ALTERNATE OPERATOR STATIONS"
IF A$ = "ROM" THEN PRINT "READ ONLY MEMORY.COMPUTER MEMORY AVAILABLE FOR READING ONLY"
IF A$ = "ROM-BIOS" THEN PRINT "READ ONLY MEMORY-BASIC INPUT OUTPUT SYSTEM.IBM PROGRAM CODE WHICH IS PERMANENTLY ETCHED IN COMPUTER MEMORY"
IF A$ = "RPG11" THEN PRINT "PROGRAMMING LANGUAGE"
IF A$ = "RPL" THEN PRINT "REMOTE PROGRAM LOAD .PROGRAM LOAD TO A PC VIA A NETWORK"
IF A$ = "RPM" THEN PRINT "REVOLUTIONS PER MINUTE"
IF A$ = "RPQ" THEN PRINT "REMOTE PROGRAM QUERY?"
IF A$ = "RSCS" THEN PRINT "REMOTE SPOOLING COMMUNICATIONS SUBSYSTEM.TRANSFERS DATA BETWEEN IBM VIRTUAL MACHINES AND REMOTE USERS"
IF A$ = "RSRA" THEN PRINT "ROTOR SYSTEMS RESEARCH AIRCRAFT .SIKORSKY X-WING ROTORCRAFT"
IF A$ = "RT" THEN PRINT "RISC TECHNOLOGY .IBM PC USING UNIX-BASED AIX OPERATING SYSTEM & RISC"
IF A$ = "RTD" THEN PRINT "RAPID TRANSIT DISTRICT"
IF A$ = "RTIC" THEN PRINT "REAL TIME INTERFACE CONNECTOR .ADAPTER CARD FOR REAL TIME DEVICE INTERFACE"
IF A$ = "RTOS" THEN PRINT "REAL TIME OPERATING SYSTEMS"
IF A$ = "SAA" THEN PRINT "SYSTEMS APPLICATION ARCHITECTURE.IBM'S SPEC. OF SOFTWARE APPL'S., COMMUN. PROTOCOLS, & USER INTERFACES"
IF A$ = "SAGE" THEN PRINT "THE LARGEST VACUUM TUBE COMPUTER USED BY USAF IN 50'S"
IF A$ = "SAP" THEN PRINT "SERVICE ACCESS POINTS .MODIFICATION CAPABILITIES OF COMPUTER SYSTEMS ARCHITECTURE"
IF A$ = "SAS" THEN PRINT "STATISTICAL ANALYSIS SYSTEM"
IF A$ = "SCARA" THEN PRINT "SELECTIVE COMPLIANCE ASSEMBLY ROBOT ARM .LOW COST, HIGH SPEED, ASSY. ROBOT MOVING MOSTLY ON HORIZONTAL PLANE"
IF A$ = "SCRAMJET" THEN PRINT "SUPERSONIC COMBUSTION RAM JET"
IF A$ = "SCRIPT" THEN PRINT "SCRIPT.FORMATTER COMPONENT OF DCF"
IF A$ = "SCSI" THEN PRINT "SMALL COMPUTER SYSTEMS INTERFACE.PRONOUNCED SCUZZY"
IF A$ = "SDI" THEN PRINT "STRATEGIC DEFENSE INITIATIVE.SPACE-BASED STAR WARS MISSILE DEFENSE PROGRAM"
IF A$ = "SDLC" THEN PRINT "SYNCHRONOUS DATA LINK COMMUNICATION .IBM COMMUNICATION PROTOCOL"
IF A$ = "SDRC" THEN PRINT "STRUCTURED DYNAMICS RESEARCH CORPORATION.AUTHOR OF CAEDS CADCAM SOFTWARE"
IF A$ = "SER" THEN PRINT "SURFACE ELECTRICAL RESISTIVITY"
IF A$ = "SERIES 1" THEN PRINT "NEW IBM PROCESSOR USED IN LANS"
IF A$ = "SFM" THEN PRINT "SURFACE FEET PER MINUTE"
IF A$ = "SFT" THEN PRINT "SYSTEM FAULT TOLERANCE"
IF A$ = "SGML" THEN PRINT "STANDARD GENERAL MARKUP LANGUAGE.AN ANSI DOCUMENT FORMAT STANDARD"
IF A$ = "SIG" THEN PRINT "SPECIAL INTEREST GROUP"
IF A$ = "SLT" THEN PRINT "SOLID LOGIC TECHNOLOGY.CIRCUIT TECHNOLOGY INTRODUCED ON IBM SYSTEM/360"
IF A$ = "SME" THEN PRINT "SOCIETY OF MANUFACTURING ENGINEERS"
IF A$ = "SNA" THEN PRINT "SYSTEMS NETWORK ARCHITECTURE.IBM; ORGANIZED STRUCTURE FOR MULTIPLE COMPUTER/COMM. NETWORKS"
IF A$ = "SNADS" THEN PRINT "SNA DISTRIBUTION SERVICES .IBM MAIL SERVICE FACILITY NOT REQUIRING DIRECT MAINFRAME INTERVENTION"
IF A$ = "SNAFU" THEN PRINT "SITUATION NORMAL-ALL FOULED UP.MILITARY EXPRESSION COINED DURING WORLD WAR II"
IF A$ = "SNOBOL" THEN PRINT "STRING ORIENTED SYMBOLIC LANGUAGE .COMPUTER PROGRAMMING LANGUAGE FOR MANIPULATING STRINGS OF SYMBOLS"
IF A$ = "SOI" THEN PRINT "SILICON ON INSULATOR.INTEGRATED CIRCUIT CHIP MATERIAL ALLOWING SUPER FAST CLOCK SPEEDS"
IF A$ = "SOS" THEN PRINT "SILICON ON SAPPHIRE .INTEGRATED CIRCUIT CHIP MATERIAL ALLOWING SUPER FAST CLOCK SPEEDS"
IF A$ = "SPAG" THEN PRINT "STANDARDS PROMOTION & APPLICATION GROUP .EUROPEAN NETWORKING STANDARDIZATION GROUP"
IF A$ = "SPC" THEN PRINT "STATISTICAL PROCESS CONTROL .RANDOM SAMPLING OF TARGET DIMENSIONS TO ENABLE CORRECTIVE MEASURES"
IF A$ = "SPE" THEN PRINT "SYSTEM PRODUCT EDITOR .ALSO CALLED XEDIT"
IF A$ = "SPOOL" THEN PRINT "SIMULTANEOUS PERIPHERAL OPERATIONS ONLINE .IBM"
IF A$ = "SPOT" THEN PRINT "SELECTION, PLANNING, OPPORTUNITY, TECHNOLOGY.SME SPONSORED AWARD FOR COMPANIES ACHIEVING EXCELLENCE IN LASER TECH."
IF A$ = "SQL" THEN PRINT "STRUCTURED QUERY LANGUAGE .IBM RELATIONAL DATABASE PROGRAMMING LANGUAGE"
IF A$ = "SRB" THEN PRINT "SOLID ROCKET BOOSTER"
IF A$ = "SRPI" THEN PRINT "SERVER-REQUESTOR PROGRAMMING INTERFACE...MAJOR SUBSET OF LU6.2/APPC"
IF A$ = "SRPI" THEN PRINT "SERVER-REQUESTOR PROGRAMMING INTERFACE.IBM INTERFACE TOOLS FOR DEVELOPING INTERACTIVE HOST/PC APPLICATIONS"
IF A$ = "SRV" THEN PRINT "SERVER.NETWORK SERVER"
IF A$ = "SSCAD" THEN PRINT "SPACE STRUCTURES COMPUTER AIDED DESIGN"
IF A$ = "STOL" THEN PRINT "SHORT TAKEOFF AND LANDING"
IF A$ = "STV" THEN PRINT "SPACE TRANSPORT VEHICLE"
IF A$ = "ST506" THEN PRINT ""
IF A$ = "SUMMIT" THEN PRINT "IBM 3190 MAINFRAME CURRENTLY UNDER DEVELOPMENT- FUTURE TOP-OF-THE-LIN"
IF A$ = "SYM" THEN PRINT "SYMBOLIC"
IF A$ = "SYSRQ" THEN PRINT "SYSTEM REQUEST.KEY WHICH SIGNALS HOST COMPUTER DURING HOST SESSION"
IF A$ = "TAC" THEN PRINT "THE APPLICATION CONNECTION.LOTUS PRODUCT FOR PC-PC & PC-MAINFRAME APPLICATION CONNECTIONS"
IF A$ = "TASC+" THEN PRINT "TELL, ASK, SPECIFY, CHECK, AND ACKNOWLEDGE.MANAGEMENT PHILOSOPHY"
IF A$ = "TCA" THEN PRINT "TELE-COMMUNICATIONS ASSOCIATION"
IF A$ = "TCAS" THEN PRINT "TRAFFIC ALERT AND COLLISION AVOIDANCE .COLLISION AVOIDANCE SYSTEM FOR AIRCRAFT"
IF A$ = "TCE" THEN PRINT "TETRACHLOROETHYLENE"
IF A$ = "TCSEE" THEN PRINT "TECH. COORDINATOR SATELLITE EDUCATION EXCHANGE.IBM INTERACTIVE SATELLITE EDUCATION NETWORK FOR TECH. COORDINATORS"
IF A$ = "TECHMOD" THEN PRINT "TECHNOLOGY MODERNIZATION PROGRAM.GOVERNMENT SPONSORED CIM R&D FUNDING PROGRAM"
IF A$ = "TFE" THEN PRINT "TEFLON"
IF A$ = "TGC" THEN PRINT "TOOL & GAGE CONTROL"
IF A$ = "TIM" THEN PRINT "TOKEN/NET INTERFACE MODULE"
IF A$ = "TIR" THEN PRINT "TOTAL INDICATOR RUNOUT"
IF A$ = "TMS" THEN PRINT "TOOL MANAGEMENT SYSTEM"
IF A$ = "TOP" THEN PRINT "TECHNICAL AND OFFICE PROTOCOL .BOEING GENERATED 7-LEVEL ISO COMPATIBLE LANGUAGETOP"
IF A$ = "TPA" THEN PRINT "TARGET POINT ALIGN.SIMULTANEOUS RETURN OF ALL MACHINE AXES TO ALIGNMENT OR ZERO POSITION"
IF A$ = "TQC" THEN PRINT "TOTAL QUALITY CONTROL"
IF A$ = "TRI" THEN PRINT "TRICHLOROETHYLENE"
IF A$ = "TS" THEN PRINT "TERMINAL SERVER"
IF A$ = "TSO" THEN PRINT "TIME SHARING OPTION .MVS ENVIRONMENT PROVIDING CONVER. TIME SHARING FROM REMOTE TERMINALS"
IF A$ = "TSO" THEN PRINT "TIME SHARING OPTION .MVS ENVIRONMENT PROVIDING CONVER. TIME SHARING FROM REMOTE TERMINALS"
IF A$ = "TSR" THEN PRINT "TERMINATE STAY RESIDENT PC PROGRAMS"
IF A$ = "TTL" THEN PRINT ""
IF A$ = "TTY" THEN PRINT "TELETYPEWRITER.TERMINAL EVALUATION MODE, COMPATIBLE WITH IBM KEYBOARD"
IF A$ = "TWINAX" THEN PRINT "TWINAXIAL WIRE.USED TO CONNECT 5520 WORD PROCESSING TERMINALS TO CONTROLLERS"
IF A$ = "T1" THEN PRINT "REMOTE T1 .TELEPHONE LINE USED FOR MAINFRAME TO REMOTE CONTOLLER COMMUNICATIONS"
IF A$ = "UART" THEN PRINT "UNIVERSAL ASYNCHRONOUS RECEIVER/TRANSMITTER"
IF A$ = "UAW" THEN PRINT "UNITED AUTOMOBILE WORKERS"
IF A$ = "UIG" THEN PRINT "ULTRASONIC IMPACT GRINDING"
IF A$ = "UIS" THEN PRINT "UNIVERSAL INFORMATION SERVICE .AT&T'S NEXT GENERATION ISDN REPLACEMENT PRODUCT"
IF A$ = "UNIX" THEN PRINT "OPERATING SYSTEM CREATED AT BELL LABS: C LANGUAGE ALLOWS PORTABILITY"
IF A$ = "USW" THEN PRINT "UNITED STEEL WORKERS.STEEL WORKERS UNION"
IF A$ = "VAN" THEN PRINT "VALUE ADDED NETWORKING"
IF A$ = "VAR" THEN PRINT "VALUE ADDED RESELLER"
IF A$ = "VAX" THEN PRINT "DEC COMPUTER"
IF A$ = "VDI" THEN PRINT "VIRTUAL DEVICE INTERFACE"
IF A$ = "VDM" THEN PRINT "VIRTUAL DEVICE METAFILE"
IF A$ = "VDT" THEN PRINT "VIDEO DISPLAY TERMINAL.SAME AS A CRT"
IF A$ = "VGA" THEN PRINT "VIDEO CASSETTE RECORDER"
IF A$ = "VGA" THEN PRINT "VIDEO GRAPHICS ARRAY.IBM COLOR GRAPHICS STANDARD USED ON PERSONAL COMPUTER/2 SERIES"
IF A$ = "VLSI" THEN PRINT "VERY LARGE SCALE INTEGRATED CIRCUIT"
IF A$ = "VM" THEN PRINT "VIRTUAL MACHINE .IBM INTERACTIVE COMPUTING OPERATING SYSTEM"
IF A$ = "VNET" THEN PRINT "IBM TELEPROCESSING NETWORK"
IF A$ = "VSAM" THEN PRINT "VIRTUAL STORAGE ACCESS METHOD .AN IBM FILE STRUTURE ALLOWING "; KEYED; "SEARCH RETRIEVALS"
IF A$ = "VSE" THEN PRINT "VIRTUAL STORAGE EXTENDED.AN OPERATING SYSTEM THAT IS AN EXTENSION OF DOS/VS"
IF A$ = "VTAM" THEN PRINT "VIRTUAL TELECOMMUNICATIONS ACCESS METHOD.IBM SOFTWARE MANAGING I/O BETWEEN HOST MAINFRAME & OTHER COMPUTERS"
IF A$ = "VTL" THEN PRINT "VERTICAL TURNING LATHES"
IF A$ = "VTS" THEN PRINT "VIRTUAL TERMINAL SERVICE.APPLICATION DATA EXCHANGE METHOD"
IF A$ = "WAN" THEN PRINT "WIDE AREA NETWORKING.ACCESS OF REMOTE COMPUTER TERMINALS & SYSTEMS VIA COMMON LINKS"
IF A$ = "WATS" THEN PRINT "WIDE AREA TELECOMMUNICATIONS SERVICE.MESSAGE TELEPHONE SERVICE"
IF A$ = "WCDP" THEN PRINT "WORK CELL DEVICE PROGRAMMING.NEW CIM NAME FOR N.C. PROGRAMMING"
IF A$ = "WFT" THEN PRINT "WINOGRAD FOURIER RESPONSE"
IF A$ = "WIP" THEN PRINT "WORK IN PROGRESS"
IF A$ = "WO" THEN PRINT "WRITE ONLY"
IF A$ = "WORM" THEN PRINT "WRITE ONCE-READ MOSTLY.OPTICAL DISK FORMATTING TECHNIQUE USING SPIRAL PATTERN OF PITS"
IF A$ = "WSCTRL" THEN PRINT "WORKSTATION CONTROL MODE.PC MODE FOR COMMANDS WHICH CONTROL SESSION DATA DISPLAY"
IF A$ = "WSF" THEN PRINT "WORKSTATION FUNCTION"
IF A$ = "WYGINS" THEN PRINT "WHAT YOU GET IS NO SURPRISE(WIGGINS).SOFTWARE ACRONYM: WYSIWYG PROGRAM COMPATIBLE W/ MOST OUTPUT DEVICES"
IF A$ = "WYSIWYG" THEN PRINT "WHAT YOU SEE IS WHAT YOU GET(WHIZ-E-WIG).SOFTWARE ACRONYM: YOU GET WHAT YOU SEE, AND VISA-VERSA"
IF A$ = "X.25" THEN PRINT "REMOTE X.25 .PROTOCOL CONNECTING 3274 CONTROLLER VIA PACKET-SWITCHED NETWORK"
IF A$ = "XA" THEN PRINT "EXTENDED ARCHITECTURE .BASIC IBM COMPUTER ARCHITECTURE USED WITH SYSTEM/370"
IF A$ = "XCON" THEN PRINT "EXPERT CONFIGURER .CARNEGIE MELON/DEC DEVELOPED RULE-BASED COMPUTER-CONFIGURATION PRGM."
IF A$ = "XEDIT" THEN PRINT "CMS EDITOR.SYSTEM PRODUCT EDITOR"
IF A$ = "XMA" THEN PRINT "EXPANDED MEMORY ADAPTER .IBM EXPANDED MEMORY FUNCTION BOARD FOR 3270PC'S."
IF A$ = "XMODEM" THEN PRINT "COMMUNICATION PROTOCOL"
IF A$ = "ZETALISP" THEN PRINT "DESCENDANT OF MACLISP LANGUAGE, DESIGNED FOR SYMBOLICS LISP MACHINES"
IF A$ = "3GL" THEN PRINT "3RD GENERATION LANGUAGE"
IF A$ = "3M" THEN PRINT "MINNESOTA MINING AND MANUFACTURING"
IF A$ = "4GL" THEN PRINT "4TH GENERATION LANGUAGE"
IF A$ = "5GL" THEN PRINT "5TH GENERATION LANGUAGE .ADV. SOFTWARE CAPABLE OF UTILIZING PARRALLEL & KNOWLEDGE PROCESSING"
IF A$ = "802.2" THEN PRINT "IEEE INTERFACE"
IF A$ = "802.5" THEN PRINT "IEEE INTERFACE"
END SUB

SUB DIR
        A = INSTR(A$, " ")
        IF A = 0 THEN
                FILES
        ELSE
                B$ = MID$(A$, A, LEN(A$))
                FILES B$
        END IF
END SUB

SUB DIVIDE
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q / W
END SUB

SUB DRW
        A = INSTR(A$, CHR$(34))
        E$ = MID$(A$, A, LEN(A$))
        DRAW "X" + VARPTR$(E$)
END SUB

SUB DTE
        A = INSTR(A$, " ")
        IF A = 0 THEN
                PRINT DATE$
        ELSE
                E$ = MID$(A$, A, LEN(A$))
                DATE$ = E$
        END IF
END SUB

SUB EMERGSTOP
STOP
END SUB

SUB ERO
        A = INSTR(A$, " ")
        B = VAL(MID$(A$, A, LEN(A$)))
        ON B GOTO 5540, 5550, 5560, 5570, 5580, 5590, 5600, 5610, 5620, 5630, 5640, 5650, 5660, 5670, 5680, 5690, 5700, 5710, 5720, 5730, 5740, 5750, 5760, 5770, 5780, 5790
     PRINT "ILLEGAL SUB CALL": GOTO 31
5540 PRINT "SYNTAX ERROR": GOTO 31
5550 PRINT "WORD NOT FOUND": GOTO 31
5560 PRINT "MISSING OPERAND ERROR": GOTO 31
5570 PRINT "COLOR OVERFLOW ERROR": GOTO 31
5580 PRINT "OUT OF MEMORY": GOTO 31
5590 PRINT "INVALID COLOR": GOTO 31
5600 PRINT "DEVICE UNAVAILABLE": GOTO 31
5610 PRINT "NUMBER OUT OF RANGE": GOTO 31
5620 PRINT "NEXT WITHOUT FOR": GOTO 31
5630 PRINT "FOR WITHOUT NEXT": GOTO 31
5640 PRINT "ACCESS WITHOUT BOSS": GOTO 31
5650 PRINT "UNIDENTIFIED LINE NUMBER": GOTO 31
5660 PRINT "GOSUB WITHOUT RETURN": GOTO 31
5670 PRINT "RETURN WITHOUT GOSUB": GOTO 31
5680 PRINT "RESUME WITHOUT ERROR": GOTO 31
5690 PRINT "VOLUME OVERFLOW": GOTO 31
5700 PRINT "VOLUME UNDERFLOW": GOTO 31
5710 PRINT "OVERFLOW": GOTO 31
5720 PRINT "UNDERFLOW": GOTO 31
5730 PRINT "DIVISION BY ZERO": GOTO 31
5740 PRINT "ACCESS DENIED": GOTO 31
5750 PRINT "INVALID DRIVE NAME": GOTO 31
5760 PRINT "INVALID SUB-DIRECTORY": GOTO 31
5770 PRINT "TYPE MISMATCH": GOTO 31
5780 PRINT "STATEMENT TOO COMPLEX": GOTO 31
5790 PRINT "ERROR OVERFLOW": GOTO 31
31 END SUB

SUB EXPAND
        A = INSTR(A$, "(")
        B = INSTR(A$, ",")
        C = INSTR(A$, ")")
        CX = VAL(MID$(A$, A + 1, B - 1))
        CY = VAL(MID$(A$, B + 1, C - 1))
        A = INSTR(A + 1, A$, "(")
        B = INSTR(B + 1, A$, ",")
        C = INSTR(C + 1, A$, ")")
        XSC = VAL(MID$(A$, A + 1, B - 1))
        YSC = VAL(MID$(A$, B + 1, C - 1))
        D = INSTR(C + 1, A$, ",")
        CH$ = MID$(A$, D + 1, LEN(A$))
        DEF SEG = &HF000
        FOR Z.SI = 1 TO LEN(CH$)
                CH = ASC(MID$(CH$, Z.SI, 1))
                FOR Z.I = 0 TO 7
                        Z.CHR(Z.I) = PEEK(&HFA6E + CH * 8 + Z.I)
                NEXT Z.I
                FOR Z.Y = 0 TO 7
                        FOR Z.J = 1 TO YSC
                                FOR Z.X = 0 TO 7
                                        Z.PIX = SGN(Z.CHR(Z.Y) AND 2 ^ (7 - Z.X))
                                        FOR Z.I = 1 TO XSC
                                                PSET (CX, CY), Z.PIX
                                                CX = CX + 1
                                        NEXT
                                NEXT
                                CX = CX - XSC * 8
                                CY = CY + 1
                        NEXT
                NEXT
                CX = CX + XSC * 8
                CY = CY - YSC * 8
        NEXT
        DEF SEG
END SUB

SUB FLS
        A = INSTR(A$, " ")
        IF A = 0 THEN
                FILES
        ELSE
                B$ = MID$(A$, A, LEN(A$))
                FILES B$
        END IF
END SUB

SUB GRAPHICS
IF LEFT$(A$, 3) = "CLS" THEN
        CLS
END IF
IF LEFT$(A$, 12) = "HIDE SURFACE" THEN
        HIDESURFACE
END IF
END SUB

SUB GTO
        A = INSTR(A$, " ")
        B = VAL(MID$(A$, A, LEN(A$)))
        J = B / 10
                FOR K = J TO LN
                        A$ = A$(K)
                        IF LN = 0 THEN
                                PRINT "Missing Operand Error"
                        END IF
                        COMMANDS
                NEXT K
END SUB

SUB HELP
END SUB

SUB HIDESURFACE
SP1 = X1 * (Y2 * Z3 - Y3 * Z2)
SP1 = (-1) * SP1
SP2 = X2 * (Y3 * Z1 - Y1 * Z3)
SP3 = X3 * (Y1 * Z2 - Y2 * Z1)
SP = SP1 - SP2 - SP3
PRINT "Please Hold..."
SLEEP 4
END SUB

SUB INPT
        A = INSTR(A$, " ")
        B$ = MID$(A$, A, LEN(A$))
        B = ASC(B$) - 65 + 33
        IF INSTR(A$, "$") = 0 THEN
                INPUT VAR(B)
        ELSE
                INPUT VAR$(B)
        END IF
END SUB

SUB INTDIVIDE
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q \ W
END SUB

SUB KY
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                IF A$ = "KEY LIST" THEN
                        KEY LIST
                END IF
                IF A$ = "KEY ON" THEN
                        KEY ON
                END IF
                IF A$ = "KEY OFF" THEN
                        KEY OFF
                END IF
        END IF
END SUB

SUB LAD
        A = INSTR(A$, " ")
        IF A = 0 THEN
                E$ = "NONAME.BAS"
        ELSE
                E$ = MID$(A$, A + 1, LEN(A$))
        END IF
        OPEN E$ FOR INPUT AS #1
        K = 0
        WHILE NOT EOF(1)
                K = K + 1
                LN = K
                LINE INPUT #1, A$(K)
        WEND
        FOR J = 1 TO LN
                PRINT J * 10; A$(J)
        NEXT J
        LN = K
        K = 0
        CLOSE 1
END SUB

SUB LNE
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, "-")
        D = INSTR(A$, ",")
        IF A > C THEN
                X2 = VAL(MID$(A$, A + 1, D - 1))
                Y2 = VAL(MID$(A$, D + 1, B - 1))
                C = INSTR(D + 1, A$, ",")
                C = VAL(MID$(A$, C + 1, LEN(A$)))
                LINE -(X2, Y2), C
        GOTO 29
        END IF
        A2 = INSTR(C, A$, "(")
        B2 = INSTR(C, A$, ")")
        D2 = INSTR(C, A$, ",")
        X1 = VAL(MID$(A$, A + 1, D - 1))
        Y1 = VAL(MID$(A$, D + 1, B - 1))
        X2 = VAL(MID$(A$, A2 + 1, D2 - 1))
        Y2 = VAL(MID$(A$, D2 + 1, B2 - 1))
        C = INSTR(D2 + 1, A$, ",")
        C = VAL(MID$(A$, C + 1, LEN(A$)))
        LINE (X1, Y1)-(X2, Y2), C
29 END SUB

SUB LST
        FOR PL = 1 TO LN
                PRINT LTRIM$(STR$(PL * 10)); " "; A$(PL)
        NEXT PL
END SUB

SUB MEMORY
PRINT FRE(0)
END SUB

SUB MODULATION
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q MOD W
END SUB

SUB MULTIPLY
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q * W
END SUB

SUB NW
        LN = 0
        J = 0
        FREQ = 0
        DUR = 0
        ERHAN = -1
        FOR K = 0 TO 399
                A$(K) = ""
        NEXT K
END SUB

SUB OT
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        PORT = VAL(MID$(A$, A + 1, B - 1))
        V = VAL(MID$(A$, B + 1, LEN(A$)))
        OUT PORT, V
END SUB

SUB PEK
     B = INSTR(A$, " ")
     E$ = MID$(A$, B + 1, LEN(A$))
     E = VAL(E$)
     PRINT PEEK(E)
END SUB

SUB PI
        PRINT USING "#.###############"; 3 + (1 / 7)
END SUB

SUB PKE
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        LCN = VAL(MID$(A$, A + 1, B - 1))
        V = VAL(MID$(A$, B + 1, LEN(A$)))
        POKE LCN, V
END SUB

SUB PLY
        A = INSTR(A$, CHR$(34))
        B$ = MID$(A$, A + 1, LEN(A$))
        IF B$ = "" THEN
                PRINT "Missing Operand Error"
                GOTO 32
        END IF
PLAY "X" + VARPTR$(B$)
32 END SUB

SUB PNT
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PAINT (Q, W), R
END SUB

SUB POWER
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q ^ W
END SUB

SUB PRNT
X$ = CHR$(34)
    A = INSTR(A$, X$)
    IF A = 0 THEN 670
    B = INSTR(A + 1, A$, X$)
    IF B = 0 THEN ZX = -1
    IF LEN(A$) = 5 OR LEN(A$) = 6 THEN PRINT : GOTO 56
    IF ZX = 0 THEN E$ = MID$(A$, A + 1, B)
    IF ZX = -1 THEN E$ = MID$(A$, A + 1, LEN(A$))
    A1 = INSTR(A$, ";"): IF A1 = 0 THEN 600 ELSE 630
600 B1 = INSTR(A$, ","): IF B1 = 0 THEN 610 ELSE 650
610 PRINT E$
    GOTO 56
630 PRINT E$;
    GOTO 56
650 PRINT E$,
    GOTO 56
670 IF A$ = "PRINT" THEN PRINT : GOTO 56
    IF A$ = "?" THEN PRINT : GOTO 56
    A = INSTR(A$, "ABS"): IF A = 0 THEN 730
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT ABS(E): GOTO 56
730 A = INSTR(A$, "ASC"): IF A = 0 THEN 770
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1)
    PRINT ASC(E$): GOTO 56
770 A = INSTR(A$, "ATN"): IF A = 0 THEN 810
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT ATN(E): GOTO 56
810 A = INSTR(A$, "CDBL"): IF A = 0 THEN 850
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT CDBL(E): GOTO 56
850 A = INSTR(A$, "CHR$"): IF A = 0 THEN 890
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT CHR$(E): GOTO 56
890 A = INSTR(A$, "CINT"): IF A = 0 THEN 930
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT CINT(E): GOTO 56
930 A = INSTR(A$, "COS"): IF A = 0 THEN 970
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT COS(E): GOTO 56
970 A = INSTR(A$, "CSNG"): IF A = 0 THEN 1010
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT CSNG(E): GOTO 56
1010 A = INSTR(A$, "EXP"): IF A = 0 THEN 1050
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT EXP(E): GOTO 56
1050 A = INSTR(A$, "FIX"): IF A = 0 THEN 1090
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT FIX(E): GOTO 56
1090 A = INSTR(A$, "FRE"): IF A = 0 THEN 1130
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT FRE(E): GOTO 56
1130 A = INSTR(A$, "HEX$"): IF A = 0 THEN 1170
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT HEX$(E): GOTO 56
1170 A = INSTR(A$, "INP"): IF A = 0 THEN 1210
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT INP(E): GOTO 56
1210 A = INSTR(A$, " INT"): IF A = 0 THEN 1250
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT INT(E): GOTO 56
1250 A = INSTR(A$, "LEN"): IF A = 0 THEN 1290
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1)
     PRINT LEN(E$): GOTO 56
1290 A = INSTR(A$, "LOG"): IF A = 0 THEN 1330
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT LOG(E): GOTO 56
1330 A = INSTR(A$, "OCT$"): IF A = 0 THEN 1370
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT OCT$(E): GOTO 56
1370 A = INSTR(A$, "PEEK"): IF A = 0 THEN 1410
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT PEEK(E): GOTO 56
1410 A = INSTR(A$, "PEN"): IF A = 0 THEN 1450
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT PEN(E): GOTO 56
1450 A = INSTR(A$, "PLAY"): IF A = 0 THEN 1490
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT PLAY(E): GOTO 56
1490 A = INSTR(A$, "POINT"): IF A = 0 THEN 1530
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT POINT(E): GOTO 56
1530 A = INSTR(A$, "POS"): IF A = 0 THEN 1570
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT POS(E): GOTO 56
1570 A = INSTR(A$, "RND"): IF A = 0 THEN 1610
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT RND(E): GOTO 56
1610 A = INSTR(A$, "SGN"): IF A = 0 THEN 1650
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SGN(E): GOTO 56
1650 A = INSTR(A$, "SIN"): IF A = 0 THEN 1690
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SIN(E): GOTO 56
1690 A = INSTR(A$, "SPACE$"): IF A = 0 THEN 1730
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SPACE$(E): GOTO 56
1730 A = INSTR(A$, "SPC"): IF A = 0 THEN 1770
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SPC(E); : GOTO 56
1770 A = INSTR(A$, "SQR"): IF A = 0 THEN 1810
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SQR(E): GOTO 56
1810 A = INSTR(A$, "STICK"): IF A = 0 THEN 1850
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT STICK(E): GOTO 56
1850 A = INSTR(A$, "STR$"): IF A = 0 THEN 1890
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT STR$(E): GOTO 56
1890 A = INSTR(A$, "STRIG"): IF A = 0 THEN 1930
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT STRIG(E): GOTO 56
1930 A = INSTR(A$, "TAB"): IF A = 0 THEN 1970
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT TAB(E); : GOTO 56
1970 A = INSTR(A$, "TAN"): IF A = 0 THEN 2010
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT TAN(E): GOTO 56
2010 A = INSTR(A$, "VAL"): IF A = 0 THEN 2050
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1)
     PRINT VAL(E$): GOTO 56
2050 A = INSTR(A$, "VARPTR$"): IF A = 0 THEN 2060
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1)
     PRINT VARPTR$(E$): GOTO 56
2060 A = INSTR(A$, " ")
     B = INSTR(A$, "$")
     IF B = 0 THEN PRINT VAR(ASC(MID$(A$, A + 1, LEN(A$)))): GOTO 56
     PRINT VAR$(ASC(MID$(A$, A + 1, LEN(A$)))): GOTO 56
56 END SUB

SUB PRSET
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PRESET (Q, W), R
END SUB

SUB PST
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PSET (Q, W), R
END SUB

SUB RAN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ = "TIMER" THEN
                RANDOMIZE TIMER
        GOTO 908
        END IF
        E = VAL(E$)
        RANDOMIZE E
908 END SUB

SUB READY
PRINT "Ready"
LINE INPUT A$
COMMANDS
END SUB

SUB RN
        FOR PL = 1 TO LN
                A$ = A$(PL)
                COMMANDS
        NEXT PL
END SUB

SUB RST
RESET
END SUB

SUB RUNTIME
IF ERR = 1 THEN PRINT "NEXT without FOR."
IF ERR = 37 THEN PRINT "Argument-count mismatch."
IF ERR = 2 THEN PRINT "Syntax error."
IF ERR = 38 THEN PRINT "Array not defined."
IF ERR = 3 THEN PRINT "RETURN without GOSUB."
IF ERR = 40 THEN PRINT "Variable required."
IF ERR = 4 THEN PRINT "Out of DATA."
IF ERR = 50 THEN PRINT "FIELD overflow."
IF ERR = 5 THEN PRINT "Illegal function call."
IF ERR = 51 THEN PRINT "Internal error."
IF ERR = 6 THEN PRINT "Overflow."
IF ERR = 52 THEN PRINT " Bad file name or number."
IF ERR = 7 THEN PRINT "Out of memory."
IF ERR = 53 THEN PRINT "File not found."
IF ERR = 8 THEN PRINT "Label not defined."
IF ERR = 54 THEN PRINT "Bad file mode."
IF ERR = 9 THEN PRINT "Subscript out of range."
IF ERR = 55 THEN PRINT "File already open."
IF ERR = 10 THEN PRINT "Duplicate definition."
IF ERR = 56 THEN PRINT "FIELD statement active."
IF ERR = 11 THEN PRINT "Division by zero."
IF ERR = 57 THEN PRINT "Device I/O error."
IF ERR = 12 THEN PRINT "Illegal in direct mode."
IF ERR = 58 THEN PRINT "File already exists."
IF ERR = 13 THEN PRINT "Type mismatch."
IF ERR = 59 THEN PRINT "Bad record length."
IF ERR = 14 THEN PRINT "Out of string space."
IF ERR = 61 THEN PRINT "Disk full."
IF ERR = 16 THEN PRINT "String formula too complex."
IF ERR = 62 THEN PRINT "Input past end of file."
IF ERR = 17 THEN PRINT "Cannot continue."
IF ERR = 63 THEN PRINT "Bad record number."
IF ERR = 18 THEN PRINT "Function not defined."
IF ERR = 64 THEN PRINT "Bad file name."
IF ERR = 19 THEN PRINT "No RESUME."
IF ERR = 67 THEN PRINT "Too many files."
IF ERR = 20 THEN PRINT "RESUME without error."
IF ERR = 68 THEN PRINT "Device unavailable."
IF ERR = 24 THEN PRINT "Device timeout."
IF ERR = 69 THEN PRINT "Communication-buffer overflow."
IF ERR = 25 THEN PRINT "Device fault."
IF ERR = 70 THEN PRINT "Permission denied."
IF ERR = 26 THEN PRINT "FOR without NEXT."
IF ERR = 71 THEN PRINT "Disk not ready."
IF ERR = 27 THEN PRINT "Out of paper."
IF ERR = 72 THEN PRINT "Disk-media error."
IF ERR = 29 THEN PRINT "WHILE without WEND."
IF ERR = 73 THEN PRINT "Feature unavailable."
IF ERR = 30 THEN PRINT "WEND without WHILE."
IF ERR = 74 THEN PRINT "Rename across disks."
IF ERR = 33 THEN PRINT "Duplicate label."
IF ERR = 75 THEN PRINT "Path/File access error."
IF ERR = 35 THEN PRINT "Subprogram NOT defined."
IF ERR = 76 THEN PRINT "Path NOT found."
20 END SUB

SUB SBSOUND
IF LEFT$(A$, 5) = "SOUND" THEN
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                SBERROR = -1
                GOTO AQ:
        END IF
        E$ = MID$(A$, A + 1, B - 1)
        FREQ = VAL(E$)
        E$ = MID$(A$, B + 1, LEN(A$))
        DUR = VAL(E$)
AQ:
        VLUME
        IF FREQ < 37 THEN
                PRINT "Frequency Underflow Error."
                SBERROR = -1
        END IF
        IF FREQ > 32767 THEN
                PRINT "Frequency Overflow Error."
                SBERROR = -1
        END IF
        IF DUR <= 0 THEN
                PRINT "Sound Duration Underflow Error."
                SBERROR = -1
        END IF
        IF DUR > 65535 THEN
                PRINT "Sound Duration Overflow Error."
                SBERROR = -1
        END IF
        IF SBERROR = -1 OR VOLUMEERROR = -1 THEN
                GOTO A:
        ELSE
                SOUND FREQ, DUR
        END IF
END IF
IF LEFT$(A$, 4) = "BEEP" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        VLUME
        IF E > 3600 THEN
                PRINT "Beep Duration Overflow Error."
                SBERROR = -1
        END IF
        IF E <= 0 THEN
                PRINT "Beep Duration Underflow Error."
                SBERROR = -1
        END IF
        IF SBERROR = -1 OR VOLUMEERROR = -1 THEN
                GOTO A:
        ELSE
                SOUND 800, E * 18.2
        END IF
END IF
IF LEFT$(A$, 4) = "PLAY" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        VLUME
        IF VOLUMEERROR = -1 THEN
                GOTO A:
        ELSE
                PLAY "X" + VARPTR$(E$)
        END IF
END IF
IF LEFT$(A$, 6) = "VOLUME" THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        VOLUME = VAL(E$)
        IF VOLUME < 0 THEN
                PRINT "Volume Underflow Error."
                GOTO A:
        END IF
        IF VOLUME > 15 THEN
                PRINT "Volume Overflow Error."
                GOTO A:
        END IF
        IF VOLUME <> INT(VOLUME) THEN
                PRINT "Volume Illegal Function Call"
                GOTO A:
        END IF
        VOLUMEERROR = 0
        PRINT "Volume is Now Set to"; VOLUME
END IF
A:
END SUB

SUB SCRN
        A = INSTR(A$, " ")
        IF A = 0 THEN
                PRINT MODE
                GOTO 11
        ELSE
                E = VAL(MID$(A$, A, LEN(A$)))
                SCREEN E
                MODE = E
                GOTO 11
        END IF
11 END SUB

SUB SND
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        E$ = MID$(A$, A + 1, B - 1)
        FREQ = VAL(E$)
        E$ = MID$(A$, B + 1, LEN(A$))
        DUR = VAL(E$)
        SOUND FREQ, DUR
END SUB

SUB STEM
SYSTEM
END SUB

SUB SUBTRACT
A = INSTR(A$, " ")
B = INSTR(A$, ",")
Q$ = MID$(A$, A + 1, B - 1)
W$ = MID$(A$, B + 1, LEN(A$))
SELECT CASE Q$
CASE "A" TO "Z"
        Q = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        Q = VAL(Q$)
END SELECT
SELECT CASE W$
CASE "A" TO "Z"
        W = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
CASE ELSE
        W = VAL(Q$)
END SELECT
PRINT Q - W
END SUB

SUB SVE
        A = INSTR(A$, " ")
        IF A = 0 THEN
                E$ = "NONAME.BAS"
        ELSE
                E$ = MID$(A$, A + 1, LEN(A$))
        END IF
        OPEN E$ FOR OUTPUT AS #1
        FOR K = 1 TO LN
                PRINT #1, A$(K)
        NEXT K
        CLOSE 1
END SUB

SUB TEMP
END SUB

SUB TME
        A = INSTR(A$, " ")
        IF A = 0 THEN
                PRINT TIME$
        ELSE
                E$ = MID$(A$, A, LEN(A$))
                TIME$ = E$
        END IF
END SUB

SUB TMR
A = INSTR(A$, " ")
IF A = 0 THEN
        PRINT TIMER
ELSE
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ = "ON" THEN
                TIMER ON
        ELSEIF E$ = "OFF" THEN
                TIMER OFF
        ELSEIF E$ = "STOP" THEN
                TIMER STOP
        ELSEIF ERHAN = -1 THEN
                PRINT "Syntax Error"
        END IF
END IF
END SUB

SUB USER
        A = INSTR(A$, " ")
        IF A = 0 THEN
                PRINT USR$
        ELSE
                E$ = MID$(A$, A + 1, LEN(A$))
                USR$ = E$
        END IF
END SUB

SUB VLUME
IF VOLUME <= 0 THEN
        PRINT "Volume Off Error."
        VOLUMEERROR = -1
END IF
END SUB

SUB WDTH
        A = INSTR(A$, " ")
        E = VAL(MID$(A$, A + 1, LEN(A$)))
        WIDTH E
END SUB

