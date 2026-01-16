DECLARE SUB SBEND ()
DECLARE SUB SBEDIT ()
DECLARE SUB SBDELETE ()
DECLARE SUB SBDUMP ()
DECLARE SUB SBSAVE ()
DECLARE SUB SBVARABLES ()
DECLARE SUB SBEGABLOAD ()
DECLARE SUB SBEGABSAVE ()
DECLARE SUB SBDICTIONARY ()
DECLARE SUB SBRUNTIME ()
DECLARE SUB SBCHDIR ()
DECLARE SUB SBMKDIR ()
DECLARE SUB SBRMDIR ()
DECLARE SUB SBUNZIP ()
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
COMMON SHARED VAR(), VAR$(), A$(), Z.CHR(), LN, A$, SBSTACK, E$, E, SBEXIT
CLEAR , , 15000
ON ERROR GOTO L
DIM VAR(255), VAR$(255), A$(255), Z.CHR(8)
SCREEN 0, 0, 0, 0
CLS
SCREENMODE = 0
COLOR 15
KOLOR = 15
PRINT "BASICB Version 3.00"
PRINT "Super Advanced Super Basic Version 2.00"
PRINT "Super Advanced Graphic Basic Version 2.00"
PRINT "Super Advanced Sound Basic Version 2.00"
PRINT LTRIM$(STR$(FRE(0))); " bytes of free memory available."
1 READY
GOTO 1
L:
SBRUNTIME
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
IF LEFT$(A$, 5) = "PLAY " THEN
        SBPLAY2
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
        SBSAVE
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
IF LEFT$(A$, 5) = "UNZIP" THEN
        SBUNZIP
GOTO B:
END IF
IF LEFT$(A$, 4) = "DUMP" THEN
        SBDUMP
GOTO B:
END IF
IF LEFT$(A$, 6) = "DELETE" THEN
        SBDELETE
GOTO B:
END IF
IF LEFT$(A$, 4) = "EDIT" THEN
        SBEDIT
GOTO B:
END IF
IF LEFT$(A$, 3) = "END" THEN
        SBEND
GOTO B:
END IF
IF LEFT$(A$, 5) = "CHDIR" THEN
        SBCHDIR
GOTO B:
END IF
IF LEFT$(A$, 5) = "MKDIR" THEN
        SBMKDIR
GOTO B:
END IF
IF LEFT$(A$, 5) = "RMDIR" THEN
        SBRMDIR
GOTO B:
END IF
IF LEFT$(A$, 9) = "EGA BSAVE" THEN
        SBEGABSAVE
GOTO B:
END IF
IF LEFT$(A$, 9) = "EGA BLOAD" THEN
        SBEGABLOAD
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
        SBDICTIONARY
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
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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

SUB SBCHDIR
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
CHDIR E$
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

SUB SBDELETE
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
SBVARABLES
A$(E / 10) = ""
END SUB

SUB SBDICTIONARY
IF A$ = "AAAI" THEN
        PRINT "AMERICAN ASSOCIATION FOR ARTIFICIAL INTELLIGENCE"
        PRINT "ORGANIZATION FORMED IN 1981 TO FURTHER THE WORK IN AI"
END IF
IF A$ = "ABA" THEN
        PRINT "AMERICAN BAR ASSOCIATION"
END IF
IF A$ = "ABACUS" THEN
        PRINT "PROGRAMMING LANGUAGE"
END IF
IF A$ = "ABET" THEN
        PRINT "ACCREDITATION BOARD FOR ENGINEERING & TECHNOLOGY"
        PRINT "ORGANIZATION RESPONSIBLE FOR ACCREDITATION OF MFG RELATED CURRICULUM"
END IF
IF A$ = "ABM" THEN
        PRINT "ANTI-BALLISTIC MISSILE"
        PRINT "MISSILE DEFENSE CONCEPT"
END IF
IF A$ = "AC" THEN
        PRINT "AIR CONDITIONING"
        PRINT "5 HP/TON A.C.= 12K"
        PRINT "BTU/HR.= 3.52 KW"
END IF
IF A$ = "ACC" THEN
        PRINT "ACCELERATION"
        PRINT "INCREASE IN VELOCITY OF AN N/C MACHINE TOOL SERVO FEED"
END IF
IF A$ = "ACLU" THEN
        PRINT "AMERICAN CIVIL LIBERTIES UNION"
END IF
IF A$ = "ACM" THEN
        PRINT "ASSOCIATION FOR COMPUTER MACHINERY"
END IF
IF A$ = "ADA" THEN
        PRINT "COMPUTER LANGUAGE USED BY MILITARY FOR PROGRAMMING MISSLES"
END IF
IF A$ = "ADAPT" THEN
        PRINT "PROCESSOR LANGUAGE"
END IF
IF A$ = "ADC" THEN
        PRINT "ANALOG TO DIGITAL CONVERTER"
END IF
IF A$ = "ADCAP" THEN
        PRINT "ADVANCED CAPABILITIES"
END IF
IF A$ = "ADF" THEN
        PRINT "AUTOMATIC DESCRIPTION FILES"
        PRINT "CONFIGURATION FILES FOR PS/2 FAMILY"
END IF
IF A$ = "ADIH" THEN
        PRINT "ANALOG DISPLAY INTERFACE HARDWARE"
END IF
IF A$ = "ADRS" THEN
        PRINT "A DEPARTMENTAL REPORTING SYSTEM"
        PRINT "PROCESSOR FOR DATA- BG PACKAGE IS BUSINESS GRAPHICS"
END IF
IF A$ = "AFA" THEN
        PRINT "ADVANCED FUNCTION ARRAY"
        PRINT "ULTRA-HIGH RESOLUTION GRAPHICS STANDARD FOR NEW IBM MONITOR"
END IF
IF A$ = "AFE" THEN
        PRINT "AUTHORIZATION FOR EXPENDITURE"
END IF
IF A$ = "AFP" THEN
        PRINT "ADVANCED FUNCTION PRINTING"
        PRINT "IBM PRINTING CAPABILITY WITH VARIABLE FONT, SIZE, DARKNESS, & SPACING"
END IF
IF A$ = "AFP/SME" THEN
        PRINT "ASSOCIATION FOR FINISHING PROCESS"
        PRINT "SME AFFILIATE SPECIALIZING IN FINISHING PROCESSES TECHNOLOGY"
END IF
IF A$ = "AGVS" THEN
        PRINT "AUTOMATIC GUIDED VEHICLES SYSTEM"
        PRINT "UNMANNED & AUTO-GUIDED WORKPIECE CARRIERS USED IN FMS"
END IF
IF A$ = "AI" THEN
        PRINT "ARTIFICIAL INTELLIGENCE"
        PRINT "THE USE OF HUMAN KNOWLEDGE BY COMPUTERS FOR PROBLEM SOLVING"
END IF
IF A$ = "AIM" THEN
        PRINT "AUTOMATIC IDENTIFICATION MANUFACTURERS"
        PRINT "A NOT-FOR-PROFIT TRADE ASSOCIATION"
END IF
IF A$ = "AISP" THEN
        PRINT "ASSOCIATION FOR INFORMATION SYSTEMS PROFESSIONALS"
END IF
IF A$ = "AIX" THEN
        PRINT "ADVANCED INTERACTIVE EXECUTIVE"
        PRINT "IBM UNIX-BASED OPERATING SYSTEM FOR RT PC"
END IF
IF A$ = "ALGOL" THEN
        PRINT "PROGRAMMING LANGUAGE"
END IF
IF A$ = "ALU" THEN
        PRINT "ARITHMETIC LOGIC UNIT"
        PRINT "ELECTRONIC COMPUTER CIRCUITRY WHICH PERFORMS ARITHMETIC OPERATIONS"
END IF
IF A$ = "AML" THEN
        PRINT "A MANUFACTURING LANGUAGE"
        PRINT "IBM DEVELOPED LANGUAGE FOR ROBOTICS APPLICATIONS"
END IF
IF A$ = "AMMSS" THEN
        PRINT "ADVANCED MULTI-MISSION SENSOR SYSTEM"
        PRINT "LOCKHEED'S NEXT GENERATION CARRIER-BASED TACTICAL SUPPORT AIRCRAFT"
END IF
IF A$ = "AMS" THEN
        PRINT "AMERICAN METAL SOCIETY"
        PRINT "ORGANIZATION RESPONSIBLE FOR AMS SPECS"
END IF
IF A$ = "AMTDA" THEN
        PRINT "AMERICAN MACHINE TOOL DISTRIBUTORS' ASSOCIATION"
END IF
IF A$ = "ANMC" THEN
        PRINT "AMERICAN NATIONAL METRIC COUNCIL"
        PRINT "ORGANIZATION EST. IN 1973 TO ASSIST WITH INDUSTRIAL METRICIZATION"
END IF
IF A$ = "ANSI" THEN
        PRINT "AMERICAN NATIONAL STANDARDS INSTITUTE"
END IF
IF A$ = "APA" THEN
        PRINT "ALL POINT ADDRESSABLE"
        PRINT "INDIVIDUAL PEL DISPLAY & MANIPULATION BIT MAPPED GRAPHICS"
END IF
IF A$ = "APD" THEN
        PRINT "ADVANCED PRODUCT DEALER"
        PRINT "DEALER/DISTRIBUTOR OF NEW IBM PERSONAL SYSTEM/2 EQUIPMENT"
END IF
IF A$ = "APF" THEN
        PRINT "APPLICATION PROGRAM FUNCTION"
        PRINT "IBM INTERFACE COMPONENT TO PACS APPLICATION PROGRAMS"
END IF
IF A$ = "API" THEN
        PRINT "APPLICATION PROGRAM INTERFACE"
        PRINT "A MAJOR SUBSET OF SRPI"
END IF
IF A$ = "APIC/CS" THEN
        PRINT "APPLICATION PROG.INTERFACES/COMMUN. SERVICES"
        PRINT "IBM SERVICE"
END IF
IF A$ = "APICS" THEN
        PRINT "AUTOMATED PRODUCTION AND INVENTORY CTRL. SYSTEM"
END IF
IF A$ = "APL" THEN
        PRINT "A PROGRAMMING LANGUAGE"
        PRINT "GEN. PURPOSE LANGUAGE FOR DP WORK, SCIENTIFIC COMP., & TEACHING MATH"
END IF
IF A$ = "APMES" THEN
        PRINT "ADVANCED PRODUCT MFG. & ENGINEERING STAFF"
END IF
IF A$ = "APP" THEN
        PRINT "AUTOMATIC PROCESS PLANNING"
        PRINT "SELF-GENERATING PROCESS PLANNING SOFTWARE SYSTEM"
END IF
IF A$ = "APPC" THEN
        PRINT "ADVANCED PROGRAM-TO-PROGRAM COMMUNICATIONS"
        PRINT "IBM PROTOCOL FOR PEER COMMUNICATIONS BETWEEN DIVERSE SYSTEMS"
END IF
IF A$ = "APPN" THEN
        PRINT "ADVANCED PEER-TO-PEER NETWORK"
        PRINT "IBM SOFTWARE USED TO LINK SYSTEM/36'S W/O MAINFRAME VIA SNA NETWORK"
END IF
IF A$ = "APSE" THEN
        PRINT "APPLICATION PROGRAM SUPPORT ENVIRONMENT"
END IF
IF A$ = "APT-AC" THEN
        PRINT "AUTOMATIC PROGRAMMING TOOL-ADVANCED CONTOURING"
        PRINT "POPULAR NUMERICAL CONTROL PROGRAMMING LANGUAGE"
END IF
IF A$ = "AQMD" THEN
        PRINT "AIR QUALITY MANAGEMENT DISTRICT"
END IF
IF A$ = "ARELEM" THEN
        PRINT "ARITHMETIC ELEMENT"
        PRINT "PART OF GEN. POST PROCESSOR WHICH CALCULATES CUTTER LOCATION"
END IF
IF A$ = "ARPA" THEN
        PRINT "ADVANCED RESEARCH PROJECTS AGENCY"
        PRINT "D.O.D. AGENCY DOING RESEARCH IN A.I., SUPERCOMPUTERS, AEROSPACE PLANE"
END IF
IF A$ = "ARPANET" THEN
        PRINT "ADVANCED RESEARCH PROJECTS AGENCY"
        PRINT "1ST PACKET SWITCHING NETWORK DEVELOPED FOR D.O.D."
END IF
IF A$ = "ASCII" THEN
        PRINT "AMERICAN STD. CODE FOR INFORMATION INTERCHANGE"
        PRINT "NC TAPE PUNCH FORMAT W/ ODD PARITY(ODD NUMBER OF HOLES PER TAPE ROW)"
END IF
IF A$ = "ASIC" THEN
        PRINT "APPLICATION-SPECIFIC INTEGRATED CIRCUITS"
        PRINT "ROM CHIPS DEDICATED TO PRE-DEFINED APPLICATIONS"
END IF
IF A$ = "ASM" THEN
        PRINT "AMERICAN SOCIETY OF METALS"
END IF
IF A$ = "ASM" THEN
        PRINT "ASSOCIATION FOR SYSTEMS MANAGEMENT"
END IF
IF A$ = "ASP" THEN
        PRINT "PROPOSED ONE-MAN STEALTH HELICOPTER"
END IF
IF A$ = "ASRS" THEN
        PRINT "AUTOMATIC STORAGE & RETRIEVAL SYSTEM"
        PRINT "COMPUTER CONTROLLED, HIGH DENSITY, RAPID RETRIEVAL,  STORAGE SYSTEM"
END IF
IF A$ = "ASSEMBLER" THEN
        PRINT "PROGRAMMING LANGUAGE"
END IF
IF A$ = "ASTM" THEN
        PRINT "AMERICAN SOCIETY OF TESTING AND METHODS"
        PRINT "ORGANIZATION RESPONSIBLE FOR ASTM SPECS."
END IF
IF A$ = "ATC" THEN
        PRINT "AUTOMATIC TOOL CHANGER"
END IF
IF A$ = "ATF" THEN
        PRINT "ADVANCED TECHNOLOGY FIGHTER"
        PRINT "AIR FORCE'S AIR SUPERIORITY FIGHTER FOR 1990'S"
END IF
IF A$ = "ATMS" THEN
        PRINT "ADVANCED TEXT MANAGEMENT SYSTEM"
        PRINT "INTERACTIVE EDITOR FOR CICS."
END IF
IF A$ = "BA" THEN
        PRINT "BACHELOR OF ARTS"
        PRINT "COLLEGE/UNIVERSITY ART DEGREE- TYPICALLY 4 YEARS"
END IF
IF A$ = "BASIC" THEN
        PRINT "BEGINNER'S ALL-PURPOSE SYMBOLIC INSTRUCTION CODE"
        PRINT "A POPULAR, PROBLEM SOLVING, ALGEBRA-LIKE, PROGRAMMING LANGUAGE"
END IF
IF A$ = "BAUD" THEN
        PRINT "OPERATIONAL CYCLE PER SECOND IN A COMMUNICATION NETWORK"
END IF
IF A$ = "BCD" THEN
        PRINT "BINARY CODED DECIMAL"
        PRINT "SYSTEM OF COMBINING BINARY BITS IN ROW TO DESIGNATE NUMERALS/LETTERS"
END IF
IF A$ = "BCL" THEN
        PRINT "BINARY CUTTER LOCATION (CLDATA) EIA RS-494 FORMAT"
END IF
IF A$ = "BERT" THEN
        PRINT "BIT ERROR RATE TESTER"
END IF
IF A$ = "BIOS" THEN
        PRINT "BASIC INPUT OUTPUT SYSTEM"
        PRINT "PC I/O FUNCTION"
END IF
IF A$ = "BISYNCH" THEN
        PRINT "BISYNCHRONOUS"
        PRINT "COMMUNICATION PROTOCOL"
END IF
IF A$ = "BIT" THEN
        PRINT "BINARY DIGIT"
        PRINT "SINGLE DIGIT OF BINARY NUMBER, EITHER A ONE OR A ZERO"
END IF
IF A$ = "BIT" THEN
        PRINT "BUILT IN TESTING"
        PRINT "CONCEPT OF BUILT-IN SELF TEST CIRCUITRY"
END IF
IF A$ = "BMW" THEN
        PRINT "BAVARIAN MOTOR WORKS"
END IF
IF A$ = "BOB" THEN
        PRINT "BREAK OUT BOX"
END IF
IF A$ = "BPS" THEN
        PRINT "BITS PER SECOND"
        PRINT "COMPUTER DATA TRANSFER RATE"
END IF
IF A$ = "BS" THEN
        PRINT "BACHELOR OF SCIENCE"
        PRINT "COLLEGE/UNIVERSITY SCIENCE OR TECHNOLOGY DEGREE- TYPICALLY 4 YEARS"
END IF
IF A$ = "BSC" THEN
        PRINT "BINARY SYNCHRONOUS COMMUNICATION"
        PRINT "USE OF CONTROL CHARACTERS & SEQUENCES FOR INTRA-STATION TRANSMISSION"
END IF
IF A$ = "BTR" THEN
        PRINT "BEHIND THE TAPE READER"
        PRINT "DNC HARDWARE COMPONENT"
END IF
IF A$ = "BTU" THEN
        PRINT "BRITISH THERMAL UNIT"
END IF
IF A$ = "BYTE" THEN
        PRINT "BITS ORGANIZED TOGETHER INTO A WORD TO HOLD A SYMBOL LETTER/NUMBER"
END IF
IF A$ = "C" THEN
        PRINT "COMPUTER PROGRAMMING LANGUAGE KNOWN FOR TRANSPORTABILITY"
END IF
IF A$ = "CA" THEN
        PRINT "COLLISION AVOIDANCE"
END IF
IF A$ = "CAD" THEN
        PRINT "COMPUTER AIDED DESIGN"
        PRINT "DESIGN ANALYSIS OR MODIFICATION THROUGH THE USE OF COMPUTERS"
END IF
IF A$ = "CAD/CAM" THEN
        PRINT "COMPUTER AIDED DESIGN/COMPUTER AIDED MFG.USUALLY REFERRING TO DESIGN, DRAFTING, AND N.C. PROGRAMMING SYSTEMS"
END IF
IF A$ = "CADAM" THEN
        PRINT "COMPUTER-GRAPHICS AIDED DESIGN AND MANUFACTURING"
        PRINT "INTERACTIVE CAD/CAM SYSTEM DEVELOPED BY LOCKHEED INC.; IBM CAD/CAM"
END IF
IF A$ = "CAE" THEN
        PRINT "COMPUTER AIDED ENGINEERING"
        PRINT "COMPUTER ASSIST WITH TASKS LIKE FINITE ELEMENT ANALYSIS, DESIGN, ETC"
END IF
IF A$ = "CAEDS" THEN
        PRINT "COMPUTER-AIDED ENGINEERING DESIGN SYSTEM"
        PRINT "IBM INTEGRATED DESIGN SYSTEM FOR SOLVING STRESS/HEAT/DESIGN PROBLEMS"
END IF
IF A$ = "CAGD" THEN
        PRINT "COMPUTER AIDED GEOMETRIC DESIGN"
END IF
IF A$ = "CAIT" THEN
        PRINT "COALITION FOR ADVANCEMENT OF IND. TECHNOLOGY"
        PRINT "CONGRESSIONAL LOBBYING GROUP ENCOURAGING INDUSTRIAL REASEARCH"
END IF
IF A$ = "CAIT" THEN
        PRINT "COMPUTER AIDED INSPECTION & TEST"
        PRINT "COMPUTER ASSIST WITH TASKS LIKE FINITE ELEMENT ANALYSIS, DESIGN, ETC"
END IF
IF A$ = "CALS" THEN
        PRINT "COMPUTER-AIDED LOGISTICS SUPPORT"
        PRINT "DOD PROGRAM TO APPLY COMMUNICATIONS & TECHNOLOGIES IN LOGISTICS"
END IF
IF A$ = "CAM" THEN
        PRINT "COMPUTER AIDED MANUFACTURING"
        PRINT "DEVELOPMENT OF MANUFACTURED END PRODUCT THROUGH COMPUTER ASSISTANCE"
END IF
IF A$ = "CAMI" THEN
        PRINT "COMPUTER AIDED MANUFACTURING-INTERNATIONAL"
        PRINT "INTERNATIONAL CONSORTIUM OF COMPANIES DOING C.A.M. R&D WORK"
END IF
IF A$ = "CAPE" THEN
        PRINT "COMPUTER AIDED PRODUCTION ENGINEERING"
END IF
IF A$ = "CAPP" THEN
        PRINT "COMPUTER ASSISTED PROCESS PLANNING"
        PRINT "SOFTWARE THAT ASSISTS WITH THE CREATION OF PROCESS PLANS"
END IF
IF A$ = "CARIC" THEN
        PRINT "COMPUTERIZED AUTOMATION & ROBOTICS INFO. CENTER"
        PRINT "SME PHONE ACCESS REFERENCE LIBRARY FOR MFG. PROCESSES & APPLICATIONS"
END IF
IF A$ = "CASA/SME" THEN
        PRINT "COMPUTER & AUTOMATED SYSTEMS ASSOCIATION"
        PRINT "SME AFFILIATE SPECIALIZING IN CIM TECHNOLOGY"
END IF
IF A$ = "CASE" THEN
        PRINT "COMMON APPLICATION SERVICE ELEMENTS"
END IF
IF A$ = "CASE" THEN
        PRINT "COMPUTER AIDED SOFTWARE ENGINEERING"
END IF
IF A$ = "CAST" THEN
        PRINT "COMPUTER AIDED STORAGE & TRANSPORTATION"
END IF
IF A$ = "CAT" THEN
        PRINT "COMPUTER ASSISTED TESTING"
        PRINT "COMPUTER CONTROLLED TESTING PROCEDURES"
END IF
IF A$ = "CATIA" THEN
        PRINT "COMPUTER AIDED 3D INTERACTIVE APPLICATION"
        PRINT "IBM MARKETED DESSAULT CAD SOFTWARE W/ SOLIDS & WIRE FRAME CAPABILITY"
END IF
IF A$ = "CBDS 2" THEN
        PRINT "CIRCUIT BOARD DESIGN SYSTEM"
        PRINT "IBM'S PRINTED CIRCUIT BOARD SYSTEM; DEV. BY BELL NORTHERN RESEARCH"
END IF
IF A$ = "CBIOS" THEN
        PRINT "COMPATIBILITY BIOS"
END IF
IF A$ = "CCD" THEN
        PRINT "CHARGE-COUPLED DEVICE"
        PRINT "A KIND OF SOLID STATE CAMERA USED IN MACHINE VISION APPLICATIONS"
END IF
IF A$ = "CCITT" THEN
        PRINT "CONSULTATIVE COMMITTEE FOR INTERNATIONAL TELEPHONY AND TELEGRAPHY"
END IF
IF A$ = "CD" THEN
        PRINT "COLLISION DETECTION"
END IF
IF A$ = "CD-ROM" THEN
        PRINT "COMPACT DISK-READ ONLY MEMORY"
        PRINT "OPTICAL DISK USED AS DATA STORAGE MEDIUM"
END IF
IF A$ = "CDC" THEN
        PRINT "CUTTER DIAMETER COMPENSATION"
        PRINT "FEATURE WHICH ALTERS TOOL PATH TO COMPENSATE FOR OFFSETS & DIAMETERS"
END IF
IF A$ = "CDPF" THEN
        PRINT "COMPOSED DOCUMENT PRINTING FACILITY"
        PRINT "SOFTWARE INTERFACE FOR 4250 PRINTER"
        PRINT "MERGES GDDM, DCF FILES"
END IF
IF A$ = "CEO" THEN
        PRINT "CHIEF EXECUTIVE OFFICER"
END IF
IF A$ = "CEO" THEN
        PRINT "COMPREHENSIVE ELECTRONIC OFFICE"
        PRINT "DATA GENERAL BUSINESS AUTOMATION SOFTWARE"
END IF
IF A$ = "CFF" THEN
        PRINT "COMMUNICATION FACILITY FUNCTION"
        PRINT "IBM PACS' MESSAGE TRANSACTION CAPABILITY"
END IF
IF A$ = "CFO" THEN
        PRINT "CUSTOMER FULFILLMENT OPTION"
        PRINT "CREDITING PROCEDURE FOR IBM PRODUCTS PURCHASED FROM DISTRIBUTORS"
END IF
IF A$ = "CG" THEN
        PRINT "COMPUTER GRAPHICS"
        PRINT "COMPUTER DATA INPUT TRANSFORMED INTO DRAWINGS OR GRAPHS"
END IF
IF A$ = "CGA" THEN
        PRINT "COLOR GRAPHICS ADAPTER"
        PRINT "IBM COLOR PC GRAPHICS BOARD"
END IF
IF A$ = "CHGSC" THEN
        PRINT "CHANGE SCREEN"
        PRINT "KEY MOVES SESSION FROM ONE DEFINED SCREEN PROFILE TO ANOTHER"
END IF
IF A$ = "CI-ROM" THEN
        PRINT "COMPACT DISK-INTERACTIVE"
        PRINT "PHILLIPS INTERNATIONAL'S CD-ROM PRODUCT"
END IF
IF A$ = "CIB" THEN
        PRINT "COMPUTER INTEGRATED BUSINESS"
        PRINT "BUSINESS HAVING ALL FUNCTIONS INTEGRATED THRU COMMON DATABASE"
END IF
IF A$ = "CICS" THEN
        PRINT "CUSTOMER INFORMATION AND CONTROL SYSTEM"
        PRINT "IBM DATA COMMUNICATIONS OPERATING SYSTEM"
END IF
IF A$ = "CID" THEN
        PRINT "CHARGE-INJECTION DEVICE"
        PRINT "A KIND OF SOLID STATE CAMERA USED IN MACHINE VISION APPLICATIONS"
END IF
IF A$ = "CIEDS" THEN
        PRINT "COMPUTER-AIDED ELECTRICAL DESIGN SERIES"
        PRINT "IBM ELEC. CIRCUIT DESIGN VERIFICATION SIMULATION PROGRAMS FOR RT PC"
END IF
IF A$ = "CIM" THEN
        PRINT "COMPUTER INTEGRATED MANUFACTURING"
        PRINT "COMMON DATABASING OF ALL MANUFACTURING RELATED INFORMATION"
END IF
IF A$ = "CIPREC" THEN
        PRINT "CONVERS. & INTERACTIVE PROJECT EVAL. & CNTRL"
        PRINT "IBM INTERACTIVE PROJECT MANAGEMENT APPLICATION PROGRAM"
END IF
IF A$ = "CL" THEN
        PRINT "CENTER LINE (OR) CUTTER LINE"
        PRINT "N/C PROGRAM OUTPUT SPECIFYING COORDINATE LOCATIONS OF TOOL TRAVEL"
END IF
IF A$ = "CLDATA" THEN
        PRINT "CUTTER LOCATION DATA (BCL)"
        PRINT "EIA RS-494 FORMAT"
END IF
IF A$ = "CMFGE" THEN
        PRINT "CERTIFIED MANUFACTURING ENGINEER"
        PRINT "SME ACCREDITATION STATUS FOR QUALIFYIED MFG. PROFESSIONALS"
END IF
IF A$ = "CMFGT" THEN
        PRINT "CERTIFIED MANUFACTURING TECHNOLOGIST"
        PRINT "SME ACCREDITATION STATUS FOR QUALIFYIED MFG. PROFESSIONALS"
END IF
IF A$ = "CMM" THEN
        PRINT "COORDINATE MEASUREMENT MACHINE"
END IF
IF A$ = "CMOS" THEN
        PRINT "COMPLEMENTARY METAL-OXIDE SEMICONDUCTOR"
        PRINT "TYPE OF ELECTRONIC CIRCUITRY"
END IF
IF A$ = "CMS" THEN
        PRINT "CONVERSATIONAL MONITORING SYSTEM"
        PRINT "ENVIRONMENT - RUNS UNDER VM OPERATING SYSTEM"
END IF
IF A$ = "CMU" THEN
        PRINT "CARNEGIE-MELON UNIVERSITY"
        PRINT "PITTSBURGH BASED SCHOOL RENOWN FOR HIGH TECH ACHIEVEMENTS"
END IF
IF A$ = "CNC" THEN
        PRINT "COMPUTER NUMERICAL CONTROL"
        PRINT "USE OF COMPUTER TO MANAGE MACHINE TOOL INSTRUCTIONS"
END IF
IF A$ = "COAX" THEN
        PRINT "COAXIAL WIRE"
        PRINT "CONNECTING WIRE BETWEEN TERMINALS AND CONTROLLERS/COMPUTERS"
END IF
IF A$ = "COBOL" THEN
        PRINT "COMMON BUSINESS ORIENTED LANGUAGE"
        PRINT "FIRST MAJOR COMMON BUSINESS APPLICATION PROGRAMMING LANGUAGE"
END IF
IF A$ = "COG/SME" THEN
        PRINT "COMPOSITES GROUP OF SME"
        PRINT "SME AFFILIATE SPECIALIZING IN COMPOSITE MATERIAL TECHNOLOGY"
END IF
IF A$ = "COI" THEN
        PRINT "CITY OF INDUSTRY"
        PRINT "A&S SATELLITE MFG. FACILITY"
END IF
IF A$ = "COLORCOPY" THEN
        PRINT "TOOL FOR INQUIRING IN CADAM DATABASE"
        PRINT "BETTER THAN GDQF"
END IF
IF A$ = "COMMON" THEN
        PRINT "IBM USERS GROUP"
END IF
IF A$ = "COMPILER" THEN
        PRINT "TRANSLATES HIGH LEVEL LANGUAGES INTO BINARY COMPUTER CODE"
END IF
IF A$ = "COPICS" THEN
        PRINT "COMMUN. BASED PROD./INVENTORY CNTRL SYSTEM"
        PRINT "IBM QUASI-MRP SOFTWARE"
END IF
IF A$ = "COS" THEN
        PRINT "CORPORATION FOR OPEN SYSTEMS"
END IF
IF A$ = "COS" THEN
        PRINT "CORPORATION OF OPEN SYSTEMS"
END IF
IF A$ = "CP" THEN
        PRINT "CONTROL PROGRAM"
END IF
IF A$ = "CPI" THEN
        PRINT "CHARACTERS PER INCH"
        PRINT "PRINTING FORMAT PARAMETER"
END IF
IF A$ = "CPI" THEN
        PRINT "COMPUTER TO PBX INTERFACE"
        PRINT "DEC DEVICE CAPABLE OF 24 COMMUNICATION CHANNELS/LINK; 750 FT. RANGE"
END IF
IF A$ = "CPR" THEN
        PRINT "CRITICAL PROBLEM REPORT"
END IF
IF A$ = "CPS" THEN
        PRINT "CHARACTERS PER SECOND"
        PRINT "PRINTING SPEED"
END IF
IF A$ = "CPS" THEN
        PRINT "CYCLES PER SECOND"
        PRINT "OPERATING FREQUENCY OF COMPUTER BUSES"
END IF
IF A$ = "CPU" THEN
        PRINT "CENTRAL PROCESSING UNIT"
        PRINT "HEART OF COMPUTER COMPRISING ARITHMETIC, CONTROL, & LOGIC ELEMENTS"
END IF
IF A$ = "CPUC" THEN
        PRINT "CALIFORNIA PUBLIC UTILITIES COMMISSION"
END IF
IF A$ = "CRP" THEN
        PRINT "CAPACITY RESOURCE PLANNING"
        PRINT "SAME AS MRPSTING COBAL PROGRAMS INTO STRUCTURED CODE (IBM)"
END IF
IF A$ = "CRS" THEN
        PRINT "CURSOR SELECT"
        PRINT "IN HOST SESSION, THIS KEY CHOOSES FIELDS FOR PROCESSING"
END IF
IF A$ = "CRT" THEN
        PRINT "CATHODE RAY TUBE"
        PRINT "DISPLAY TUBE FPR COMPUTER GENERATED GRAPHICS AND/OR TEXT"
END IF
IF A$ = "CSDS" THEN
        PRINT "CIRCUIT SWITCHED DIGITAL SERVICES"
END IF
IF A$ = "CSF" THEN
        PRINT "COBAL STRUCTURING FACILITY"
        PRINT "CHANGES EXISTING COBAL PROGRAMS INTO STRUCTURED CODE (IBM)"
END IF
IF A$ = "CSMA/CD" THEN
        PRINT "CARRIER SENSED MULTIPLE ACCESS W/ COLLISION DETECTION"
END IF
IF A$ = "CSMP" THEN
        PRINT "CONTINUOUS SYSTEM MODELING PROGRAM"
        PRINT "IBM CONTINUOUS SIMULATION PROGRAM"
END IF
IF A$ = "CSP" THEN
        PRINT "CROSS SYSTEM PRODUCT"
        PRINT "IBM SOFTWARE PRODUCT FAMILY FOR PROGRAMMING PROCESS ENHANCEMENTS"
END IF
IF A$ = "CTOL" THEN
        PRINT "CONVENTIONAL TAKE-OFF AND LANDING"
END IF
IF A$ = "CTPA" THEN
        PRINT "COAX TO TWISTED PAIR ADAPTER"
        PRINT "IBM DEVICE FOR 32XX COMMUNICATION VIA TWISTED-PAIR TELEPHONE WIRE"
END IF
IF A$ = "CUAI" THEN
        PRINT "COMMON USER ACCESS INTERFACE"
END IF
IF A$ = "CULPRIT" THEN
        PRINT "PROGRAMMING LANGUAGE"
END IF
IF A$ = "CUT" THEN
        PRINT "CONTROL UNIT TERMINAL"
        PRINT "TERMINAL W/ LESS INTELLIGENCE THAN DFT TYPE"
END IF
IF A$ = "CUTTECH" THEN
        PRINT "METCUT CUSTOMIZED MACHINING TECHNOLOGY SOFTWARE SYSTEM"
END IF
IF A$ = "CV" THEN
        PRINT "COMPUTERVISION"
        PRINT "MAJOR MANUFACTURER OF CAD/CAM SYSTEMS"
END IF
IF A$ = "DAA" THEN
        PRINT "DATA ACCESS ARRANGEMENTS"
END IF
IF A$ = "DAC" THEN
        PRINT "DIGITAL TO ANALOG CONVERTER"
END IF
IF A$ = "DACU" THEN
        PRINT "DEVICE ATTACHMENT CONTROL UNIT"
        PRINT "ALLOWS ATTACHMENT OF NON-IBM DEVICES TO 30XX OR 4300 PROCESSORS"
END IF
IF A$ = "DARPA" THEN
        PRINT "DEFENSE ADVANCED RESEARCH PROJECTS AGENCY"
        PRINT "D.O.D. AGENCY DOING RESEARCH IN A.I., SUPERCOMPUTERS, AEROSPACE PLANE"
END IF
IF A$ = "DASD" THEN
        PRINT "DIRECT ACCESS STORAGE DEVICE"
        PRINT "PERMANENT MEMORY STORAGE AREA(USUALLY MAGNETIC TAPE OR DISK)"
END IF
IF A$ = "DBMS" THEN
        PRINT "DATA BASE MANAGEMENT SYSTEMS"
        PRINT "SOFTWARE PROGRAMS THAT PROVIDE ORGANIZATION FOR A DATABASE"
END IF
IF A$ = "DB2" THEN
        PRINT "IBM'S PREMIER MVS RELATIONAL DATABASE MANAGEMENT SYSTEM"
END IF
IF A$ = "DCA" THEN
        PRINT "DIGITAL COMMUNICATIONS ASSOCIATION"
        PRINT "MANUFACTURER OF IRMA BOARD"
END IF
IF A$ = "DCA" THEN
        PRINT "DOCUMENT CONTENT ARCHITECTURE"
        PRINT "IBM'S WORD PROCESSING DEFINITION ARCHITECTURE"
END IF
IF A$ = "DCAS" THEN
        PRINT "DEFENSE CONTRACT ADMINISTRATION SERVICES"
        PRINT "U.S. GOV. AGENCY RESPONSIBLE FOR REGULATING DEFENSE CONTRACTORS"
END IF
IF A$ = "DCE" THEN
        PRINT "DATA COMMUNICATION EQUIPMENT"
END IF
IF A$ = "DCF" THEN
        PRINT "DOCUMENT COMPOSITION FACILITY"
        PRINT "ALLOWS FORMATTED IN UT, CONTAINS SCRIPT"
END IF
IF A$ = "DCLASS" THEN
        PRINT "DECISION CLASSIFICATION INFORMATION SYSTEM"
        PRINT "BYU'S HIERARCHICAL INFORMATION TREE STORAGE AND RETRIEVAL SYSTEM"
END IF
IF A$ = "DDC" THEN
        PRINT "DIRECT DIGITAL CONTROL"
        PRINT "USE OF DIGITAL COMPUTER TO GOVERN PROCESS CONTROL OPERATIONS"
END IF
IF A$ = "DDIH" THEN
        PRINT "DIGITAL DISPLAY INTERFACE HARDWARE"
END IF
IF A$ = "DDM" THEN
        PRINT "DISTRIBUTED DATA MANAGEMENT"
        PRINT "IBM PC TO HOST CONNECTIVITY PRODUCT"
END IF
IF A$ = "DDS" THEN
        PRINT "DATAPHONE DIGITAL SERVICES"
END IF
IF A$ = "DE" THEN
        PRINT "DOMAIN EXPERT"
        PRINT "PERSON W/ EXPERTISE IN THE DOMAIN OF THE EXPERT SYSTEM BEING DEVELOPE"
END IF
IF A$ = "DEC" THEN
        PRINT "DECELERATION"
        PRINT "DECREASE IN VELOCITY OF AN N/C MACHINE TOOL SERVO FEED"
END IF
IF A$ = "DEC" THEN
        PRINT "DIGITAL EQUIPMENT CORPORATION"
END IF
IF A$ = "DES" THEN
        PRINT "DATA ENCRYPTION STANDARD"
        PRINT "IBM ENCRYPTION ALGORITHM"
END IF
IF A$ = "DEXPO" THEN
        PRINT "DIGITAL EQUIPMENT CORPORATION EXPOSITION"
        PRINT "NATIONAL EXPOSITION FOR DEC AND DEC-COMPATIBLE COMPUTER EQUIPMENT"
END IF
IF A$ = "DFD" THEN
        PRINT "DATA FLOW DIAGRAMS"
END IF
IF A$ = "DFHSM" THEN
        PRINT "DATA FACILITY HIERARCHICAL STORAGE MANAGER"
        PRINT "IBM DATA MANAGEMENT TOOL FOR DISK/TAPE DATA ARCHIVING"
END IF
IF A$ = "DFM/A" THEN
        PRINT "DESIGN FOR MANUFACTURABILITY/AUTOMATION"
        PRINT "ATTENTION DURING DESIGN PROCESS TO IMPACT ON MANUFACTURING"
END IF
IF A$ = "DFP" THEN
        PRINT "DATA FACILITY PRODUCT"
        PRINT "IBM DATA MANAGEMENT TOOL FOR DISK/TAPE DATA ARCHIVING"
END IF
IF A$ = "DFT" THEN
        PRINT "DISTRIBUTED FUNCTION TERMINAL"
        PRINT "TERMINAL W/ KEYBOARD CODES PROCESSED @ TERMINAL VS. @ CONTROLLER"
END IF
IF A$ = "DIA" THEN
        PRINT "DOCUMENT INTERCHANGE ARCHITECTURE"
        PRINT "IBM'S INTERCOMPUTER DOCUMENT TRANSFER SPECIFICATION"
END IF
IF A$ = "DIF" THEN
        PRINT "DEVICE INPUT FORMAT"
END IF
IF A$ = "DISSOS" THEN
        PRINT "DISTRIBUTED OFFICE SYSTEMS"
        PRINT "FRAMEWORK FOR INTEGRATING MULTIPLE WORKSTATIONS & OFFICE SYSTEMS"
END IF
IF A$ = "DM" THEN
        PRINT "DELTA MODULATION"
END IF
IF A$ = "DMA" THEN
        PRINT "DIRECT MEMORY ACCESS"
        PRINT "TYPE OF COMPUTER CONTROLLER"
END IF
IF A$ = "DMF" THEN
        PRINT "DATA MANAGER FUNCTION"
        PRINT "IBM PACS DISK/STORAGE RESIDENT DATA STRUCTURES & ORGANIZATIONS"
END IF
IF A$ = "DMIS" THEN
        PRINT "DIMENSIONAL MEASURING INTERFACE STANDARD"
        PRINT "DATA EXCHANGE STANDARD FOR INSPECTION DEVICES; CAD TO CMM"
END IF
IF A$ = "DNA" THEN
        PRINT "DIGITAL NETWORKING ARCHITECTURE"
        PRINT "DEC CONCEPT OF MULTIPLE CLUSTER INTER-COMMUNICATION"
END IF
IF A$ = "DNC" THEN
        PRINT "DISTRIBUTIVE(OR DIRECT) NUMERICAL CONTROL"
        PRINT "TRANSFER OF MACHINE TOOL INSTRUCTIONS VIA HARDWIRE METHOD"
END IF
IF A$ = "DOD" THEN
        PRINT "DEPARTMENT OF DEFENSE"
END IF
IF A$ = "DOL" THEN
        PRINT "DEPARTMENT OF LABOR"
        PRINT "U.S. GOVT. AGENCY"
END IF
IF A$ = "DOS" THEN
        PRINT "DISK OPERATING SYSTEM"
        PRINT "IBM GEN. PURPOSE, LOW FUNCTION, DISK MEMORY ORIENTED OPERATING SYSTEM"
END IF
IF A$ = "DOSF" THEN
        PRINT "DISTRIBUTED OFFICE SUPPORT FACILITY"
END IF
IF A$ = "DPCM" THEN
        PRINT "DIFFERENTIAL PULSE CODE MODULATION"
END IF
IF A$ = "DRAM" THEN
        PRINT "DYNAMIC RANDOM ACCESS MEMORY"
END IF
IF A$ = "DRO" THEN
        PRINT "DIGITAL READ-OUT"
        PRINT "NUMERICAL VALUE DISPLAY DEVICE; OFTEN TO SHOW TOOL LOCATION/MOVEMENT"
END IF
IF A$ = "DSP" THEN
        PRINT "DIGITAL SIGNAL PROCESSING"
END IF
IF A$ = "DSS" THEN
        PRINT "DECISION SUPPORT SYSTEMS"
END IF
IF A$ = "DTE" THEN
        PRINT "DATA TERMINAL EMULATION"
END IF
IF A$ = "DVF" THEN
        PRINT "DEVICE FUNCTION"
        PRINT "IBM PACS AREA PROVIDING PROGRAMMED COMM. TO VENDOR DEVICES"
END IF
IF A$ = "DVI" THEN
        PRINT "DIGITAL VIDEO INTERACTIVE"
        PRINT "RCA CD-ROM STANDARD"
END IF
IF A$ = "EAROM" THEN
        PRINT "ELECTRICALLY ALTERABLE READ-ONLY MEMORY"
        PRINT "TYPE OF COMPUTER MEMORY COMBINING CHARACTERISTICS OF RAM & ROM"
END IF
IF A$ = "EBCDIC" THEN
        PRINT "EXTENDED BINARY CODED DECIMAL INTERCHANGE CODE"
        PRINT "N/C TAPE FORMAT USING PATTERN OF EIGHT BINARY BITS PER CHARACTER"
END IF
IF A$ = "ECC" THEN
        PRINT "ERROR CHECKING AND CORRECTION"
END IF
IF A$ = "ECF" THEN
        PRINT "ENHANCED CONNECTIVITY FACILITIES"
        PRINT "IBM MICRO TO MAINFRAME LINKS; LINKS PC'S WITH SNA HOST OMPUTERS"
END IF
IF A$ = "ECMA" THEN
        PRINT "EUROPEAN COMPUTER MANUFACTURERS ASSOCIATION"
END IF
IF A$ = "EDM" THEN
        PRINT "ELECTRICAL DISCHARGE MACHINING"
        PRINT "CONTROLLED MATERIAL REMOVAL VIA ELECTRICAL CURRENT"
END IF
IF A$ = "EDP" THEN
        PRINT "ELECTRONIC DATA PROCESSING"
        PRINT "BROAD FIELD OF ELECTRONIC COMPUTERS & RELATED ACTIVITIES (DP)"
END IF
IF A$ = "EDS" THEN
        PRINT "EXTENDED DATA STREAM"
        PRINT "CHARACTER ATTRIBUTES REPRESENTED BY 1 BYTE CODE ATTACHED TO CHARACTER"
END IF
IF A$ = "EEHLLAPI" THEN
        PRINT "ENTRY LEVEL HLLAPI"
END IF
IF A$ = "EEMS" THEN
        PRINT "ENHANCED EXPANDED MEMORY SPECIFICATION"
END IF
IF A$ = "EEOC" THEN
        PRINT "EQUAL EMPLOYMENT OPPORTUNITY COUNCIL"
END IF
IF A$ = "EGA" THEN
        PRINT "ENHANCED GRAPHICS ADAPTER"
        PRINT "IBM ENHANCED PC GRAPHICS ADAPTER CARD"
END IF
IF A$ = "EIA" THEN
        PRINT "ELECTRONIC INDUSTRIES ASSOCIATION"
        PRINT "NC TAPE PUNCH FORMAT W/ EVEN PARITY(8 HOLES PER ROW ON 1 TAPE)"
END IF
IF A$ = "EII" THEN
        PRINT "ELECTRONIC INDUSTRIES INSTITUTE"
END IF
IF A$ = "ELV" THEN
        PRINT "EXPENDABLE LAUNCH VEHICLE"
        PRINT "NON-REUSABLE HARDWARE FOR PLACING PAYLOADS INTO SPACE"
END IF
IF A$ = "EM" THEN
        PRINT "EXPANDED MEMORY"
        PRINT "PC MEMORY ABOVE DOS' 640K LIMIT: USED FOR PAGING, RAMDISK, CACHING"
END IF
IF A$ = "EM/SME" THEN
        PRINT "ELECTRONICS MANUFACTURING GROUP OF SME"
        PRINT "SME AFFILIATE SPECIALIZING IN ELECTRONICS MANUFACTURING"
END IF
IF A$ = "EMI" THEN
        PRINT "ELECTROMAGNETIC INTERFERENCE"
        PRINT "STRAY OR UNWANTED ELECTRICAL ENERGY WITHIN COMPUTER CIRCUITRY"
END IF
IF A$ = "EMM" THEN
        PRINT "EXPANDED MEMORY MANAGER"
        PRINT "DOS DRIVER ALLOWING CONCURRENTLY RUNNING PROGRAMS TO PAGE MEMORY"
END IF
IF A$ = "EMS" THEN
        PRINT "EXPANDED MEMORY SPECIFICATION"
END IF
IF A$ = "EOB" THEN
        PRINT "END OF BLOCK"
        PRINT "CHARACTER REPRESENTING END OF LINE/BLOCK OF INFO IN N/C PROGRAM TAPE"
END IF
IF A$ = "EOF" THEN
        PRINT "END OF FIELD"
END IF
IF A$ = "EOP" THEN
        PRINT "END OF WORKPIECE PROGRAM"
END IF
IF A$ = "EOT" THEN
        PRINT "END OF TAPE"
END IF
IF A$ = "EPA" THEN
        PRINT "ENVIRONMENTAL PROTECTION AGENCY"
        PRINT "U.S. GOVERNMENT AGENCY RESPONSIBLE FOR OVERSEEING POLLUTION CONCERNS"
END IF
IF A$ = "EPA" THEN
        PRINT "EXTENDED PERFORMANCE ARCHITECTURE"
END IF
IF A$ = "EPROM" THEN
        PRINT "ERASABLE PROGRAMMABLE READ-ONLY MEMORY"
        PRINT "COMPUTER MEMORY WHICH CAN BE ERASED & REPROGRAMMED VIA UV LIGHT"
END IF
IF A$ = "EQUAL" THEN
        PRINT "ELECTRONIC QUICK ANSWER LIBRARY"
        PRINT "IBM ON-LINE INFORMATION LIBRARY FOR IBM EMPLOYEES"
END IF
IF A$ = "ERINP" THEN
        PRINT "ERASE INPUT"
        PRINT "IN A HOST SESSION, THIS KEY ERASES ALL INPUT FIELDS & HOMES CURSOR"
END IF
IF A$ = "EROM" THEN
        PRINT "ERASABLE READ-ONLY MEMORY"
        PRINT "COMPUTER MEMORY WHICH CAN BE ERASED & REPROGRAMMED VIA UV LIGHT"
END IF
IF A$ = "ES" THEN
        PRINT "EXTENDED SELF-CONTAINED PROLOG"
        PRINT "AI DEVELOPMENT LANGUAGE"
END IF
IF A$ = "ES**3" THEN
        PRINT "ENGINEERING SCIENTIFIC SUPPORT SYSTEM"
        PRINT "E-S CUBED: A SOFTWARE PRODUCTIVITY TOOL FOR ENGINEERS & SCIENTISTS"
END IF
IF A$ = "ESDI" THEN
        PRINT "ENHANCED SMALL DEVICE INTERFACE"
END IF
IF A$ = "ESPIRIT" THEN
        PRINT "EUROPEAN STRATEGIC PROG. FOR R&D IN INFO TECH"
END IF
IF A$ = "EXM" THEN
        PRINT "EXTENDED MEMORY PARAMETER"
END IF
IF A$ = "EXSEL" THEN
        PRINT "EXTENDED SELECT"
        PRINT "IN HOST SESSION, ALLOWS KEYBOARD TO EMULATE SOME TYPEWRITER FEATURES"
END IF
IF A$ = "FAT" THEN
        PRINT "FILE ALLOCATION TABLE"
        PRINT "IN ESSENCE, A VOLUME"
        PRINT "TABLE OF CONTENTS FOR PC STORAGE FILES"
END IF
IF A$ = "FCC" THEN
        PRINT "FEDERAL COMMUNICATIONS COMMISSION"
END IF
IF A$ = "FDM" THEN
        PRINT "FREQUENCY DIVISION MULTIPLEXING"
END IF
IF A$ = "FEA" THEN
        PRINT "FINITE ELEMENT ANALYSIS"
END IF
IF A$ = "FFT" THEN
        PRINT "FAST FOURIER TRANSFORMERS"
END IF
IF A$ = "FFTDCA" THEN
        PRINT "FINAL-FORM TEXT DOCUMENT CONTENT ARCHITECTURE"
        PRINT "IBM DISPLAYWRITE/370 TEXT FORMAT"
END IF
IF A$ = "FIPS" THEN
        PRINT "FEDERAL INFORMATION PROCESSING STANDARD"
END IF
IF A$ = "FIR" THEN
        PRINT "FINITE IMPULSE RESPONSE"
END IF
IF A$ = "FLIR" THEN
        PRINT "FORWARD LOOKING INFRA RED"
        PRINT "NIGHT VISION SIGHTS USED ON APACHE HELICOPTERS"
END IF
IF A$ = "FMC" THEN
        PRINT "FLEXIBLE MANUFACTURING CELL"
        PRINT "MACHINE(S) PRODUCING VARIOUS PARTS W/ MIN. CHANGE OVER TIME"
END IF
IF A$ = "FMS" THEN
        PRINT "FLEXIBLE MANUFACTURING SYSTEM"
        PRINT "GROUP(S) OF FLEXIBLE CELLS INTEGRATED INTO A SYSTEM"
END IF
IF A$ = "FOD" THEN
        PRINT "FIBER OPTIC GUIDANCE"
END IF
IF A$ = "FORTRAN" THEN
        PRINT "FORMULA TRANSLATION"
        PRINT "UNIVERSAL COMPUTER LANGUAGE FOR MATHEMATICAL APPLICATIONS, LIKE N/C"
END IF
IF A$ = "FRG" THEN
        PRINT "FEDERAL REPUBLIC OF GERMANY,WEST GERMANY"
END IF
IF A$ = "FRN" THEN
        PRINT "FEEDRATE NUMBER"
        PRINT "NUMBER DESIGNATING RATE OF TRAVEL OF A MACHINE TOOL"
END IF
IF A$ = "FRO" THEN
        PRINT "FEEDRATE OVERRIDE"
        PRINT "N/C CONTROL FEATURE ALLOWING OPERATOR TO OVERRIDE PROGRAMMED FEEDRATE"
END IF
IF A$ = "FTAM" THEN
        PRINT "FILE TRANSFER, ACCESS, & MANAGEMENT"
END IF
IF A$ = "FTC" THEN
        PRINT "FEDERAL TRADE COMMISSION"
        PRINT "U.S. GOVT. DEPT."
END IF
IF A$ = "FUD" THEN
        PRINT "FEAR, UNCERTAINTY, & DOUBT"
END IF
IF A$ = "GAA" THEN
        PRINT "GALLIUM ARSENIDE"
        PRINT "INTEGRATED CIRCUIT CHIP MATERIAL ALLOWING SUPER FAST CLOCK SPEEDS"
END IF
IF A$ = "GAL" THEN
        PRINT "GALLIUM ARSENITE LASER"
        PRINT "TYPE OF MINIATURE LASER USED IN IBM 3280 PRINTER"
END IF
IF A$ = "GBL" THEN
        PRINT "GROUND BASED LASER"
END IF
IF A$ = "GCP" THEN
        PRINT "GRAPHICS CONTROL PROGRAM"
END IF
IF A$ = "GDDM" THEN
        PRINT "GRAPHICAL DATA DISPLAY MANAGER"
        PRINT "ALLOWS GRAPHICS ON COLOR TERMINAL "
        PRINT "ASSY LANGUAGE"
END IF
IF A$ = "GDF" THEN
        PRINT "GRAPHICAL DISPLAY FILE"
        PRINT "VM OR MVS FILES WITH GRAPHICAL CONTENT"
END IF
IF A$ = "GDP" THEN
        PRINT "GEOMETRIC DESIGN PROCESSOR"
        PRINT "IBM DEVELOPED PROGRAMMING SYSTEM FOR DEFINING GEOMETRIC MODELS"
END IF
IF A$ = "GDQF" THEN
        PRINT "GRAPHICAL DISPLAY AND QUERY FACILITY  USED TO INQUIRE ON CADAM DRAWINGS"
END IF
IF A$ = "GEMOS" THEN
        PRINT "GENERAL ELECTRIC MACHINING OPTIMIZATION SYSTEM"
        PRINT "G.E. EXPERT SYSTEM TO AID CUTTING TOOL SELCTION/PATH, MACH. PARAMETER"
END IF
IF A$ = "GGXA" THEN
        PRINT "COLOR GRAPHICS EXTENDED APPLICATIONS"
        PRINT "IBM GRAPHICS SOFTWARE WITH PLOTTING, GRAPHING, & EDITING CAPABILITY"
END IF
IF A$ = "GIF" THEN
        PRINT "GRAPHICAL INFORMATION SYSTEM"
        PRINT "IBM GRAPHICS SOFTWARE USED IN CONJUNCTION WITH GDQF"
END IF
IF A$ = "GIN" THEN
        PRINT "GRAPHIC INPUT"
        PRINT "IBM GRAPHICS SOFTWARE USED IN CONJUNCTION WITH GDQF"
END IF
IF A$ = "GKS" THEN
        PRINT "GRAPHICS KERNEL SYSTEM"
END IF
IF A$ = "GML" THEN
        PRINT "GENERAL MARKUP LANGUAGE"
        PRINT "IBM'S DOCUMENT CHARACTERISTIC DESCRIPTION LANGUAGE; SCRIPT"
END IF
IF A$ = "GPI" THEN
        PRINT "GRAPHICS PROCEDURE INTERFACE"
        PRINT "COMMUNICATION INTERFACE BETWEEN APPLICATION PROGRAM & GCP"
END IF
IF A$ = "GPIB" THEN
        PRINT "GENERAL PURPOSE INTERFACE BUS"
END IF
IF A$ = "GPSS" THEN
        PRINT "GENERAL PURPOSE SIMULATION SYSTEM"
        PRINT "IBM SIMULATOR PROGRAM FOR EVENT-DRIVEN MODELS"
END IF
IF A$ = "GT" THEN
        PRINT "GROUP TECHNOLOGY"
        PRINT "CLASSIFICATION AND CODING ORGANIZATIONAL PRINCIPLE"
END IF
IF A$ = "HALON" THEN
        PRINT "HYDROGENATED HYDROCARBON"
        PRINT "FIRE EXTINGUISHING GAS; DECOMPOSES TO HYD. FLOURIDE/CHLORIDE/BROMIDE"
END IF
IF A$ = "HASP" THEN
        PRINT "TYPE OF ELECTRONIC LINK OR CONVERSION"
END IF
IF A$ = "HCI" THEN
        PRINT "HUMAN-COMPUTER INTERFACE"
END IF
IF A$ = "HCL" THEN
        PRINT "HYDROCHLORIC ACID"
END IF
IF A$ = "HGC" THEN
        PRINT "HERCULES GRAPHICS CARD"
END IF
IF A$ = "HLLAPI" THEN
        PRINT "HIGH LEVEL LANGUAGE APPLICATION PROGRAM INTERFACE IBM CUSTOMIZATION PROGRAMMING SOFTWARE FOR 3270PC"
END IF
IF A$ = "HP" THEN
        PRINT "HORSE POWER"
END IF
IF A$ = "I/O" THEN
        PRINT "INPUT/OUTPUT DEVICE"
        PRINT "DEVICES WHICH CAN BOTH RECEIVE & SEND DATA"
END IF
IF A$ = "IBM" THEN
        PRINT "INTERNATIONAL BUSINESS MACHINE"
END IF
IF A$ = "IBM PC/AT" THEN
        PRINT "ADVANCED TECHNOLOGY PERSONAL COMPUTER"
END IF
IF A$ = "IBM PC/ET" THEN
        PRINT "EXTENDED TECHNOLOGY PERSONAL COMPUTER"
        PRINT "NEW IBM BOTTOM OF THE LINE PC; HOME/SCHOOL USE; 8086 MICROPROCESSOR"
END IF
IF A$ = "IBM PC/XT" THEN
        PRINT "IBM PC"
END IF
IF A$ = "IBM PC2" THEN
        PRINT "NEW IBM PC: 4 TIMES FASTER THAN PC/XT; 80286 MICROPROCESSOR"
END IF
IF A$ = "IBM 3090" THEN
        PRINT "IBM SIERRA MAINFRAME"
        PRINT "IBM TOP-OF-THE-LINE MAINFRAME, 1 STEP UP FROM 308X'S"
END IF
IF A$ = "IBM 3161" THEN
        PRINT "IBM ASCII DISPLAY STATION-ENTRY LEVEL, 25 LINES X 80 CHAR"
END IF
IF A$ = "IBM 3163" THEN
        PRINT "IBM ASCII DISPLAY STATION-8 COLORS, 4 PAGES ON EACH OF 3 WINDOWS"
END IF
IF A$ = "IBM 3164" THEN
        PRINT "IBM ASCII DISPLAY STATION-MULTIPLE DATA/MULTIPLE COLORS"
END IF
IF A$ = "IBM 3174" THEN
        PRINT "IBM LARGE MODEL CLUSTER CONTROLLER"
END IF
IF A$ = "IBM 3178" THEN
        PRINT "IBM LIGHT-WEIGHT MODULAR DUMB TERMINAL"
END IF
IF A$ = "IBM 3179" THEN
        PRINT "IBM COLOR TERMINAL; WILL SUPPORT GRAPHICS; LESS EXPENSIVE THAN 3279"
END IF
IF A$ = "IBM 3179-G" THEN
        PRINT "IBM COLOR TERMINAL; WILL SUPPORT SCREEN DUMPS OF HOST GRAPHICS"
END IF
IF A$ = "IBM 3180" THEN
        PRINT "IBM SEMI - DUMB TERMINAL W/ 132 CHARACTER SCREEN CAPABILITY"
END IF
IF A$ = "IBM 3191" THEN
        PRINT "IBM TERMINAL W/ SMALL FOOTPRINT, LESS $, GREEN OR AMBER SCREEN"
END IF
IF A$ = "IBM 3194" THEN
        PRINT "IBM TERMINAL W/ 4 HOST SESSION CAPABILITY; CNTRL PROG ON 3 1/2"; DISK
END IF
IF A$ = "IBM 3268-2" THEN
        PRINT "IBM PRINTER- DOT MATRIX REMOTE PRINTER"
END IF
IF A$ = "IBM 3270 PC-G" THEN
        PRINT "IBM COLOR PC; SUPPORTS GRAPHICS: HAS MOUSE, PRINTER, HARD DISK"
END IF
IF A$ = "IBM 3270 PC-GX" THEN
        PRINT "IBM COLOR PERSONAL COMPUTER; WILL SUPPORT GRAPHICS"
END IF
IF A$ = "IBM 3274" THEN
        PRINT "IBM CONTROL UNIT CONNECTING TERMINALS WITH THE MAINFRAME"
END IF
IF A$ = "IBM 3278-2" THEN
        PRINT "IBM DUMB TERMINAL"
END IF
IF A$ = "IBM 3278-5" THEN
        PRINT "IBM DUMB TERMINAL WITH 132 CHARACTER SCREEN CAPABILITY"
END IF
IF A$ = "IBM 3279" THEN
        PRINT "IBM COLOR TERMINAL; WILL SUPPORT GRAPHICS"
END IF
IF A$ = "IBM 3290" THEN
        PRINT "IBM GAS PLASMA FLAT DISPLAY DEVICE FOR 4 SIMULATANEOUS SESSIONS"
END IF
IF A$ = "IBM 3290" THEN
        PRINT "IBM 3290 GAS PLASMA DISPLAY FOR 3270 PC'S"
END IF
IF A$ = "IBM 3641" THEN
        PRINT "IBM REPORTING TERMINAL FOR PLANT FLOOR MAGNETIC DOCUMENT DECODING"
END IF
IF A$ = "IBM 3812" THEN
        PRINT "IBM PAGE PRINTER- 12 PG./MIN., 240 DPI, USER INSTALLED CARTRIDGES"
END IF
IF A$ = "IBM 3820" THEN
        PRINT "IBM LASER PRINTER- CAPABLE OF MERGING TEXT & GRAPHICS"
END IF
IF A$ = "IBM 3852" THEN
        PRINT "IBM COLOR INK JET PRINTER"
END IF
IF A$ = "IBM 4250" THEN
        PRINT "IBM ELECTRO-EROSION PAPER PRINTER FOR MERGING TEXT & GRAPHICS(600 DPI"
END IF
IF A$ = "IBM 5152" THEN
        PRINT "IBM MONOCROME PRINTER"
END IF
IF A$ = "IBM 5182" THEN
        PRINT "IBM PERSONAL COMPUTER COLOR PRINTER"
END IF
IF A$ = "IBM 5279" THEN
        PRINT "IBM COLOR DISPLAY TERMINAL"
END IF
IF A$ = "IBM 5520" THEN
        PRINT "IBM EMULATION BOARD FOR PC'S"
END IF
IF A$ = "IBM 5531" THEN
        PRINT "IBM INDUSTRIAL PC-XT COMPUTER"
END IF
IF A$ = "IBM 5532" THEN
        PRINT "IBM INDUSTRIAL COLOR DISPLAY"
END IF
IF A$ = "IBM 5533" THEN
        PRINT "IBM INDUSTRIAL GRAPHICS PRINTER"
END IF
IF A$ = "IBM 6300 PC" THEN
        PRINT "IBM INDUSTRIAL PC; PC-AT COMPATIBLE"
END IF
IF A$ = "IBM 7456" THEN
        PRINT "IBM HARDENED MULTI-MEDIA PLANT FLOOR TERMINAL"
END IF
IF A$ = "IBM 7531" THEN
        PRINT "DESK VERSION OF 7532, HIGHER SCREEN RESOLUTION THAN 7532"
END IF
IF A$ = "IBM 7532" THEN
        PRINT "PC-AT VERSION OF 5531, WITH WIDER TEMP. RANGE; RACK MOUNTED"
END IF
IF A$ = "IC" THEN
        PRINT "INFORMATION CENTER"
        PRINT "MIS DEPARTMENT RESPONSIBLE FOR SUPPORTING END USER COMPUTING NEEDS"
END IF
IF A$ = "IC" THEN
        PRINT "INTEGRATED CIRCUITS"
        PRINT "VERY SMALL SINGLE STAGE STRUCTURE ASSY. OF ELECTRONIC COMPONENTS"
END IF
IF A$ = "ICAM" THEN
        PRINT "INTEGRATED COMPUTER AIDED MANUFACTURING"
        PRINT "AIR FORCE R&D MANUFACTURING PROJECT"
END IF
IF A$ = "ICBM" THEN
        PRINT "INTER-CONTINENTAL BALLISTIC MISSILE"
END IF
IF A$ = "ICCA" THEN
        PRINT "INDEPENDENT COMPUTER CONSULTANTS ASSOCIATION"
END IF
IF A$ = "ICCF" THEN
        PRINT "INTERACTIVE COMPUTING AND CONTROL FACILITY"
        PRINT "EDITOR FOR VSE"
END IF
IF A$ = "ICCP" THEN
        PRINT "INSTITUTE FOR CERT. OF COMPUTER PROFESSIONALS"
END IF
IF A$ = "ICG" THEN
        PRINT "INTERACTIVE COMPUTER GRAPHICS"
        PRINT "COMPUTER SYSTEM CAPABLE OF GRAPHIC INFO DISPLAY & USER INTERACTION"
END IF
IF A$ = "ICMP" THEN
        PRINT "INTERNET CONTROL MESSAGE PROTOCOL"
END IF
IF A$ = "ICS" THEN
        PRINT "IBM CABLING SYSTEM"
END IF
IF A$ = "ICU" THEN
        PRINT "INTERACTIVE CHART UTILITY"
        PRINT "PRETTY BASIC CHARTING ROUTINES"
        PRINT "USES PGF"
END IF
IF A$ = "IEEE" THEN
        PRINT "INSTITUTE OF ELECTRICAL & ELECTRONIC ENGINEERS"
END IF
IF A$ = "IGES" THEN
        PRINT "INTERNATIONAL GRAPHIC EXCHANGE STANDARD"
        PRINT "COMMON DENOMINATOR FOR DIFFERENT SYSTEMS TO INTER-COMMUNICATE"
END IF
IF A$ = "IHF" THEN
        PRINT "IMAGE HANDLING FACILITY"
        PRINT "IBM GRAPHICS SOFTWARE"
END IF
IF A$ = "IHPVA" THEN
        PRINT "INTERNATIONAL HUMAN POWERED VEHICLE ASSOCIATION"
END IF
IF A$ = "IIR" THEN
        PRINT "INFINITE IMPULSE RESPONSE"
END IF
IF A$ = "IMAGEWARE" THEN
        PRINT "PROGRAMS AND/OR PRESENTATIONS USING VIDEODISK TECHNOLOGY"
END IF
IF A$ = "IMS" THEN
        PRINT "INFORMATION MANAGEMENT SYSTEM"
        PRINT "IBM HIERARCHICAL DATA BASE OPERATING SYSTEM"
END IF
IF A$ = "IMW" THEN
        PRINT "INTELLIGENT MACHINING WORKSTATION"
END IF
IF A$ = "INTERLISP" THEN
        PRINT "USER-SENSITIVE LISP DEVELOPED BY BOLT/BERANEK/NEWMAN & XEROX PARC"
END IF
IF A$ = "IOCS" THEN
        PRINT "INPUT/OUTPUT CONTROL SYSTEM"
        PRINT "SOFTWARE FOR EXECUTING I/O OPERATIONS"
END IF
IF A$ = "IPCS" THEN
        PRINT "INTERACTIVE PROBLEM CONTROL SYSTEM"
        PRINT "IBM SYSTEM SERVICE PRODUCT"
END IF
IF A$ = "IPG" THEN
        PRINT "INTERACTIVE PRESENTATION GRAPHICS"
        PRINT "TOOL FOR ILLUSTRATORS TO DRAW ON SCREEN USING LIGHT PEN"
END IF
IF A$ = "IPL" THEN
        PRINT "INITIAL PROGRAM LOAD"
        PRINT "USED IN CP MODE OF VM/CMS TO PRESET USER PARAMETERS"
END IF
IF A$ = "IPPS" THEN
        PRINT "INTEGRATED PACKET-SWITCHING SERVICE"
        PRINT "AT&T'S ISDN PRODUCT"
END IF
IF A$ = "IRI" THEN
        PRINT "INTERNATIONAL ROBOMATION INTELLIGENCE"
        PRINT "CARLSBAD CALIF. COMPANY; PUBLICLY HELD; NEW TECHNOLOGY APPLICATIONS"
END IF
IF A$ = "ISAM" THEN
        PRINT "INDEXED SEQUENTIAL ACCESS METHOD"
        PRINT "TYPE OF FILE STRUCTURE"
END IF
IF A$ = "ISDN" THEN
        PRINT "INTEGRATED SERVICES DIGITAL NETWORK"
        PRINT "COMBINED VOICE AND DATA COMMUNICATION CAPABILITY"
END IF
IF A$ = "ISIS" THEN
        PRINT "CMU/WESTINGHOUSE DEVELOPED EXPERT PRODUCTION SCHEDULING SYSTEM"
END IF
IF A$ = "ISO" THEN
        PRINT "INTERNATIONAL STANDARDS ORGANIZATION"
END IF
IF A$ = "ISPC" THEN
        PRINT "INDUSTRIAL STANDARD PLOT COMMAND"
        PRINT "IBM GRAPHICAL PLOTTING COMMAND FILE"
END IF
IF A$ = "ISPF" THEN
        PRINT "INTERACTIVE SYSTEM PRODUCTIVITY FACILITY"
        PRINT "IBM DIALOG MANAGER: PANEL DRIVEN ACCESS TO VARIOUS APPLICATIONS"
END IF
IF A$ = "IT" THEN
        PRINT "INFORMATION TECHNOLOGY"
END IF
IF A$ = "ITI" THEN
        PRINT "INDUSTRIAL TECHNOLOGY INSTITUTE"
END IF
IF A$ = "ITPS" THEN
        PRINT "INTERNAL TELEPROCESSING SYSTEM"
END IF
IF A$ = "IVDT" THEN
        PRINT "INTEGRATED VOICE DATA TERMINAL"
        PRINT "SELF EXPLANATORY"
END IF
IF A$ = "IVS" THEN
        PRINT "INTERACTIVE VIDEO SYSTEMS"
        PRINT "USE OF USER FEEDBACK DEVICES, I.E. TOUCH SCREENS, W/ LASER VIDEO DISK"
END IF
IF A$ = "JCL" THEN
        PRINT "JOB CONTROL LANGUAGE"
        PRINT "INSTRUCTIONS WHICH CONTROL THE EXECUTION OF A COMPUTER PROGRAM"
END IF
IF A$ = "JIT" THEN
        PRINT "JUST IN TIME"
        PRINT "MFG. PHILOSOPHY NOTED FOR TIMELY DELIVERIES AND MINIMAL INVENTORY"
END IF
IF A$ = "KAIZEN" THEN
        PRINT "CONTINUAL IMPROVEMENT"
        PRINT "JAPANESE MANUFACTURING PHILOSOPHY"
END IF
IF A$ = "KANBAN" THEN
        PRINT "JAPANESE MANUFACTURING SCHEDULING PHILOSOPHY"
END IF
IF A$ = "KB" THEN
        PRINT "KILOBYTE"
        PRINT "1000 BYTES (STORES APPROX. 1/2 STD. TYPED PAGES OF INFO./KILOBYTE)"
END IF
IF A$ = "KE" THEN
        PRINT "KNOWLEDGE ENGINEERING"
        PRINT "A FORM OF ARTIFICIAL INTELLIGENCE"
END IF
IF A$ = "KLIPS" THEN
        PRINT "A THOUSAND(ONE K) LOGICAL INFERENCES PER SECOND"
        PRINT "A MEANS OF MEASURING THE SPEED OF COMPUTERS USED FOR AI APPLICATIONS"
END IF
IF A$ = "KW" THEN
        PRINT "KILOWATT"
END IF
IF A$ = "KW" THEN
        PRINT "KNOWLEDGE-WARE"
END IF
IF A$ = "LADT" THEN
        PRINT "LOCAL AREA DATA TRANSPORT"
END IF
IF A$ = "LAN" THEN
        PRINT "LOCAL AREA NETWORKING"
        PRINT "THE TYING TOGETHER OF COMPUTER TERMINALS & SYSTEMS VIA COMMON LINKS"
END IF
IF A$ = "LEAD" THEN
        PRINT "LEADERSHIP & EXCELLENCE IN CIM ADV. & DEVELOP."
        PRINT "SME AWARD FOR INDUSTRIAL & ACADEMIC EXCELLEMCE & DEVELOPMENT IN CIM"
END IF
IF A$ = "LEAF" THEN
        PRINT "LOTUS EXTENDED APPLICATIONS FACILITY"
        PRINT "TEXT AND GRAPHICS PRODUCTS INTERFACE MANAGER"
END IF
IF A$ = "LED" THEN
        PRINT "LIGHT EMITTING DIODE"
        PRINT "A DEVICE WHICH GIVES OFF VISIBLE LIGHT WHEN CURRENT PASSES THRU IT"
END IF
IF A$ = "LHX" THEN
        PRINT "LIGHTWEIGHT EXPERIMENTAL HELICOPTER"
        PRINT "ARMY ADVANCED HELICOPTER DEVELOPMENT PROGRAM"
END IF
IF A$ = "LIM" THEN
        PRINT "LOTUS/INTEL/MICROSOFT EXPANDED MEMORY SPEC."
        PRINT "SURPASS 640K RAM LIMIT IMPOSED BY MS-DOS; COMPAQ 386 RAM TO 8 MEG"
END IF
IF A$ = "LIPS" THEN
        PRINT "LOGICAL INFERENCES PER SECOND"
        PRINT "A MEANS OF MEASURING THE SPEED OF COMPUTERS USED FOR AI APPLICATIONS"
END IF
IF A$ = "LISP" THEN
        PRINT "LIST PROCESSOR"
        PRINT "1ST SYMBOLIC PROGR. LANG. DEVELOPED BY JOHN MCCARTHY AT MIT IN 1958"
END IF
IF A$ = "LLC" THEN
        PRINT "LOGICAL LINK CONTROL"
END IF
IF A$ = "LMF" THEN
        PRINT "LIBRARY MANAGEMENT FACILITY"
        PRINT "IBM SOFTWARE PRODUCT FOR HIERARCHICAL CONTROL OF DEVELOPMENT PROCESSE"
END IF
IF A$ = "LPI" THEN
        PRINT "LINES PER INCH"
        PRINT "PRINTING FORMAT PARAMETER"
END IF
IF A$ = "LPM" THEN
        PRINT "LINES PER MINUTE"
        PRINT "PRINTING SPEED"
END IF
IF A$ = "LSI" THEN
        PRINT "LARGE SCALE INTEGRATION"
        PRINT "ORGANIZATION OF NUMEROUS INTEGRATED CIRCUITS; BASIS OF MICROPROCESSOR"
END IF
IF A$ = "LU 6.2" THEN
        PRINT "COMMUNICATIONS STANDARD SPECIFICATION; SEE APPC"
END IF
IF A$ = "MAC" THEN
        PRINT "MEDIA ACCESS CONTROL"
END IF
IF A$ = "MACLISP" THEN
        PRINT "PROJECT MAC LISP LANGUAGE DERIVATIVE"
        PRINT "MIT LISP LANG. FOR DEC; GOOD SPEED, ECON. OF STORAGE, FLEXIBILITY"
END IF
IF A$ = "MANTIS" THEN
        PRINT "APPLICATION IN MVS ENVIRONMENT"
END IF
IF A$ = "MAP" THEN
        PRINT "MANUFACTURING AUTOMATION PROTOCOL"
        PRINT "O.S.I. STANDARD FOR FACTORY COMPUTER NETWORKING; IEEE 802.4 STD."
END IF
IF A$ = "MAP" THEN
        PRINT "MARKETING ASSISTANCE PROGRAM"
        PRINT "IBM PROGRAM OF TOP INDUSTRY EXPERTS ASSISTING IN TECHNOLOGY MARKETING"
END IF
IF A$ = "MAS" THEN
        PRINT "MULTI-ACCESS SPOOL"
END IF
IF A$ = "MB" THEN
        PRINT "MEGABYTE"
        PRINT "1,000,000 BYTES OF COMPUTER STORAGE CAPACITY"
END IF
IF A$ = "MBA" THEN
        PRINT "MASTERS OF BUSINESS ADMINISTRATION"
        PRINT "COLLEGE/UNIVERSITY BUSINESS DEGREE- GRADUATE LEVEL"
END IF
IF A$ = "MBPS" THEN
        PRINT "MEGABITS (MILLION BITS) PER SECOND"
END IF
IF A$ = "MCA" THEN
        PRINT "MICRO CHANNEL ARCHITECTURE"
END IF
IF A$ = "MCAE" THEN
        PRINT "MECHANICAL COMPUTER-AIDED ENGINEERING"
END IF
IF A$ = "MCC" THEN
        PRINT "MICROELECTRONICS & COMPUTERS TECHNOLOGY CORP."
        PRINT "CONSORTIUM OF U.S COMPANIES INVOLVED IN ADVANCED COMPUTER RESEARCH"
END IF
IF A$ = "MCU" THEN
        PRINT "MACHINE CONTROL UNIT"
        PRINT "N/C MACHINE TOOL ELECTRONIC CONTROL"
END IF
IF A$ = "MDA" THEN
        PRINT "MONOCHROME DISPLAY ADAPTER"
        PRINT "SINGLE COLOR PC DISPLAY ADAPTER"
END IF
IF A$ = "MDI" THEN
        PRINT "MANUAL DATA INPUT"
        PRINT "MCU FEATURE ALLOWING DIRECT DATA INPUT BY OPERATOR/PROGRAMMER"
END IF
IF A$ = "MEEF" THEN
        PRINT "MANUFACTURING ENGINEERING EDUCATION FOUNDATION"
        PRINT "SME ORGANIZATION WHICH PROVIDES GRANTS TO MFG. SCHOOLS & INSTITUTIONS"
END IF
IF A$ = "MFLOPS" THEN
        PRINT "ONE MILLION FLOATING OPERATING PER SECOND"
END IF
IF A$ = "MFM" THEN
        PRINT "MODIFIED FREQUENCY MODULATION"
        PRINT "DOUBLE DENSITY DISKETTES"
END IF
IF A$ = "MGA" THEN
        PRINT "MONO-COLOR GRAPHICS ADAPTER"
END IF
IF A$ = "MHS" THEN
        PRINT "MATERIAL HANDLING SYSTEM"
        PRINT "METHOD(S) OF TRANSPORTING MATERIALS DURING MFG. PROCESS"
END IF
IF A$ = "MHZ" THEN
        PRINT "MEGA HERTZ"
        PRINT "MILLIONS OF CYCLES PER SECOND"
END IF
IF A$ = "MIPS" THEN
        PRINT "MILLIONS OF INSTRUCTIONS PER SECOND"
        PRINT "A MEASURE OF MACHINE PERFORMANCE"
END IF
IF A$ = "MIS" THEN
        PRINT "MANAGEMENT INFORMATION SYSTEMS"
END IF
IF A$ = "MMC" THEN
        PRINT "METAL MATRIX COMPOSITES"
END IF
IF A$ = "MMFS" THEN
        PRINT "MANUFACTURING MESSAGE FORMAT STANDARD"
END IF
IF A$ = "MMIC" THEN
        PRINT "MONOLITHIC MICROWAVE INTEGRATED CIRCUITS"
END IF
IF A$ = "MMU" THEN
        PRINT "MEMORY MANAGEMENT UNIT"
        PRINT "LOAD DATA FROM SLOW TO FAST MEMORY JUST AHEAD OF PROCESSOR NEEDS"
END IF
IF A$ = "MNP" THEN
        PRINT "MICROCOM NETWORK PROTOCOL"
END IF
IF A$ = "MP&CS" THEN
        PRINT "MANUFACTURING PLANNING & CONTROL SYSTEMS"
END IF
IF A$ = "MPA" THEN
        PRINT "MONOCHROME DISPLAY ADAPTER"
END IF
IF A$ = "MPROLOG" THEN
        PRINT "ENHANCED VERSION OF PROLOG ESPECIALLY SUITED TO A.I. APPLICATIONS"
END IF
IF A$ = "MRB" THEN
        PRINT "MANUFACTURING REVIEW BOARD"
        PRINT "MULTI-DEPT. REVIEW & DISPOSITION OF DISCREPANT PARTS"
END IF
IF A$ = "MRP" THEN
        PRINT "MATERIAL REQUIREMENTS PLANNING"
        PRINT "COMPUTERIZED MATERIALS MNGMNT., PROD. SCHEDULING, & SHOP FLOOR CNTRL"
END IF
IF A$ = "MRP II" THEN
        PRINT "MANUFACTURING RESOURCE PLANNING"
        PRINT "COMBINING MRP & CRP INTO SINGLE COMPUTER-AIDED FUNCTION"
END IF
IF A$ = "MS" THEN
        PRINT "BACHELOR OF SCIENCE"
        PRINT "COLLEGE/UNIVERSITY SCIENCE OR TECHNOLOGY DEGREE- GRADUATE LEVEL"
END IF
IF A$ = "MS" THEN
        PRINT "MICROSOFT"
        PRINT "MAJOR SOFTWARE SUPPLIER: SOMETIMES USED BY IBM FOR PC SOFTWARE"
END IF
IF A$ = "MSG" THEN
        PRINT "MESSAGE/MESSENGER"
END IF
IF A$ = "MSS" THEN
        PRINT "MASSIVE STORAGE SYSTEM"
END IF
IF A$ = "MUDA" THEN
        PRINT "ELIMINATING WASTE"
        PRINT "JAPANESE MANUFACTURING PHILOSOPHY"
END IF
IF A$ = "MUX" THEN
        PRINT "MULTIPLEXER"
END IF
IF A$ = "MVA/SME" THEN
        PRINT "MACHINE VISION ASSOCIATION"
        PRINT "SME AFFILIATE SPECIALIZING IN MACHINE VISION TECHNOLOGY"
END IF
IF A$ = "MVS" THEN
        PRINT "MULTIPLE VIRTUAL STORAGE"
        PRINT "IBM GENERAL PURPOSE, TOP OF THE LINE, OPERATING SYSTEM"
END IF
IF A$ = "MVS/XA" THEN
        PRINT "MULTIPLE VIRTUAL STORAGE/EXTENDED ARCHITECTURE"
END IF
IF A$ = "NAM" THEN
        PRINT "NATIONAL ASSOCIATION OF MANUFACTURERS"
END IF
IF A$ = "NAMRI" THEN
        PRINT "NORTH AMERICAN MFG. RESEARCH INSTITUTION"
        PRINT "GROUP DEDICATED TO ADVANCING THE CAUSE OF MFG. RESEARCH"
END IF
IF A$ = "NASA" THEN
        PRINT "NATIONAL AERONAUTICS AND SPACE ADMINISTRATION"
END IF
IF A$ = "NATA" THEN
        PRINT "NORTH AMERICAN TELECOMMUNICATIONS ASSOCIATION"
END IF
IF A$ = "NATO" THEN
        PRINT "NORTH ATLANTIC TREATY ORGANIZATION"
END IF
IF A$ = "NBS" THEN
        PRINT "NATIONAL BUREAU OF STANDARDS"
END IF
IF A$ = "NC" THEN
        PRINT "NUMERICAL CONTROL"
        PRINT "PRE-ASSIGNED INSTRUCTIONS FOR MACHINE TOOLS"
END IF
IF A$ = "NCGA" THEN
        PRINT "NATIONAL COMPUTER GRAPHICS ASSOCIATION"
        PRINT "ORGANIZATION DEDICATED TO ADVANCING THE CAUSE OF COMPUTER GRAPHICS"
END IF
IF A$ = "NCMA" THEN
        PRINT "NATIONAL COMPUTER MAINTENANCE ASSOCIATION"
END IF
IF A$ = "NDT" THEN
        PRINT "NON-DESTRUCTIVE TESTING"
END IF
IF A$ = "NETBIOS" THEN
        PRINT "NETWORK BASIC INPUT/OUTPUT SYSTEM"
        PRINT "TOKEN-RING PROGRAM FOR IBM PC LAN"
END IF
IF A$ = "NIU" THEN
        PRINT "NETWORK INTERFACE UNIT"
        PRINT "A COMPUTER DEVICE TO MAP NETWORK INTERFACE W/O BACKPLANE INTERFACE"
END IF
IF A$ = "NLP" THEN
        PRINT "NATURAL LANGUAGE PROCESSING"
        PRINT "PEOPLE LITERATE COMPUTERS VIA COMPUTATIONAL LINGUISTICS & A.I."
END IF
IF A$ = "NMTBA" THEN
        PRINT "NATIONAL MACHINE TOOL BUILDERS ASSOCIATION"
END IF
IF A$ = "NORC" THEN
        PRINT "NAVAL ORDNANCE RESEARCH CALCULATOR"
        PRINT "IBM'S MOST POWERFUL COMPUTER IN 1954"
END IF
IF A$ = "NSEA" THEN
        PRINT "NATIONAL SPECIAL EDUCATION ALLIANCE"
        PRINT "ORGANIZATION HELPING DISABLED PERSONS BENEFIT FROM COMPUTERS"
END IF
IF A$ = "NSF" THEN
        PRINT "NATIONAL SCIENCE FOUNDATION"
END IF
IF A$ = "NSPE" THEN
        PRINT "NATIONAL SOCIETY OF PROFESSIONAL ENGINEERS"
        PRINT "SOCIETY OF PROFESSIONALLY REGISTERED ENGINEERS"
END IF
IF A$ = "NTDA" THEN
        PRINT "NATIONAL TELECOMMUNICATIONS DEALERS ASSOC."
END IF
IF A$ = "NTU" THEN
        PRINT "NATIONAL TECHNOLOGICAL UNIVERSITY"
        PRINT "U.S. UNIV. DEDICATED TO SATELLITE BROADCASTS OF TECHNICAL STUDIES"
END IF
IF A$ = "NUMMI" THEN
        PRINT "NEW UNITED MOTORS MANUFACTURING INC."
        PRINT "G.M./TOYOTA AUTOMOBILE PLANT JOINT VENTURE"
END IF
IF A$ = "O/S" THEN
        PRINT "OPERATING SYSTEM"
        PRINT "SUPERVISORY COMPUTER PROGRAM WHICH CONTROLS CPU-I/O DATA FLOW"
END IF
IF A$ = "OC" THEN
        PRINT "OPEN CONNECTOR"
        PRINT "TYPE OF PERIPHERAL DRIVER"
END IF
IF A$ = "OCR" THEN
        PRINT "OPTICAL CHARACTER RECOGNITION"
        PRINT "MACHINE IDENTIFICATION OF PRINTED CHARACTERS"
END IF
IF A$ = "OEM" THEN
        PRINT "ORIGINAL EQUIPMENT MANUFACTURER"
END IF
IF A$ = "OEM" THEN
        PRINT "OTHER/ORIGINAL EQUIPMENT MANUFACTURER"
END IF
IF A$ = "OIA" THEN
        PRINT "OPERATOR INFORMATION AREA"
        PRINT "OPERATING AND STATUS INFORMATION LINE AT BOTTOM OF PC SCREEN"
END IF
IF A$ = "OLTP" THEN
        PRINT "ON LINE TRANSACTION PROCESSING"
        PRINT "ACTION OF UPDATING BUSINESS AS RESULT OF CHANGE IN BUSINESS DATABASE"
END IF
IF A$ = "OM" THEN
        PRINT "OPERATIONS MANAGEMENT"
END IF
IF A$ = "ORACLE" THEN
        PRINT "OPERATING SYSTEM USING QUERY/PARALLEL PROCESSING"
END IF
IF A$ = "OSI" THEN
        PRINT "OPEN SYSTEMS INTERCONNECTION"
        PRINT "7 LAYER MODEL NETWORK COMMUNICATION STANDARD"
END IF
IF A$ = "OTA" THEN
        PRINT "OFFICE OF TECHNOLOGY MANAGEMENT"
        PRINT "GOVERNMENT DEPARTMENT"
END IF
IF A$ = "OTV" THEN
        PRINT "ORBIT TRANSFER VEHICLE"
        PRINT "SPACE TUG FOR RAISING PAYLOADS FROM LOW TO HIGH ORBITS"
END IF
IF A$ = "PACS" THEN
        PRINT "PLANT AUTOMATION COMMUNICATIONS SYSTEM"
        PRINT "IBM SERIES 1 CONTROLLER-BASED APPLICATION ENABLER"
END IF
IF A$ = "PAD" THEN
        PRINT "PACKET ASSEMBLER/DISASSEMBLER"
        PRINT "ACCESS DEVICE FOR PACKET SWITCHING NODE (PSN) COMPUTER"
END IF
IF A$ = "PARC" THEN
        PRINT "PALO ALTO RESEARCH CENTER"
        PRINT "XEROX THINK TANK"
END IF
IF A$ = "PBX" THEN
        PRINT "PRIVATE AUTOMATIC BRANCH EXCHANGE"
        PRINT "TYPE OF BUSINESS TELEPHONE SYSTEM"
END IF
IF A$ = "PC" THEN
        PRINT "PERSONAL COMPUTER"
        PRINT "COMPUTER CAPABLE OF STAND-ALONE PROCESSING OR LINKING TO HOST"
END IF
IF A$ = "PC/IDU" THEN
        PRINT "PERSONAL COMPUTER IMAGE DOCUMENT UTILITY"
        PRINT "IBM DOCUMENT IMAGE HANDLING FACILITY BETWEEN HOST AND PC"
END IF
IF A$ = "PCB" THEN
        PRINT "PRINTED CIRCUIT BOARDS"
        PRINT "CIRCUIT BOARD W/ ELECT. CONNECTIONS VIA CONDUCTIVE MATERIAL ON BOARD"
END IF
IF A$ = "PCD" THEN
        PRINT "POLYCRYSTALLINE DIAMOND"
END IF
IF A$ = "PCD" THEN
        PRINT "PROCESS CONTROL DEVICES"
END IF
IF A$ = "PCLP" THEN
        PRINT "PERSONAL COMPUTER LAN PROGRAM"
        PRINT "IBM'S LOCAL AREA NETWORK PROGRAM"
END IF
IF A$ = "PCM" THEN
        PRINT "PULSE CODE MODULATION"
END IF
IF A$ = "PCTFE" THEN
        PRINT "POLYCHLOROTRIFLUOROETHYLENE"
END IF
IF A$ = "PDDI" THEN
        PRINT "PRODUCT DEFINITION DATA INTERFACE"
        PRINT "MINIMUM DATA NEEDED TO FOR INTEGRATED PARTS MANUFACTURING SYSTEM"
END IF
IF A$ = "PDES" THEN
        PRINT "PRODUCT DESIGN EXCHANGE SPECIFICATION"
        PRINT "2ND GEN. IGES FILE FOR PRODUCT MODEL INFO CAPTURE & TRANSMITTAL"
END IF
IF A$ = "PDF" THEN
        PRINT "PROGRAM DEVELOPMENT FACILITY"
        PRINT "AN IBM ENVIRONMENT IN (ES)**3 {E-S CUBED}"
END IF
IF A$ = "PDL" THEN
        PRINT "PROGRAM DEVELOPMENT LANGUAGE"
END IF
IF A$ = "PDM" THEN
        PRINT "PLASMA DISPLAY MATRIX"
        PRINT "ORANGE COLORED, HIGH RESOLUTION, NEON GAS, FLAT SCREEN TECHNOLOGY"
END IF
IF A$ = "PDS" THEN
        PRINT "PERSONAL DECISION SERIES"
        PRINT "AN IBM DSS DESIGNED FOR BUSINESS PROFESSIONAL IBM PC USERS"
END IF
IF A$ = "PE" THEN
        PRINT "PROCESSING ELEMENT"
END IF
IF A$ = "PE" THEN
        PRINT "PROFESSIONAL ENGINEER"
        PRINT "PROFESSIONAL & LEGAL ACCREDIDATION FOR ENGINEERING PROFESSIONALS"
END IF
IF A$ = "PEL" THEN
        PRINT "PICTURE ELEMENT"
        PRINT "SAME AS PIXEL"
END IF
IF A$ = "PFKEY" THEN
        PRINT "PROGRAM FUNCTION KEY"
        PRINT "KEY WHICH PASSES SIGNAL TO PROGRAM CALLING FOR PRTICULAR FUNCTION"
END IF
IF A$ = "PGF" THEN
        PRINT "PRESENTATION GRAPHICS FEATURE"
        PRINT "HIGH LEVEL GRAPHICS MACROS USING GDDM INSTRUCTIONS"
END IF
IF A$ = "PHD" THEN
        PRINT "DOCTORATE DEGREE"
        PRINT "COLLEGE/UNIVERSITY SCIENCE DEGREE- GRADUATE LEVEL"
END IF
IF A$ = "PICS" THEN
        PRINT "PRODUCTION INVENTORY CONTROL SYSTEM"
        PRINT "IBM SOFTWARE UTILIZED BY IRVINE DIVISIONS FOR MRP-CONTAINS IR SCREENS"
END IF
IF A$ = "PIF" THEN
        PRINT "PROGRAM INFORMATION FILES"
        PRINT "FILES USED FOR PRINTING/PLOTTING FROM A PC"
END IF
IF A$ = "PILOT" THEN
        PRINT "PROGRAMMED INQUIRY LEARNING OR TEACHING"
        PRINT "IBM COMMAND-TYPE AUTHORING LANGUAGE FOR COMPUTER ASSISTED INSTRUCTION"
END IF
IF A$ = "PIO" THEN
        PRINT "PROGRAMMED INPUT/OUTPUT"
END IF
IF A$ = "PIXEL" THEN
        PRINT "PICTURE ELEMENT"
        PRINT "SMALLEST INDEPENDENTLY CONTROLLABLE ELEMENT OF DISPLAY SPACE"
END IF
IF A$ = "PLC" THEN
        PRINT "PROGRAMMABLE LOGIC CONTROLLER"
        PRINT "MICROPROCESSOR BASED DEVICE CAPABLE OF CONTROLLING MULT. FUNCTIONS"
END IF
IF A$ = "PLD" THEN
        PRINT "PROGRAMMABLE LOGIC DEVICE"
END IF
IF A$ = "PL1" THEN
        PRINT "PROGRAMMING LANGUAGE"
END IF
IF A$ = "PMS IV" THEN
        PRINT "PROJECT MANAGEMENT SYSTEM IV"
        PRINT "IBM FULL FEATURE PROJECT MANAGEMENT SYSTEM"
END IF
IF A$ = "POS" THEN
        PRINT "PROGRAMMABLE OPTIONS SELECT"
END IF
IF A$ = "POSI" THEN
        PRINT "PROMOTION OF OPEN SYSTEMS INTERCONNECTION"
        PRINT "JAPANESE NETWORKING STANDARDIZATION GROUP"
END IF
IF A$ = "POST" THEN
        PRINT "POST PROCESSOR"
        PRINT "SOFTWARE THAT CUSTOMIZES CLFILES FOR SPECIFIC MACHINE TOOL CONTROLS"
END IF
IF A$ = "PPM" THEN
        PRINT "PAGES PER MINUTE"
        PRINT "PRINTING SPEED"
END IF
IF A$ = "PROFS" THEN
        PRINT "PROFESSIONAL OFFICE SYSTEMS"
        PRINT "IBM SOFTWARE SYSTEM WITH PERSONAL CALENDARING, DOCUMENT CREATION, ETC"
END IF
IF A$ = "PROJACS" THEN
        PRINT "PROJECT ANALYSIS AND CONTROL SYSTEM"
        PRINT "SET OF IBM PROGRAMS FOR CONTROLLING PROJECTS WITHIN CONSTRAINTS"
END IF
IF A$ = "PROLOG" THEN
        PRINT "PROGRAMMING IN LOGIC"
        PRINT "AI PROG. LANG. DEVELOPED AT UNIV. OF MARSEILLES; USED IN EUROPE/JAPAN"
END IF
IF A$ = "PROM" THEN
        PRINT "PROGRAMMABLE READ ONLY MEMORY"
        PRINT "USER PROGRAMMABLE COMPUTER MEMORY FOR DATA READS"
END IF
IF A$ = "PROPLAN" THEN
        PRINT "PROCESS PLANNING SYSTEM"
        PRINT "SIEMENS RESEARCH LAB LISP-BASED SOFTWARE FOR TURNED PARTS"
END IF
IF A$ = "PSL" THEN
        PRINT "PORTABLE STANDARD LISP"
        PRINT "TRANSPORTABLE LISP USED AT U. OF U.; INTERMACHINE TRANSPARENT"
END IF
IF A$ = "PSN" THEN
        PRINT "PACKET SWITCHING NODE"
        PRINT "AN INTELLIGENT COMMUNICATIONS PROCESSOR"
END IF
IF A$ = "PTFE" THEN
        PRINT "POLYTETRAFLUOROETHYLENE"
END IF
IF A$ = "PTP" THEN
        PRINT "POINT TO POINT"
        PRINT "PROGRAMMING & MACHINING VIA POSITIONING, RATHER THAN CONTROLLED MOVES"
END IF
IF A$ = "PWM" THEN
        PRINT "PROFESSIONAL WORK MANAGER"
        PRINT "IBM PC/HOST ENVIRON; MANAGE PROJECTS, CREATE TASKS, AUTOMATE ACTIVITY"
END IF
IF A$ = "QBE" THEN
        PRINT "QUERY-BY-EXAMPLE"
        PRINT "IBM DEVELOPED DATABASE MANAGEMENT SYSTEM"
END IF
IF A$ = "QMF" THEN
        PRINT "QUERY MANAGEMENT FACILITY"
END IF
IF A$ = "R&D" THEN
        PRINT "RESEARCH AND DEVELOPMENT"
        PRINT "IBM DATABASE QUERY FEATURE"
END IF
IF A$ = "R/W" THEN
        PRINT "READ/WRITE"
END IF
IF A$ = "R/W" THEN
        PRINT "READ/WRITE MEMORY"
        PRINT "CONTINUOUSLY CHANGEABLE MEMORY; RAM'S ARE R/W MEMORIES"
END IF
IF A$ = "RADAR" THEN
        PRINT "RADIO DETECTING AND RANGING"
END IF
IF A$ = "RAM" THEN
        PRINT "RANDOM ACCESS MEMORY"
        PRINT "COMPUTER MEMORY AVAILABLE FOR WRITING OR READING-TEMP. WORKING AREA"
END IF
IF A$ = "RAV" THEN
        PRINT "ROBOTIC AIR VEHICLE"
        PRINT "PILOTLESS AIRCRAFT EMPLOYING AI SOFTWARE TO FLY THE PLANE"
END IF
IF A$ = "RDR" THEN
        PRINT "RE-DIRECTOR"
END IF
IF A$ = "RDR" THEN
        PRINT "READER"
END IF
IF A$ = "RECCE" THEN
        PRINT "GENERAL DYNAMICS EXTERNAL AIRCRAFT RECONNAISANCE POD"
END IF
IF A$ = "RESLIM" THEN
        PRINT "RESOURCE LIMITER"
        PRINT "IBM SYSTEM USAGE MONITOR/LIMITER"
END IF
IF A$ = "RFE" THEN
        PRINT "REACH FOR EXCELLENCE"
END IF
IF A$ = "RFP" THEN
        PRINT "REQUEST FOR PROPOSAL"
END IF
IF A$ = "RFTDCA" THEN
        PRINT "REVISABLE-FORM TEXT DOCUMENT CONTENT ARCHITECTURE"
        PRINT "IBM DISPLAYWRITE/370 TEXT FORMAT"
END IF
IF A$ = "RI/SME" THEN
        PRINT "ROBOTICS INTERNATIONAL"
        PRINT "SME AFFILIATE SPECIALIZING IN MANUFACTURING-ROBOTICS TECHNOLOGY"
END IF
IF A$ = "RIA" THEN
        PRINT "ROBOTICS INDUSTRIES ASSOCIATION"
        PRINT "ORGANIZATION OF ROBOTICS INDUSTRY"
END IF
IF A$ = "RISC" THEN
        PRINT "REDUCED INSTRUCTION SET CODE"
END IF
IF A$ = "RJE" THEN
        PRINT "REMOTE JOB ENTRY"
        PRINT "COMPUTER DATA INPUT FROM REMOTE TERMINAL VIA COMMUNICATION LINE"
END IF
IF A$ = "RLL" THEN
        PRINT "RUN LENGTH LIMITED"
        PRINT "PC CONTROLLER CAPABLE OF INCREASING HARD DISK STORAGE AND SPEED"
END IF
IF A$ = "RO" THEN
        PRINT "READ ONLY"
END IF
IF A$ = "ROCF" THEN
        PRINT "REMOTE OPERATOR CONSOLE FACILITY"
        PRINT "CAPABLE OF ROUTING SELECTED MESSAGES TO ALTERNATE OPERATOR STATIONS"
END IF
IF A$ = "ROM" THEN
        PRINT "READ ONLY MEMORY"
        PRINT "COMPUTER MEMORY AVAILABLE FOR READING ONLY"
END IF
IF A$ = "ROM-BIOS" THEN
        PRINT "READ ONLY MEMORY-BASIC INPUT OUTPUT SYSTEM"
        PRINT "IBM PROGRAM CODE WHICH IS PERMANENTLY ETCHED IN COMPUTER MEMORY"
END IF
IF A$ = "RPG11" THEN
        PRINT "PROGRAMMING LANGUAGE"
END IF
IF A$ = "RPL" THEN
        PRINT "REMOTE PROGRAM LOAD"
        PRINT "PROGRAM LOAD TO A PC VIA A NETWORK"
END IF
IF A$ = "RPM" THEN
        PRINT "REVOLUTIONS PER MINUTE"
END IF
IF A$ = "RPQ" THEN
        PRINT "REMOTE PROGRAM QUERY?"
END IF
IF A$ = "RSCS" THEN
        PRINT "REMOTE SPOOLING COMMUNICATIONS SUBSYSTEM"
        PRINT "TRANSFERS DATA BETWEEN IBM VIRTUAL MACHINES AND REMOTE USERS"
END IF
IF A$ = "RSRA" THEN
        PRINT "ROTOR SYSTEMS RESEARCH AIRCRAFT"
        PRINT "SIKORSKY X-WING ROTORCRAFT"
END IF
IF A$ = "RT" THEN
        PRINT "RISC TECHNOLOGY"
        PRINT "IBM PC USING UNIX-BASED AIX OPERATING SYSTEM & RISC"
END IF
IF A$ = "RTD" THEN
        PRINT "RAPID TRANSIT DISTRICT"
END IF
IF A$ = "RTIC" THEN
        PRINT "REAL TIME INTERFACE CONNECTOR"
        PRINT "ADAPTER CARD FOR REAL TIME DEVICE INTERFACE"
END IF
IF A$ = "RTOS" THEN
        PRINT "REAL TIME OPERATING SYSTEMS"
END IF
IF A$ = "SAA" THEN
        PRINT "SYSTEMS APPLICATION ARCHITECTURE"
        PRINT "IBM'S SPEC. OF SOFTWARE APPL'S., COMMUN. PROTOCOLS, & USER INTERFACES"
END IF
IF A$ = "SAGE" THEN
        PRINT "THE LARGEST VACUUM TUBE COMPUTER USED BY USAF IN 50'S"
END IF
IF A$ = "SAP" THEN
        PRINT "SERVICE ACCESS POINTS"
        PRINT "MODIFICATION CAPABILITIES OF COMPUTER SYSTEMS ARCHITECTURE"
END IF
IF A$ = "SAS" THEN
        PRINT "STATISTICAL ANALYSIS SYSTEM"
END IF
IF A$ = "SCARA" THEN
        PRINT "SELECTIVE COMPLIANCE ASSEMBLY ROBOT ARM"
        PRINT "LOW COST, HIGH SPEED, ASSY. ROBOT MOVING MOSTLY ON HORIZONTAL PLANE"
END IF
IF A$ = "SCRAMJET" THEN
        PRINT "SUPERSONIC COMBUSTION RAM JET"
END IF
IF A$ = "SCRIPT" THEN
        PRINT "SCRIPT"
        PRINT "FORMATTER COMPONENT OF DCF"
END IF
IF A$ = "SCSI" THEN
        PRINT "SMALL COMPUTER SYSTEMS INTERFACE"
        PRINT "PRONOUNCED SCUZZY"
END IF
IF A$ = "SDI" THEN
        PRINT "STRATEGIC DEFENSE INITIATIVE"
        PRINT "SPACE-BASED STAR WARS MISSILE DEFENSE PROGRAM"
END IF
IF A$ = "SDLC" THEN
        PRINT "SYNCHRONOUS DATA LINK COMMUNICATION"
        PRINT "IBM COMMUNICATION PROTOCOL"
END IF
IF A$ = "SDRC" THEN
        PRINT "STRUCTURED DYNAMICS RESEARCH CORPORATION"
        PRINT "AUTHOR OF CAEDS CADCAM SOFTWARE"
END IF
IF A$ = "SER" THEN
        PRINT "SURFACE ELECTRICAL RESISTIVITY"
END IF
IF A$ = "SERIES 1" THEN
        PRINT "NEW IBM PROCESSOR USED IN LANS"
END IF
IF A$ = "SFM" THEN
        PRINT "SURFACE FEET PER MINUTE"
END IF
IF A$ = "SFT" THEN
        PRINT "SYSTEM FAULT TOLERANCE"
END IF
IF A$ = "SGML" THEN
        PRINT "STANDARD GENERAL MARKUP LANGUAGE"
        PRINT "AN ANSI DOCUMENT FORMAT STANDARD"
END IF
IF A$ = "SIG" THEN
        PRINT "SPECIAL INTEREST GROUP"
END IF
IF A$ = "SLT" THEN
        PRINT "SOLID LOGIC TECHNOLOGY"
        PRINT "CIRCUIT TECHNOLOGY INTRODUCED ON IBM SYSTEM/360"
END IF
IF A$ = "SME" THEN
        PRINT "SOCIETY OF MANUFACTURING ENGINEERS"
END IF
IF A$ = "SNA" THEN
        PRINT "SYSTEMS NETWORK ARCHITECTURE"
        PRINT "IBM; ORGANIZED STRUCTURE FOR MULTIPLE COMPUTER/COMM. NETWORKS"
END IF
IF A$ = "SNADS" THEN
        PRINT "SNA DISTRIBUTION SERVICES"
        PRINT "IBM MAIL SERVICE FACILITY NOT REQUIRING DIRECT MAINFRAME INTERVENTION"
END IF
IF A$ = "SNAFU" THEN
        PRINT "SITUATION NORMAL-ALL FOULED UP"
        PRINT "MILITARY EXPRESSION COINED DURING WORLD WAR II"
END IF
IF A$ = "SNOBOL" THEN
        PRINT "STRING ORIENTED SYMBOLIC LANGUAGE"
        PRINT "COMPUTER PROGRAMMING LANGUAGE FOR MANIPULATING STRINGS OF SYMBOLS"
END IF
IF A$ = "SOI" THEN
        PRINT "SILICON ON INSULATOR"
        PRINT "INTEGRATED CIRCUIT CHIP MATERIAL ALLOWING SUPER FAST CLOCK SPEEDS"
END IF
IF A$ = "SOS" THEN
        PRINT "SILICON ON SAPPHIRE"
        PRINT "INTEGRATED CIRCUIT CHIP MATERIAL ALLOWING SUPER FAST CLOCK SPEEDS"
END IF
IF A$ = "SPAG" THEN
        PRINT "STANDARDS PROMOTION & APPLICATION GROUP"
        PRINT "EUROPEAN NETWORKING STANDARDIZATION GROUP"
END IF
IF A$ = "SPC" THEN
        PRINT "STATISTICAL PROCESS CONTROL"
        PRINT "RANDOM SAMPLING OF TARGET DIMENSIONS TO ENABLE CORRECTIVE MEASURES"
END IF
IF A$ = "SPE" THEN
        PRINT "SYSTEM PRODUCT EDITOR"
        PRINT "ALSO CALLED XEDIT"
END IF
IF A$ = "SPOOL" THEN
        PRINT "SIMULTANEOUS PERIPHERAL OPERATIONS ONLINE"
        PRINT "IBM "
END IF
IF A$ = "SPOT" THEN
        PRINT "SELECTION, PLANNING, OPPORTUNITY, TECHNOLOGY"
        PRINT "SME SPONSORED AWARD FOR COMPANIES ACHIEVING EXCELLENCE IN LASER TECH."
END IF
IF A$ = "SQL" THEN
        PRINT "STRUCTURED QUERY LANGUAGE"
        PRINT "IBM RELATIONAL DATABASE PROGRAMMING LANGUAGE"
END IF
IF A$ = "SRB" THEN
        PRINT "SOLID ROCKET BOOSTER"
END IF
IF A$ = "SRPI" THEN
        PRINT "SERVER-REQUESTOR PROGRAMMING INTERFACE"
        PRINT "MAJOR SUBSET OF LU6.2/APPC"
END IF
IF A$ = "SRPI" THEN
        PRINT "SERVER-REQUESTOR PROGRAMMING INTERFACE"
        PRINT "IBM INTERFACE TOOLS FOR DEVELOPING INTERACTIVE HOST/PC APPLICATIONS"
END IF
IF A$ = "SRV" THEN
        PRINT "SERVER"
        PRINT "NETWORK SERVER"
END IF
IF A$ = "SSCAD" THEN
        PRINT "SPACE STRUCTURES COMPUTER AIDED DESIGN"
END IF
IF A$ = "STOL" THEN
        PRINT "SHORT TAKEOFF AND LANDING"
END IF
IF A$ = "STV" THEN
        PRINT "SPACE TRANSPORT VEHICLE"
END IF
IF A$ = "SUMMIT" THEN
        PRINT "IBM 3190 MAINFRAME CURRENTLY UNDER DEVELOPMENT- FUTURE TOP-OF-THE-LIN"
END IF
IF A$ = "SYM" THEN
        PRINT "SYMBOLIC"
END IF
IF A$ = "SYSRQ" THEN
        PRINT "SYSTEM REQUEST"
        PRINT "KEY WHICH SIGNALS HOST COMPUTER DURING HOST SESSION"
END IF
IF A$ = "TAC" THEN
        PRINT "THE APPLICATION CONNECTION"
        PRINT "LOTUS PRODUCT FOR PC-PC & PC-MAINFRAME APPLICATION CONNECTIONS"
END IF
IF A$ = "TASC+" THEN
        PRINT "TELL, ASK, SPECIFY, CHECK, AND ACKNOWLEDGE"
        PRINT "MANAGEMENT PHILOSOPHY"
END IF
IF A$ = "TCA" THEN
        PRINT "TELE-COMMUNICATIONS ASSOCIATION"
END IF
IF A$ = "TCAS" THEN
        PRINT "TRAFFIC ALERT AND COLLISION AVOIDANCE"
        PRINT "COLLISION AVOIDANCE SYSTEM FOR AIRCRAFT"
END IF
IF A$ = "TCE" THEN
        PRINT "TETRACHLOROETHYLENE"
END IF
IF A$ = "TCSEE" THEN
        PRINT "TECH. COORDINATOR SATELLITE EDUCATION EXCHANGE"
        PRINT "IBM INTERACTIVE SATELLITE EDUCATION NETWORK FOR TECH. COORDINATORS"
END IF
IF A$ = "TECHMOD" THEN
        PRINT "TECHNOLOGY MODERNIZATION PROGRAM"
        PRINT "GOVERNMENT SPONSORED CIM R&D FUNDING PROGRAM"
END IF
IF A$ = "TFE" THEN
        PRINT "TEFLON"
END IF
IF A$ = "TGC" THEN
        PRINT "TOOL & GAGE CONTROL"
END IF
IF A$ = "TIM" THEN
        PRINT "TOKEN/NET INTERFACE MODULE"
END IF
IF A$ = "TIR" THEN
        PRINT "TOTAL INDICATOR RUNOUT"
END IF
IF A$ = "TMS" THEN
        PRINT "TOOL MANAGEMENT SYSTEM"
END IF
IF A$ = "TOP" THEN
        PRINT "TECHNICAL AND OFFICE PROTOCOL"
        PRINT "BOEING GENERATED 7-LEVEL ISO COMPATIBLE LANGUAGETOP"
END IF
IF A$ = "TPA" THEN
        PRINT "TARGET POINT ALIGN"
        PRINT "SIMULTANEOUS RETURN OF ALL MACHINE AXES TO ALIGNMENT OR ZERO POSITION"
END IF
IF A$ = "TQC" THEN
        PRINT "TOTAL QUALITY CONTROL"
END IF
IF A$ = "TRI" THEN
        PRINT "TRICHLOROETHYLENE"
END IF
IF A$ = "TS" THEN
        PRINT "TERMINAL SERVER"
END IF
IF A$ = "TSO" THEN
        PRINT "TIME SHARING OPTION"
        PRINT "MVS ENVIRONMENT PROVIDING CONVER"
        PRINT "TIME SHARING FROM REMOTE TERMINALS"
END IF
IF A$ = "TSO" THEN
        PRINT "TIME SHARING OPTION"
        PRINT "MVS ENVIRONMENT PROVIDING CONVER"
        PRINT "TIME SHARING FROM REMOTE TERMINALS"
END IF
IF A$ = "TSR" THEN
        PRINT "TERMINATE STAY RESIDENT PC PROGRAMS"
END IF
IF A$ = "TTY" THEN
        PRINT "TELETYPEWRITER"
        PRINT "TERMINAL EVALUATION MODE, COMPATIBLE WITH IBM KEYBOARD"
END IF
IF A$ = "TWINAX" THEN
        PRINT "TWINAXIAL WIRE"
        PRINT "USED TO CONNECT 5520 WORD PROCESSING TERMINALS TO CONTROLLERS"
END IF
IF A$ = "T1" THEN
        PRINT "REMOTE T1"
        PRINT "TELEPHONE LINE USED FOR MAINFRAME TO REMOTE CONTOLLER COMMUNICATIONS"
END IF
IF A$ = "UART" THEN
        PRINT "UNIVERSAL ASYNCHRONOUS RECEIVER/TRANSMITTER"
END IF
IF A$ = "UAW" THEN
        PRINT "UNITED AUTOMOBILE WORKERS"
END IF
IF A$ = "UIG" THEN
        PRINT "ULTRASONIC IMPACT GRINDING"
END IF
IF A$ = "UIS" THEN
        PRINT "UNIVERSAL INFORMATION SERVICE"
        PRINT "AT&T'S NEXT GENERATION ISDN REPLACEMENT PRODUCT"
END IF
IF A$ = "UNIX" THEN
        PRINT "OPERATING SYSTEM CREATED AT BELL LABS: C LANGUAGE ALLOWS PORTABILITY"
END IF
IF A$ = "USW" THEN
        PRINT "UNITED STEEL WORKERS"
        PRINT "STEEL WORKERS UNION"
END IF
IF A$ = "VAN" THEN
        PRINT "VALUE ADDED NETWORKING"
END IF
IF A$ = "VAR" THEN
        PRINT "VALUE ADDED RESELLER"
END IF
IF A$ = "VAX" THEN
        PRINT "DEC COMPUTER"
END IF
IF A$ = "VDI" THEN
        PRINT "VIRTUAL DEVICE INTERFACE"
END IF
IF A$ = "VDM" THEN
        PRINT "VIRTUAL DEVICE METAFILE"
END IF
IF A$ = "VDT" THEN
        PRINT "VIDEO DISPLAY TERMINAL"
        PRINT "SAME AS A CRT"
END IF
IF A$ = "VGA" THEN
        PRINT "VIDEO CASSETTE RECORDER"
END IF
IF A$ = "VGA" THEN
        PRINT "VIDEO GRAPHICS ARRAY"
        PRINT "IBM COLOR GRAPHICS STANDARD USED ON PERSONAL COMPUTER/2 SERIES"
END IF
IF A$ = "VLSI" THEN
        PRINT "VERY LARGE SCALE INTEGRATED CIRCUIT"
END IF
IF A$ = "VM" THEN
        PRINT "VIRTUAL MACHINE"
        PRINT "IBM INTERACTIVE COMPUTING OPERATING SYSTEM"
END IF
IF A$ = "VNET" THEN
        PRINT "IBM TELEPROCESSING NETWORK"
END IF
IF A$ = "VSAM" THEN
        PRINT "VIRTUAL STORAGE ACCESS METHOD"
        PRINT "AN IBM FILE STRUTURE ALLOWING KEYED SEARCH RETRIEVALS"
END IF
IF A$ = "VSE" THEN
        PRINT "VIRTUAL STORAGE EXTENDED"
        PRINT "AN OPERATING SYSTEM THAT IS AN EXTENSION OF DOS/VS"
END IF
IF A$ = "VTAM" THEN
        PRINT "VIRTUAL TELECOMMUNICATIONS ACCESS METHOD"
        PRINT "IBM SOFTWARE MANAGING I/O BETWEEN HOST MAINFRAME & OTHER COMPUTERS"
END IF
IF A$ = "VTL" THEN
        PRINT "VERTICAL TURNING LATHES"
END IF
IF A$ = "VTS" THEN
        PRINT "VIRTUAL TERMINAL SERVICE"
        PRINT "APPLICATION DATA EXCHANGE METHOD"
END IF
IF A$ = "WAN" THEN
        PRINT "WIDE AREA NETWORKING"
        PRINT "ACCESS OF REMOTE COMPUTER TERMINALS & SYSTEMS VIA COMMON LINKS"
END IF
IF A$ = "WATS" THEN
        PRINT "WIDE AREA TELECOMMUNICATIONS SERVICE"
        PRINT "MESSAGE TELEPHONE SERVICE"
END IF
IF A$ = "WCDP" THEN
        PRINT "WORK CELL DEVICE PROGRAMMING"
        PRINT "NEW CIM NAME FOR N.C. PROGRAMMING"
END IF
IF A$ = "WFT" THEN
        PRINT "WINOGRAD FOURIER RESPONSE"
END IF
IF A$ = "WIP" THEN
        PRINT "WORK IN PROGRESS"
END IF
IF A$ = "WO" THEN
        PRINT "WRITE ONLY"
END IF
IF A$ = "WORM" THEN
        PRINT "WRITE ONCE-READ MOSTLY"
        PRINT "OPTICAL DISK FORMATTING TECHNIQUE USING SPIRAL PATTERN OF PITS"
END IF
IF A$ = "WSCTRL" THEN
        PRINT "WORKSTATION CONTROL MODE"
        PRINT "PC MODE FOR COMMANDS WHICH CONTROL SESSION DATA DISPLAY"
END IF
IF A$ = "WSF" THEN
        PRINT "WORKSTATION FUNCTION"
END IF
IF A$ = "WYGINS" THEN
        PRINT "WHAT YOU GET IS NO SURPRISE(WIGGINS)"
        PRINT "SOFTWARE ACRONYM: WYSIWYG PROGRAM COMPATIBLE W/ MOST OUTPUT DEVICES"
END IF
IF A$ = "WYSIWYG" THEN
        PRINT "WHAT YOU SEE IS WHAT YOU GET(WHIZ-E-WIG)"
        PRINT "SOFTWARE ACRONYM: YOU GET WHAT YOU SEE, AND VISA-VERSA"
END IF
IF A$ = "X.25" THEN
        PRINT "REMOTE X.25"
        PRINT "PROTOCOL CONNECTING 3274 CONTROLLER VIA PACKET-SWITCHED NETWORK"
END IF
IF A$ = "XA" THEN
        PRINT "EXTENDED ARCHITECTURE"
        PRINT "BASIC IBM COMPUTER ARCHITECTURE USED WITH SYSTEM/370"
END IF
IF A$ = "XCON" THEN
        PRINT "EXPERT CONFIGURER"
        PRINT "CARNEGIE MELON/DEC DEVELOPED RULE-BASED COMPUTER-CONFIGURATION PRGM."
END IF
IF A$ = "XEDIT" THEN
        PRINT "CMS EDITOR"
        PRINT "SYSTEM PRODUCT EDITOR"
END IF
IF A$ = "XMA" THEN
        PRINT "EXPANDED MEMORY ADAPTER"
        PRINT "IBM EXPANDED MEMORY FUNCTION BOARD FOR 3270PC'S"
END IF
IF A$ = "XMODEM" THEN
        PRINT "COMMUNICATION PROTOCOL"
END IF
IF A$ = "ZETALISP" THEN
        PRINT "DESCENDANT OF MACLISP LANGUAGE, DESIGNED FOR SYMBOLICS LISP MACHINES"
END IF
IF A$ = "3GL" THEN
        PRINT "3RD GENERATION LANGUAGE"
END IF
IF A$ = "3M" THEN
        PRINT "MINNESOTA MINING AND MANUFACTURING"
END IF
IF A$ = "4GL" THEN
        PRINT "4TH GENERATION LANGUAGE"
END IF
IF A$ = "5GL" THEN
        PRINT "5TH GENERATION LANGUAGE"
        PRINT "ADV. SOFTWARE CAPABLE OF UTILIZING PARRALLEL & KNOWLEDGE PROCESSING"
END IF
IF A$ = "802.2" THEN
        PRINT "IEEE INTERFACE"
END IF
IF A$ = "802.5" THEN
        PRINT "IEEE INTERFACE"
END IF
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
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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

SUB SBDUMP
SHELL "XCOPY A: C: /e /v /w"
END SUB

SUB SBEDIT
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
SBVARABLES
PRINT LTRIM$(STR$(E)); A$(E / 10)
PRINT LTRIM$(STR$(E));
LINE INPUT A$(E / 10)
END SUB

SUB SBEGABLOAD
E$ = MID$(A$, 11, LEN(A$))
DEF SEG = &HA000
OUT &H3C4, 2
OUT &H3C5, 1
F$ = E$ + ".001"
BLOAD F$, 0
OUT &H3C4, 2
OUT &H3C5, 2
F$ = E$ + ".002"
BLOAD F$, 0
OUT &H3C4, 2
OUT &H3C5, 4
F$ = E$ + ".003"
BLOAD F$, 0
OUT &H3C4, 2
OUT &H3C5, 8
F$ = E$ + ".004"
BLOAD F$, 0
OUT &H3C4, 2
OUT &H3C5, &HF
DEF SEG

END SUB

SUB SBEGABSAVE
E$ = MID$(A$, 11, LEN(A$))
DEF SEG = &HA000
OUT &H3CE, 4
OUT &H3CF, 0
F$ = E$ + ".001"
BSAVE F$, 0, 28000
OUT &H3CE, 4
OUT &H3CF, 1
F$ = E$ + ".002"
BSAVE F$, 0, 28000
OUT &H3CE, 4
OUT &H3CF, 2
F$ = E$ + ".003"
BSAVE F$, 0, 28000
OUT &H3CE, 4
OUT &H3CF, 3
F$ = E$ + ".004"
BSAVE F$, 0, 28000
OUT &H3CE, 4
OUT &H3CF, 0
DEF SEG
END SUB

SUB SBEND
SBEXIT = -1
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
                IF SBSTACK > 250 THEN
                        PRINT "Error.Possible Stack Space Overflow."
                        SBSTACK = 0
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
                E$ = MID$(A$, A + 1, B - 1)
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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

SUB SBMKDIR
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
MKDIR E$
END SUB

SUB SBMOD
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                PRINT "Missing Operand Error."
                GOTO 126
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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
                E$ = MID$(A$, A + 1, B - 1)
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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

SUB SBRMDIR
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
RMDIR E$
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
                IF SBEXIT = -1 THEN 1432
                A$ = A$(J)
                COMMANDS (A$)
        NEXT J
1432
END SUB

SUB SBRUNTIME
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
IF ERR = 52 THEN PRINT "Bad file name or number."
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

SUB SBSAVE
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
                SBVARABLES
                Q = E
                E$ = MID$(A$, B + 1, LEN(A$))
                SBVARABLES
                W = E
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

SUB SBUNZIP
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
CHDIR "C:\"
T$ = "C:\" + E$
MKDIR T$
CHDIR T$
D$ = "C:\PKUNZIP -o A:" + E$ + ".ZIP"
SHELL D$
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

SUB SBVARABLES
SELECT CASE E$
CASE "A" TO "Z"
        G = INSTR(E$, "$")
        IF G = 0 THEN
                E = VAR(ASC(LEFT$(E$, 1)))
        ELSE
                E$ = VAR$(ASC(LEFT$(E$, 1)))
        END IF
CASE ELSE
        E = VAL(E$)
END SELECT
1540 END SUB

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

