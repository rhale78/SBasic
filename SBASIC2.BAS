DECLARE SUB RUNTIME ()
DECLARE SUB SBNEW ()
DECLARE SUB SCSAVE ()
DECLARE SUB SBSCREEN ()
DECLARE SUB SBLOAD ()
DECLARE SUB SBWAIT ()
DECLARE SUB SBINCREASE ()
DECLARE SUB SBDECREASE ()
DECLARE SUB SBPRESET ()
DECLARE SUB SBPSET ()
DECLARE SUB SBBOX ()
DECLARE SUB SBBEEP ()
DECLARE SUB SBCIRCLE ()
DECLARE SUB SBCOLOR ()
DECLARE SUB SBDRAW ()
DECLARE SUB SBFILES ()
DECLARE SUB SBGOTO ()
DECLARE SUB SBINPUT ()
DECLARE SUB SBKEY ()
DECLARE SUB SBLINE ()
DECLARE SUB SBPLAY2 ()
DECLARE SUB SBPOKE ()
DECLARE SUB SBSOUND ()
DECLARE SUB SBWIDTH ()
DECLARE SUB SBOUT ()
DECLARE SUB SBPAINT ()
DECLARE SUB SBACKNOWLEDGE ()
DECLARE SUB SBADVANCE ()
DECLARE SUB SBBLINK ()
DECLARE SUB SBALERT ()
DECLARE SUB SBAUTO ()
DECLARE SUB SBRUN ()
DECLARE SUB SBLIST ()
DECLARE SUB SBBACKGROUND ()
DECLARE SUB SBMOD ()
DECLARE SUB SBINTDIVIDE ()
DECLARE SUB SBINT ()
DECLARE SUB SBPOWER ()
DECLARE SUB SBALLOW ()
DECLARE SUB SBPRINT ()
DECLARE SUB SBSQR ()
DECLARE SUB SBSTICK ()
DECLARE SUB SBSTR ()
DECLARE SUB SBSTRIG ()
DECLARE SUB SBTAB ()
DECLARE SUB SBTAN ()
DECLARE SUB SBVAL ()
DECLARE SUB SBVARPTR ()
DECLARE SUB SBADD ()
DECLARE SUB SBSUBTRACT ()
DECLARE SUB SBMULTIPLY ()
DECLARE SUB SBDIVIDE ()
DECLARE SUB SBRND ()
DECLARE SUB SBSGN ()
DECLARE SUB SBSIN ()
DECLARE SUB SBSPACE ()
DECLARE SUB SBSPC ()
DECLARE SUB SBPLAY ()
DECLARE SUB SBPOINT ()
DECLARE SUB SBPOS ()
DECLARE SUB SBOCT ()
DECLARE SUB SBPEEK ()
DECLARE SUB SBPEN ()
DECLARE SUB SBCSNG ()
DECLARE SUB SBEXP ()
DECLARE SUB SBFIX ()
DECLARE SUB SBFRE ()
DECLARE SUB SBHEX ()
DECLARE SUB SBINP ()
DECLARE SUB SBLEN ()
DECLARE SUB SBLOG ()
DECLARE SUB SBATN ()
DECLARE SUB SBCDBL ()
DECLARE SUB SBCHR ()
DECLARE SUB SBCINT ()
DECLARE SUB SBCOS ()
DECLARE SUB SBASC (A$)
DECLARE SUB EXPAND (A$)
DECLARE SUB SBABSOLUTE (A$)
DECLARE SUB COMMANDS2 (A$)
DECLARE SUB READY ()
DECLARE SUB COMMANDS (A$)
COMMON SHARED VAR(), VAR$(), A$(), Z.CHR(), LN, A$, SBSTACK
CLEAR , , 15000
DIM VAR(255), VAR$(255), A$(255), Z.CHR(8), STATUS$, MODE
ON ERROR GOTO S:
SCREEN 0, 0, 0, 0
CLS
SCREENMODE = 0
COLOR 15
KOLOR = 15
PRINT "BASICB Version 4.00"
PRINT "Super Advanced Super Basic Version 3.00"
PRINT LTRIM$(STR$(FRE(0))); " bytes of free memory available."
1 READY
GOTO 1
S:
RUNTIME
RESUME NEXT

SUB COMMANDS (A$)
IF LEFT$(A$, 6) = "EXPAND" THEN
        EXPAND (A$)
GOTO 30
END IF
IF LEFT$(A$, 3) = "CLS" THEN
        CLS
GOTO B:
END IF
IF LEFT$(A$, 5) = "PLAY " THEN
        SBPLAY2
GOTO 30
END IF
IF LEFT$(A$, 8) = "ABSOLUTE" THEN
        SBABSOLUTE (A$)
GOTO B:
END IF
IF LEFT$(A$, 3) = "ABS" THEN
        SBABSOLUTE (A$)
GOTO B:
END IF
IF LEFT$(A$, 3) = "ASC" THEN
        SBASC (A$)
GOTO B:
END IF
IF LEFT$(A$, 3) = "ATN" THEN
        SBATN
GOTO B:
END IF
IF LEFT$(A$, 4) = "CDBL" THEN
        SBCDBL
GOTO B:
END IF
IF LEFT$(A$, 4) = "CHR$" THEN
        SBCHR
GOTO B:
END IF
IF LEFT$(A$, 4) = "CINT" THEN
        SBCINT
GOTO B:
END IF
IF LEFT$(A$, 3) = "COS" THEN
        SBCOS
GOTO B:
END IF
IF LEFT$(A$, 4) = "CSNG" THEN
        SBCSNG
GOTO B:
END IF
IF LEFT$(A$, 3) = "EXP" THEN
        SBEXP
GOTO B:
END IF
IF LEFT$(A$, 3) = "FIX" THEN
        SBFIX
GOTO B:
END IF
IF LEFT$(A$, 3) = "FRE" THEN
        SBFRE
GOTO B:
END IF
IF LEFT$(A$, 4) = "HEX$" THEN
        SBHEX
GOTO B:
END IF
IF LEFT$(A$, 3) = "INP" THEN
        SBINP
GOTO B:
END IF
IF LEFT$(A$, 3) = "LEN" THEN
        SBLEN
GOTO B:
END IF
IF LEFT$(A$, 3) = "LOG" THEN
        SBLOG
GOTO B:
END IF
IF LEFT$(A$, 4) = "OCT$" THEN
        SBOCT
GOTO B:
END IF
IF LEFT$(A$, 4) = "PEEK" THEN
        SBPEEK
GOTO B:
END IF
IF LEFT$(A$, 3) = "PEN" THEN
        SBPEN
GOTO B:
END IF
IF LEFT$(A$, 4) = "PLAY" THEN
        SBPLAY
GOTO B:
END IF
IF LEFT$(A$, 5) = "POINT" THEN
        SBPOINT
GOTO B:
END IF
IF LEFT$(A$, 3) = "POS" THEN
        SBPOS
GOTO B:
END IF
IF LEFT$(A$, 3) = "RND" THEN
        SBRND
GOTO B:
END IF
IF LEFT$(A$, 3) = "SGN" THEN
        SBSGN
GOTO B:
END IF
IF LEFT$(A$, 3) = "SIN" THEN
        SBSIN
GOTO B:
END IF
IF LEFT$(A$, 6) = "SPACE$" THEN
        SBSPACE
GOTO B:
END IF
IF LEFT$(A$, 3) = "SPC" THEN
        SBSPC
GOTO B:
END IF
IF LEFT$(A$, 3) = "SQR" THEN
        SBSQR
GOTO B:
END IF
IF LEFT$(A$, 5) = "STICK" THEN
        SBSTICK
GOTO B:
END IF
IF LEFT$(A$, 4) = "STR$" THEN
        SBSTR
GOTO B:
END IF
IF LEFT$(A$, 5) = "STRIG" THEN
        SBSTRIG
GOTO B:
END IF
IF LEFT$(A$, 3) = "TAB" THEN
        SBTAB
GOTO B:
END IF
IF LEFT$(A$, 3) = "TAN" THEN
        SBTAN
GOTO B:
END IF
IF LEFT$(A$, 3) = "VAL" THEN
        SBVAL
GOTO B:
END IF
IF LEFT$(A$, 7) = "VARPTR$" THEN
        SBVARPTR
GOTO B:
END IF
IF LEFT$(A$, 3) = "ADD" THEN
        SBADD
GOTO B:
END IF
IF LEFT$(A$, 8) = "SUBTRACT" THEN
        SBSUBTRACT
GOTO B:
END IF
IF LEFT$(A$, 8) = "MULTIPLY" THEN
        SBMULTIPLY
GOTO B:
END IF
IF LEFT$(A$, 6) = "DIVIDE" THEN
        SBDIVIDE
GOTO B:
END IF
IF LEFT$(A$, 3) = "MOD" THEN
        SBMOD
GOTO B:
END IF
IF LEFT$(A$, 10) = "INT DIVIDE" THEN
        SBINTDIVIDE
GOTO B:
END IF
IF LEFT$(A$, 3) = "INT" THEN
        SBINT
GOTO B:
END IF
IF LEFT$(A$, 5) = "POWER" THEN
        SBPOWER
GOTO B:
END IF
IF LEFT$(A$, 5) = "ALLOW" THEN
        SBALLOW
GOTO B:
END IF
IF LEFT$(A$, 5) = "PRINT" THEN
        SBPRINT
GOTO B:
END IF
IF LEFT$(A$, 5) = "TIMER" THEN
        PRINT TIMER
GOTO 30
END IF
IF LEFT$(A$, 11) = "ACKNOWLEDGE" THEN
        SBACKNOWLEDGE
GOTO 30
END IF
IF LEFT$(A$, 7) = "ADVANCE" THEN
        SBADVANCE
GOTO 30
END IF
IF LEFT$(A$, 4) = "BELL" THEN
        BEEP
GOTO 30
END IF
IF LEFT$(A$, 5) = "BLANK" THEN
        CLS
GOTO 30
END IF
IF LEFT$(A$, 5) = "BLINK" THEN
        SBBLINK
GOTO 30
END IF
IF LEFT$(A$, 5) = "ALERT" THEN
        SBALERT
GOTO 30
END IF
IF LEFT$(A$, 4) = "AUTO" THEN
        SBAUTO
GOTO 30
END IF
IF LEFT$(A$, 3) = "RUN" THEN
        SBRUN
GOTO 30
END IF
IF LEFT$(A$, 4) = "LIST" THEN
        SBLIST
GOTO 30
END IF
IF LEFT$(A$, 10) = "BACKGROUND" THEN
        SBBACKGROUND
GOTO 30
END IF
IF LEFT$(A$, 5) = "CLOSE" THEN
        CLOSE
GOTO 30
END IF
IF LEFT$(A$, 3) = "CLS" THEN
        CLS
GOTO 30
END IF
IF LEFT$(A$, 4) = "BEEP" THEN
        SBBEEP
GOTO 30
END IF
IF LEFT$(A$, 6) = "CIRCLE" THEN
        SBCIRCLE
GOTO 30
END IF
IF LEFT$(A$, 5) = "COLOR" THEN
        SBCOLOR
GOTO 30
END IF
IF LEFT$(A$, 4) = "DATE" THEN
        PRINT DATE$
GOTO 30
END IF
IF LEFT$(A$, 5) = "DATE$" THEN
        PRINT DATE$
GOTO 30
END IF
IF LEFT$(A$, 4) = "DRAW" THEN
        SBDRAW
GOTO 30
END IF
IF LEFT$(A$, 5) = "FILES" THEN
        SBFILES
GOTO 30
END IF
IF LEFT$(A$, 3) = "DIR" THEN
        SHELL A$
GOTO 30
END IF
IF LEFT$(A$, 9) = "DIRECTORY" THEN
        SHELL "DIR"
GOTO 30
END IF
IF LEFT$(A$, 3) = "MEM" THEN
        PRINT FRE(0)
GOTO 30
END IF
IF LEFT$(A$, 6) = "MEMORY" THEN
        PRINT FRE(0)
GOTO 30
END IF
IF LEFT$(A$, 4) = "GOTO" THEN
        SBGOTO
GOTO 30
END IF
IF LEFT$(A$, 5) = "INPUT" THEN
        SBINPUT
GOTO 30
END IF
IF LEFT$(A$, 3) = "KEY" THEN
        SBKEY
GOTO 30
END IF
IF LEFT$(A$, 4) = "LINE" THEN
        SBLINE
GOTO 30
END IF
IF LEFT$(A$, 4) = "POKE" THEN
        SBPOKE
GOTO 30
END IF
IF LEFT$(A$, 9) = "RANDOMIZE" THEN
        RANDOMIZE
GOTO 30
END IF
IF LEFT$(A$, 3) = "REM" THEN
GOTO 30
END IF
IF LEFT$(A$, 1) = "'" THEN
GOTO 30
END IF
IF LEFT$(A$, 5) = "RESET" THEN
        RESET
GOTO 30
END IF
IF LEFT$(A$, 5) = "SOUND" THEN
        SBSOUND
GOTO 30
END IF
IF LEFT$(A$, 6) = "SYSTEM" THEN
        SYSTEM
GOTO 30
END IF
IF LEFT$(A$, 5) = "WIDTH" THEN
        SBWIDTH
GOTO 30
END IF
IF LEFT$(A$, 5) = "TIME$" THEN
        PRINT TIME$
GOTO 30
END IF
IF LEFT$(A$, 4) = "TIME" THEN
        PRINT TIME$
GOTO 30
END IF
IF LEFT$(A$, 3) = "OUT" THEN
        SBOUT
GOTO 30
END IF
IF LEFT$(A$, 5) = "PAINT" THEN
        SBPAINT
GOTO 30
END IF
IF LEFT$(A$, 6) = "PRESET" THEN
        SBPRESET
GOTO 30
END IF
IF LEFT$(A$, 4) = "PSET" THEN
        SBPSET
GOTO 30
END IF
IF LEFT$(A$, 3) = "BOX" THEN
        SBBOX
GOTO 30
END IF
IF LEFT$(A$, 3) = "NEW" THEN
        SBNEW
GOTO 30
END IF
IF LEFT$(A$, 4) = "SAVE" THEN
        SCSAVE
GOTO 30
END IF
IF LEFT$(A$, 6) = "SCREEN" THEN
        SBSCREEN
GOTO 30
END IF
IF LEFT$(A$, 4) = "LOAD" THEN
        SBLOAD
GOTO 30
END IF
IF LEFT$(A$, 4) = "WAIT" THEN
        SBWAIT
GOTO 30
END IF
IF LEFT$(A$, 8) = "INCREASE" THEN
        SBINCREASE
GOTO B:
END IF
IF LEFT$(A$, 8) = "DECREASE" THEN
        SBDECREASE
GOTO B:
END IF
IF A$ = "" THEN
GOTO 30
END IF
IF LEFT$(A$, 1) = " " THEN
        SHELL A$
GOTO B:
END IF
IF LEFT$(A$, 1) >= "A" OR LEFT$(A$, 1) <= "Z" THEN
        COMMANDS2 (A$)
GOTO B:
END IF
11
29
30
32
56
57
B:
END SUB

SUB COMMANDS2 (A$)
A = INSTR(A$, "=")
IF A = 0 THEN
        PRINT "Syntax Error."
GOTO D:
END IF
E$ = MID$(A$, A + 1, LEN(A$))
E = ASC(LEFT$(A$, 1))
IF LEFT$(E$, 8) = "ABSOLUTE" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = ABS(F)
        ELSE
                VAR(E) = ABS(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "ABS" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = ABS(F)
        ELSE
                VAR(E) = ABS(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "ASC" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF INSTR(F$, "$") = 0 THEN
                VAR(E) = ASC(F$)
        ELSE
                VAR(E) = ASC(VAR$(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "ATN" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = ATN(F)
        ELSE
                VAR(E) = ATN(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "CDBL" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = CDBL(F)
        ELSE
                VAR(E) = CDBL(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "CHR$" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR$(E) = CHR$(F)
        ELSE
                VAR$(E) = CHR$(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "CINT" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = CINT(F)
        ELSE
                VAR(E) = CINT(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "COS" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = COS(F)
        ELSE
                VAR(E) = COS(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "CSNG" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = CSNG(F)
        ELSE
                VAR(E) = CSNG(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "EXP" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = EXP(F)
        ELSE
                VAR(E) = EXP(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "FIX" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = FIX(F)
        ELSE
                VAR(E) = FIX(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "FRE" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = FRE(F)
        ELSE
                VAR(E) = FRE(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "HEX$" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR$(E) = HEX$(F)
        ELSE
                VAR$(E) = HEX$(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "INP" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = INP(F)
        ELSE
                VAR(E) = INP(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "LEN" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF INSTR(E$, "$") = 0 THEN
                VAR(E) = LEN(F$)
        ELSE
                VAR(E) = LEN(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "LOG" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = LOG(F)
        ELSE
                VAR(E) = LOG(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "OCT$" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR$(E) = OCT$(F)
        ELSE
                VAR$(E) = OCT$(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "PEEK" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = PEEK(F)
        ELSE
                VAR(E) = PEEK(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "PEN" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = PEN(F)
        ELSE
                VAR(E) = PEN(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "PLAY" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = PLAY(F)
        ELSE
                VAR(E) = PLAY(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 5) = "POINT" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = POINT(F)
        ELSE
                VAR(E) = POINT(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "POS" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = POS(F)
        ELSE
                VAR(E) = POS(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "RND" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = RND(F)
        ELSE
                VAR(E) = RND(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "SGN" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = SGN(F)
        ELSE
                VAR(E) = SGN(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "SIN" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = SIN(F)
        ELSE
                VAR(E) = SIN(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "SQR" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = SQR(F)
        ELSE
                VAR(E) = SQR(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 5) = "STICK" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = STICK(F)
        ELSE
                VAR(E) = STICK(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 4) = "STR$" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR$(E) = STR$(F)
        ELSE
                VAR$(E) = STR$(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 5) = "STRIG" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = STRIG(F)
        ELSE
                VAR(E) = STRIG(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "TAN" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF F$ < "A" OR F$ > "Z" THEN
                F = VAL(F$)
                VAR(E) = TAN(F)
        ELSE
                VAR(E) = TAN(VAR(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "VAL" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF INSTR(E$, "$") = 0 THEN
                VAR(E) = VAL(F$)
        ELSE
                VAR(E) = VAL(VAR$(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 7) = "VARPTR$" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        IF INSTR(E$, "$") = 0 THEN
                VAR$(E) = VARPTR$(F$)
        ELSE
                VAR$(E) = VARPTR$(VAR$(ASC(F$)))
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "ADD" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO D:
        ELSE
                F$ = MID$(E$, A + 1, B - 1)
                IF F$ < "A" OR F$ > "Z" THEN
                        Q = VAL(F$)
                ELSE
                        Q = VAR(ASC(F$))
                END IF
                F$ = MID$(E$, B + 1, LEN(E$))
                IF F$ < "A" OR F$ > "Z" THEN
                        W = VAL(F$)
                ELSE
                        W = VAR(ASC(F$))
                END IF
                VAR(E) = Q + W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 8) = "SUBTRACT" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO D:
        ELSE
                F$ = MID$(E$, A + 1, B - 1)
                Q = VAL(F$)
                F$ = MID$(E$, B + 1, LEN(E$))
                W = VAL(F$)
                VAR(E) = Q - W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 8) = "MULTIPLY" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO D:
        ELSE
                F$ = MID$(E$, A + 1, B - 1)
                Q = VAL(F$)
                F$ = MID$(E$, B + 1, LEN(E$))
                W = VAL(F$)
                VAR(E) = Q * W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 6) = "DIVIDE" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                SBERROR = -1
                GOTO D:
        ELSE
                F$ = MID$(E$, A + 1, B - 1)
                Q = VAL(F$)
                F$ = MID$(E$, B + 1, LEN(E$))
                W = VAL(F$)
                IF Q = 0 OR W = 0 THEN
                        PRINT "Division By Zero Error."
                        SBERROR = -1
                END IF
                IF SBERROR = -1 THEN
                        GOTO D:
                END IF
                VAR(E) = Q / W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "MOD" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO D:
        ELSE
                Q$ = MID$(E$, A + 1, B - 1)
                W$ = MID$(E$, B + 1, LEN(E$))
                Q = VAL(Q$)
                W = VAL(W$)
                VAR(E) = Q MOD W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 10) = "INT DIVIDE" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO D:
        ELSE
                Q$ = MID$(E$, A + 1, B - 1)
                W$ = MID$(E$, B + 1, LEN(E$))
                Q = VAL(Q$)
                W = VAL(W$)
                VAR(E) = Q \ W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 3) = "MEM" THEN
        VAR(E) = FRE(0)
GOTO D:
END IF
IF LEFT$(E$, 5) = "TIME$" THEN
        VAR$(E) = TIME$
GOTO D:
END IF
IF LEFT$(E$, 4) = "TIME" THEN
        VAR$(E) = TIME$
GOTO D:
END IF
IF LEFT$(E$, 3) = "INT" THEN
        A = INSTR(E$, " ")
        F$ = MID$(E$, A + 1, LEN(E$))
        F = VAL(F$)
        VAR(E) = INT(F)
GOTO D:
END IF
IF LEFT$(E$, 5) = "POWER" THEN
        A = INSTR(E$, " ")
        B = INSTR(E$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO D:
        ELSE
                Q$ = MID$(E$, A + 1, B - 1)
                W$ = MID$(E$, B + 1, LEN(E$))
                Q = VAL(Q$)
                W = VAL(W$)
                VAR(E) = Q ^ W
        END IF
GOTO D:
END IF
IF LEFT$(E$, 1) >= "A" OR LEFT$(E$, 1) <= "Z" THEN
        B = INSTR(A$, "$")
        IF B = 0 THEN
                VAR(E) = VAR(ASC(MID$(A$, A + 1, LEN(A$))))
                GOTO D:
        ELSE
                VAR$(E) = VAR$(ASC(MID$(A$, A + 1, LEN(A$))))
                GOTO D:
        END IF
END IF
D:
END SUB

SUB EXPAND (A$)
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

SUB READY
PRINT "Ready"
LINE INPUT A$
COMMANDS (A$)
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
END SUB

SUB SBABSOLUTE (A$)
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT ABS(E)
        ELSE
                PRINT ABS(VAR(ASC(E$)))
        END IF
END SUB

SUB SBACKNOWLEDGE
        A = INSTR(A$, " ")
        IF A = 0 THEN
                F$ = "Press Any Key To Continue."
        ELSE
                F$ = MID$(A$, A + 1, LEN(A$))
        END IF
        PRINT F$
        DO
        LOOP UNTIL INKEY$ <> ""

END SUB

SUB SBADD
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 123
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                PRINT Q + W
        END IF
123
END SUB

SUB SBADVANCE
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
        ELSE
                E = VAR(ASC(E$))
        END IF
        FOR J = 1 TO E
                PRINT
        NEXT J

END SUB

SUB SBALERT
        COLOR 20
        A = INSTR(A$, " ")
        IF A = 0 THEN
                E$ = "Alert!!!"
        ELSE
                E$ = MID$(A$, A + 1, LEN(A$))
        END IF
        PRINT E$
        DO
                SOUND 650, 2
        LOOP UNTIL INKEY$ <> ""

END SUB

SUB SBALLOW
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

SUB SBASC (A$)
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(E$, "$") = 0 THEN
                PRINT ASC(E$)
        ELSE
                PRINT ASC(VAR$(ASC(E$)))
        END IF
END SUB

SUB SBATN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT ATN(E)
        ELSE
                PRINT ATN(VAR(ASC(E$)))
        END IF
END SUB

SUB SBAUTO
        DO
                LN = LN + 1
                PRINT LTRIM$(STR$(LN * 10)); " ";
                LINE INPUT A$(LN)
        LOOP UNTIL A$(LN) = ""
        LN = LN - 1

END SUB

SUB SBBACKGROUND
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
                        COLOR VAR(ASC(MID$(A$, A + 1, LEN(A$))))
                END SELECT
        END IF

END SUB

SUB SBBEEP
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
        ELSE
                E = VAR(ASC(E$))
        END IF
        SOUND 800, E * 18.2

END SUB

SUB SBBLINK
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
        CASE "GRAY"
                COLOR 8 + 16
        CASE "LIGHT BLUE"
                COLOR 9 + 16
        CASE "LIGHT GREEN"
                COLOR 10 + 16
        CASE "LIGHT CYAN"
                COLOR 11 + 16
        CASE "LIGHT RED"
                COLOR 12 + 16
        CASE "LIGHT MAGENTA"
                COLOR 13 + 16
        CASE "BOLD WHITE"
                COLOR 15 + 16
        CASE "1" TO "15"
                COLOR VAL(E$) + 16
        CASE "A" TO "Z"
                COLOR VAR(ASC(MID$(A$, A + 1, LEN(A$)))) + 16
        END SELECT

END SUB

SUB SBBOX
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
                GOTO 570
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
570
END SUB

SUB SBCDBL
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT CDBL(E)
        ELSE
                PRINT CDBL(VAR(ASC(E$)))
        END IF
END SUB

SUB SBCHR
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT CHR$(E)
        ELSE
                PRINT CHR$(VAR(ASC(E$)))
        END IF
END SUB

SUB SBCINT
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT CINT(E)
        ELSE
                PRINT CINT(VAR(ASC(E$)))
        END IF
END SUB

SUB SBCIRCLE
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

SUB SBCOLOR
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

SUB SBCOS
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT COS(E)
        ELSE
                PRINT COS(VAR(ASC(E$)))
        END IF
END SUB

SUB SBCSNG
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT CSNG(E)
        ELSE
                PRINT CSNG(VAR(ASC(E$)))
        END IF
END SUB

SUB SBDECREASE
        A = INSTR(A$, " ")
        F$ = MID$(A$, A + 1, LEN(A$))
        E = ASC(F$)
        VAR(E) = VAR(E) - 1

END SUB

SUB SBDIVIDE
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                SBERROR = -1
                GOTO 1232
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
                        GOTO 1232
                END IF
                PRINT Q / W
        END IF
1232
END SUB

SUB SBDRAW
        A = INSTR(A$, " ")
        E$ = MID$(A$, A, LEN(A$))
        DRAW "X" + VARPTR$(E$)

END SUB

SUB SBEXP
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT EXP(E)
        ELSE
                PRINT EXP(VAR(ASC(E$)))
        END IF
END SUB

SUB SBFILES
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        FILES E$

END SUB

SUB SBFIX
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT FIX(E)
        ELSE
                PRINT FIX(VAR(ASC(E$)))
        END IF
END SUB

SUB SBFRE
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT FRE(E)
        ELSE
                PRINT FRE(VAR(ASC(E$)))
        END IF
END SUB

SUB SBGOTO
        A = INSTR(A$, " ")
        B = VAL(MID$(A$, A, LEN(A$)))
        J = B / 10
        FOR K = J TO LN
                A$ = A$(K)
                SBSTACK = SBSTACK + 1
                IF SBSTACK > 600 THEN
                        PRINT "Error.Possible Stack Space Overflow."
                GOTO J:
                END IF
                IF LN = 0 THEN
                        PRINT "Missing Operand Error"
                END IF
                COMMANDS (A$)
        NEXT K
J:
END SUB

SUB SBHEX
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT HEX$(E)
        ELSE
                PRINT HEX$(VAR(ASC(E$)))
        END IF
END SUB

SUB SBINCREASE
        A = INSTR(A$, " ")
        F$ = MID$(A$, A + 1, LEN(A$))
        E = ASC(F$)
        VAR(E) = VAR(E) + 1

END SUB

SUB SBINP
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT INP(E)
        ELSE
                PRINT INP(VAR(ASC(E$)))
        END IF
END SUB

SUB SBINPUT
        A = INSTR(A$, " ")
        E$ = MID$(A$, A, LEN(A$))
        E = ASC(E$)
        IF INSTR(A$, "$") = 0 THEN
                INPUT VAR(E)
        ELSE
                INPUT VAR$(E)
        END IF

END SUB

SUB SBINT
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        E = VAL(E$)
        PRINT INT(E)
END SUB

SUB SBINTDIVIDE
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 127
        ELSE
                Q$ = MID$(A$, A + 1, B - 1)
                W$ = MID$(A$, B + 1, LEN(A$))
                Q = VAL(Q$)
                W = VAL(W$)
                PRINT Q \ W
        END IF
127
END SUB

SUB SBKEY
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

SUB SBLEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(A$, "$") = 0 THEN
                PRINT LEN(E$)
        ELSE
                PRINT LEN(VAR(ASC(E$)))
        END IF
END SUB

SUB SBLINE
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
                GOTO 290
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
290
END SUB

SUB SBLIST
        FOR J = 1 TO LN
                PRINT LTRIM$(STR$(J * 10)); " "; A$(J)
        NEXT J

END SUB

SUB SBLOAD
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

SUB SBLOG
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT LOG(E)
        ELSE
                PRINT LOG(VAR(ASC(E$)))
        END IF
END SUB

SUB SBMOD
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 126
        ELSE
                Q$ = MID$(A$, A + 1, B - 1)
                W$ = MID$(A$, B + 1, LEN(A$))
                Q = VAL(Q$)
                W = VAL(W$)
                PRINT Q MOD W
        END IF
126
END SUB

SUB SBMULTIPLY
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 125
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                PRINT Q * W
        END IF
125
END SUB

SUB SBNEW
        FOR J = 1 TO LN
                A$(J) = ""
        NEXT J
        LN = 0
        MODE = 0
        SCREEN 0
        CLS

END SUB

SUB SBOCT
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT OCT$(E)
        ELSE
                PRINT OCT$(VAR(ASC(E$)))
        END IF
END SUB

SUB SBOUT
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        PORT = VAL(MID$(A$, A + 1, B - 1))
        V = VAL(MID$(A$, B + 1, LEN(A$)))
        OUT PORT, V

END SUB

SUB SBPAINT
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PAINT (Q, W), R

END SUB

SUB SBPEEK
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT PEEK(E)
        ELSE
                PRINT PEEK(VAR(ASC(E$)))
        END IF
END SUB

SUB SBPEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT PEN(E)
        ELSE
                PRINT PEN(VAR(ASC(E$)))
        END IF
END SUB

SUB SBPLAY
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT PLAY(E)
        ELSE
                PRINT PLAY(VAR(ASC(E$)))
        END IF
END SUB

SUB SBPLAY2
        A = INSTR(A$, " ")
        B$ = MID$(A$, A + 1, LEN(A$))
        IF B$ = "" THEN
                PRINT "Missing Operand Error"
                GOTO 320
        END IF
        PLAY "X" + VARPTR$(B$)
320
END SUB

SUB SBPOINT
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT POINT(E)
        ELSE
                PRINT POINT(VAR(ASC(E$)))
        END IF
END SUB

SUB SBPOKE
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        LCN = VAL(MID$(A$, A + 1, B - 1))
        V = VAL(MID$(A$, B + 1, LEN(A$)))
        POKE LCN, V

END SUB

SUB SBPOS
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT POS(E)
        ELSE
                PRINT POS(VAR(ASC(E$)))
        END IF
END SUB

SUB SBPOWER
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 128
        ELSE
                Q$ = MID$(A$, A + 1, B - 1)
                W$ = MID$(A$, B + 1, LEN(A$))
                Q = VAL(Q$)
                W = VAL(W$)
                PRINT Q ^ W
        END IF
128
END SUB

SUB SBPRESET
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PRESET (Q, W), R

END SUB

SUB SBPRINT
    X$ = CHR$(34)
    A = INSTR(A$, X$)
    IF A = 0 THEN 670
    B = INSTR(A + 1, A$, X$)
    IF B = 0 THEN ZX = -1
    IF LEN(A$) = 5 OR LEN(A$) = 6 THEN PRINT : GOTO 156
    IF ZX = 0 THEN E$ = MID$(A$, A + 1, B)
    IF ZX = -1 THEN E$ = MID$(A$, A + 1, LEN(A$))
    A1 = INSTR(A$, ";"): IF A1 = 0 THEN 600 ELSE 630
600 B1 = INSTR(A$, ","): IF B1 = 0 THEN 610 ELSE 650
610 PRINT E$
    GOTO 156
630 PRINT E$;
    GOTO 156
650 PRINT E$,
    GOTO 156
670 IF A$ = "PRINT" THEN PRINT : GOTO 156
    IF A$ = "?" THEN PRINT : GOTO 156
    A = INSTR(A$, "ABS"): IF A = 0 THEN 730
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT ABS(E): GOTO 156
730 A = INSTR(A$, "ASC"): IF A = 0 THEN 770
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1)
    PRINT ASC(E$): GOTO 156
770 A = INSTR(A$, "ATN"): IF A = 0 THEN 810
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT ATN(E): GOTO 156
810 A = INSTR(A$, "CDBL"): IF A = 0 THEN 850
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT CDBL(E): GOTO 156
850 A = INSTR(A$, "CHR$"): IF A = 0 THEN 890
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT CHR$(E): GOTO 156
890 A = INSTR(A$, "CINT"): IF A = 0 THEN 930
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT CINT(E): GOTO 156
930 A = INSTR(A$, "COS"): IF A = 0 THEN 970
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
    PRINT COS(E): GOTO 156
970 A = INSTR(A$, "CSNG"): IF A = 0 THEN 1010
    B = INSTR(A$, "("): C = INSTR(A$, ")")
    E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT CSNG(E): GOTO 156
1010 A = INSTR(A$, "EXP"): IF A = 0 THEN 1050
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT EXP(E): GOTO 156
1050 A = INSTR(A$, "FIX"): IF A = 0 THEN 1090
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT FIX(E): GOTO 156
1090 A = INSTR(A$, "FRE"): IF A = 0 THEN 1130
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT FRE(E): GOTO 156
1130 A = INSTR(A$, "HEX$"): IF A = 0 THEN 1170
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT HEX$(E): GOTO 156
1170 A = INSTR(A$, "INP"): IF A = 0 THEN 1210
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT INP(E): GOTO 156
1210 A = INSTR(A$, " INT"): IF A = 0 THEN 1250
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT INT(E): GOTO 156
1250 A = INSTR(A$, "LEN"): IF A = 0 THEN 1290
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1)
     PRINT LEN(E$): GOTO 156
1290 A = INSTR(A$, "LOG"): IF A = 0 THEN 1330
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT LOG(E): GOTO 156
1330 A = INSTR(A$, "OCT$"): IF A = 0 THEN 1370
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT OCT$(E): GOTO 156
1370 A = INSTR(A$, "PEEK"): IF A = 0 THEN 1410
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT PEEK(E): GOTO 156
1410 A = INSTR(A$, "PEN"): IF A = 0 THEN 1450
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT PEN(E): GOTO 156
1450 A = INSTR(A$, "PLAY"): IF A = 0 THEN 1490
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT PLAY(E): GOTO 156
1490 A = INSTR(A$, "POINT"): IF A = 0 THEN 1530
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT POINT(E): GOTO 156
1530 A = INSTR(A$, "POS"): IF A = 0 THEN 1570
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT POS(E): GOTO 156
1570 A = INSTR(A$, "RND"): IF A = 0 THEN 1610
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT RND(E): GOTO 156
1610 A = INSTR(A$, "SGN"): IF A = 0 THEN 1650
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SGN(E): GOTO 156
1650 A = INSTR(A$, "SIN"): IF A = 0 THEN 1690
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SIN(E): GOTO 156
1690 A = INSTR(A$, "SPACE$"): IF A = 0 THEN 1730
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SPACE$(E): GOTO 156
1730 A = INSTR(A$, "SPC"): IF A = 0 THEN 1770
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SPC(E); : GOTO 156
1770 A = INSTR(A$, "SQR"): IF A = 0 THEN 1810
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT SQR(E): GOTO 156
1810 A = INSTR(A$, "STICK"): IF A = 0 THEN 1850
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT STICK(E): GOTO 156
1850 A = INSTR(A$, "STR$"): IF A = 0 THEN 1890
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT STR$(E): GOTO 156
1890 A = INSTR(A$, "STRIG"): IF A = 0 THEN 1930
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT STRIG(E): GOTO 156
1930 A = INSTR(A$, "TAB"): IF A = 0 THEN 1970
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT TAB(E); : GOTO 156
1970 A = INSTR(A$, "TAN"): IF A = 0 THEN 2010
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
     PRINT TAN(E): GOTO 156
2010 A = INSTR(A$, "VAL"): IF A = 0 THEN 2050
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1)
     PRINT VAL(E$): GOTO 156
2050 A = INSTR(A$, "VARPTR$"): IF A = 0 THEN 2060
     B = INSTR(A$, "("): C = INSTR(A$, ")")
     E$ = MID$(A$, B + 1, C - 1)
     PRINT VARPTR$(E$): GOTO 156
2060 A = INSTR(A$, " "): IF A = 0 THEN 2070
     B = INSTR(A$, "$")
     IF B = 0 THEN PRINT VAR(ASC(MID$(A$, A + 1, LEN(A$)))): GOTO 156
     PRINT VAR$(ASC(MID$(A$, A + 1, LEN(A$)))): GOTO 156
2070 A = INSTR(A$, X$)
     B = INSTR(A$, "(")
     C = INSTR(A$, ")")
     D = INSTR(A$, "$")
     IF A = 0 AND B = 0 AND C = 0 AND D = 0 THEN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                PRINT VAL(E$)
        ELSE
                PRINT VAR(ASC(E$))
        END IF
     END IF
156
END SUB

SUB SBPSET
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PSET (Q, W), R

END SUB

SUB SBRND
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT RND(E)
        ELSE
                PRINT RND(VAR(ASC(E$)))
        END IF

END SUB

SUB SBRUN
        FOR J = 1 TO LN
                A$ = A$(J)
                COMMANDS (A$)
        NEXT J

END SUB

SUB SBSCREEN
        A = INSTR(A$, " ")
        IF A = 0 THEN
                PRINT MODE
                GOTO 111
        ELSE
                E = VAL(MID$(A$, A, LEN(A$)))
                SCREEN E
                MODE = E
                GOTO 111
        END IF
111
END SUB

SUB SBSGN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SGN(E)
        ELSE
                PRINT SGN(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSIN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SIN(E)
        ELSE
                PRINT SIN(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSOUND
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        E$ = MID$(A$, A + 1, B - 1)
        FREQ = VAL(E$)
        E$ = MID$(A$, B + 1, LEN(A$))
        DUR = VAL(E$)
        SOUND FREQ, DUR

END SUB

SUB SBSPACE
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SPACE$(E)
        ELSE
                PRINT SPACE$(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSPC
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SPC(E);
        ELSE
                PRINT SPC(VAR(ASC(E$)));
        END IF

END SUB

SUB SBSQR
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SQR(E)
        ELSE
                PRINT SQR(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSTICK
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT STICK(E)
        ELSE
                PRINT STICK(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSTR
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT STR$(E)
        ELSE
                PRINT STR$(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSTRIG
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT STRIG(E)
        ELSE
                PRINT STRIG(VAR(ASC(E$)))
        END IF

END SUB

SUB SBSUBTRACT
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 124
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                PRINT Q - W
        END IF
124
END SUB

SUB SBTAB
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT TAB(E);
        ELSE
                PRINT TAB(VAR(ASC(E$)));
        END IF

END SUB

SUB SBTAN
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT TAN(E)
        ELSE
                PRINT TAN(VAR(ASC(E$)))
        END IF

END SUB

SUB SBVAL
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(A$, "$") = 0 THEN
                PRINT VAL(E$)
        ELSE
                PRINT VAL(VAR$(ASC(E$)))
        END IF

END SUB

SUB SBVARPTR
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(A$, "$") = 0 THEN
                PRINT VARPTR$(E$)
        ELSE
                PRINT VARPTR$(VAR$(ASC(E$)))
        END IF

END SUB

SUB SBWAIT
        DO
        LOOP UNTIL INKEY$ <> ""

END SUB

SUB SBWIDTH
        A = INSTR(A$, " ")
        E = VAL(MID$(A$, A + 1, LEN(A$)))
        WIDTH E

END SUB

SUB SCSAVE
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

