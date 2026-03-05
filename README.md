# SBasic â€” Super Basic Interpreter Collection

This repository contains a collection of six standalone BASIC interpreter/environment programs, each written in **QuickBASIC** (QB 4.5 era). Every `.BAS` file is an **independent, self-contained version** of the interpreter â€” they are not meant to be run together. The programs are old, incomplete in places, and no longer actively developed.

---

## Table of Contents

1. [Background](#background)
2. [File Overview](#file-overview)
3. [Architecture](#architecture)
4. [Version History](#version-history)
5. [Command Reference](#command-reference)
   - [Core Commands (all versions)](#core-commands-all-versions)
   - [Math & Numeric Functions](#math--numeric-functions)
   - [Graphics Commands](#graphics-commands)
   - [Sound Commands](#sound-commands)
   - [File & System Commands](#file--system-commands)
   - [Variable & Program Commands](#variable--program-commands)
   - [Arithmetic Operations](#arithmetic-operations)
   - [Trig & Hyperbolic Functions (SBASIC3 / SBASIC3B)](#trig--hyperbolic-functions-sbasic3--sbasic3b)
   - [Temperature Conversions (SBASIC3B only)](#temperature-conversions-sbasic3b-only)
   - [Dictionary Command (SBASIC.BAS only)](#dictionary-command-sbasicbas-only)
6. [Error Handling](#error-handling)
7. [Source Files](#source-files)
   - [SBA.BAS](#sbabas-source)
   - [SBASIC.BAS](#sbasicbas-source)
   - [SBASIC1.BAS](#sbasic1bas-source)
   - [SBASIC2.BAS](#sbasic2bas-source)
   - [SBASIC3.BAS](#sbasic3bas-source)
   - [SBASIC3B.BAS](#sbasic3bbas-source)

---

## Background

SBasic (Super Basic) is a text-mode command interpreter for DOS, written entirely in QuickBASIC. It acts as an interactive shell where users type commands one line at a time. Each command is dispatched to a corresponding QB subroutine that wraps or extends the native QuickBASIC function.

The project went through several revisions, each building on the previous:

| File | Name | Lines |
|------|------|-------|
| `SBA.BAS` | Advanced Super Basic v1.00 / BASICB v7.00 | ~1,078 |
| `SBASIC.BAS` | Super Advanced Super Basic v1.00 / BASICB v2.00 | ~2,697 |
| `SBASIC1.BAS` | Super Advanced Super Basic v2.00 / BASICB v3.00 | ~4,992 |
| `SBASIC2.BAS` | Super Advanced Super Basic v3.00 / BASICB v4.00 | ~2,422 |
| `SBASIC3.BAS` | Super Advanced Super Basic v3.00 / BASICB v5.00 | ~1,029 |
| `SBASIC3B.BAS` | Super Advanced Super Basic v3.00 / BASICB v5.00 | ~3,464 |

> **Note:** The version numbers are inconsistent across files, with some files sharing the same displayed version string while being clearly different codebases. The files appear to represent branching development paths rather than a linear history.

---

## File Overview

### SBA.BAS
The earliest (or an early-branch) version. Uses globally shared variables (`A$`, `VARIBLE()`, `VARIBLE$()`, `Z.CHR()`). The READY loop is a simple numbered-line GOTO. Commands are dispatched directly from a single `COMMANDS` sub. Falls through to `SHELL A$` for any unrecognized input, allowing execution of DOS commands.

**Startup banner:**
```
Advanced Super Basic Version 1.00
Super Basic Version 5.00
BASICB Version 7.00
```

### SBASIC.BAS
Significantly expanded. Adds the `ADVANCED` dispatcher sub (handles a superset of commands), `GRAPHICS` sub, `SBSOUND` sub, and the large `DICTIONARY` command that looks up thousands of computer/technology acronyms and abbreviations. Introduces a `RUNTIME` error handler. Uses `VAR()` / `VAR$()` for variables instead of `VARIBLE()`/`VARIBLE$()`.

**Startup banner:**
```
Super Advanced Super Basic Version 1.00
Super Advanced Graphic Basic Version 1.00
Super Advanced Sound Basic Version 1.00
BASICB Version 2.00
```

### SBASIC1.BAS
The largest version (~5,000 lines). All commands now have `SB`-prefixed handler subroutines (`SBPRINT`, `SBCIRCLE`, etc.). Adds file/directory management (`SBCHDIR`, `SBMKDIR`, `SBRMDIR`), EGA bitmap load/save (`SBEGABLOAD`, `SBEGABSAVE`), UNZIP support, an internal line editor (`SBEDIT`, `SBDELETE`, `SBDUMP`), and a `SBSTACK` program-line array for running stored code. Has a two-part command dispatcher (`COMMANDS` + `COMMANDS2`).

**Startup banner:**
```
BASICB Version 3.00
Super Advanced Super Basic Version 2.00
Super Advanced Graphic Basic Version 2.00
Super Advanced Sound Basic Version 2.00
```

### SBASIC2.BAS
Shares most of the structure of SBASIC1 but without the advanced file-management commands (no CHDIR/MKDIR/RMDIR/UNZIP/EGAB). Introduces a `SCSAVE` (screen save) sub and a separate `RUNTIME` sub for error handling. The `SBSTACK` program array is retained.

**Startup banner:**
```
BASICB Version 4.00
Super Advanced Super Basic Version 3.00
```

### SBASIC3.BAS
A focused math extension. Adds trigonometric extensions (`SEC`, `CSC`, `COT`, `DEG`, `RAD`) and all six hyperbolic functions (`SINH`, `COSH`, `TANH` and their inverses). Also adds temperature conversions between Fahrenheit and Celsius/Kelvin/RÃ©aumur/Rankine. Displays a box-drawing UI splash screen on startup using the `Intro` sub. Does **not** include the full interpreter command set from SBASIC1/SBASIC2.

**Startup banner (in Intro box):**
```
Super Advanced Super Basic Version 3.00
BASICB Version 5.00
```

### SBASIC3B.BAS
The most complete version (~3,464 lines). Combines the full command set of SBASIC2 with all the math extensions and temperature conversions of SBASIC3. Adds all 20 temperature scale conversions (Fahrenheit, Celsius, Kelvin, Rankine, RÃ©aumur â€” every pair). Uses the box-drawing splash screen from SBASIC3. This is the most feature-rich standalone file in the collection.

**Startup banner (in Intro box):**
```
Super Advanced Super Basic Version 3.00
BASICB Version 5.00
```

---

## Architecture

Every version follows the same basic pattern:

```
Main Program
  â”‚
  â”œâ”€ Initialize (SCREEN 0, COLOR, print banner, DIM arrays)
  â”‚
  â””â”€ Loop:
       READY  â”€â”€â–º prints prompt, LINE INPUT A$
                          â”‚
                          â””â”€â–º COMMANDS (A$)
                                 â”‚
                                 â”œâ”€â”€ Exact-match dispatcher (IF LEFT$(A$,...) = "CMD" THEN ...)
                                 â”œâ”€â”€ Falls through to secondary dispatcher (COMMANDS2, ADVANCED, etc.)
                                 â””â”€â”€ Unknown input â”€â”€â–º SHELL A$ (SBA.BAS only) or ignored
```

### Shared Global Variables

All versions use `COMMON SHARED` to pass state between subroutines:

| Variable | Description |
|----------|-------------|
| `A$` | Current input line |
| `VAR(0..255)` | Numeric variable storage (Aâ€“Z map to indices 65â€“90) |
| `VAR$(0..255)` | String variable storage |
| `A$(0..255)` | Program line storage (used by RUN/LIST/SAVE/LOAD) |
| `Z.CHR(0..8)` | Scratch buffer for EXPAND (large-text rendering) |
| `LN` | Current program line number |
| `SBSTACK` | Stack pointer for stored program execution |
| `E$`, `E` | Parsed argument (string and numeric) |

### Prompt Style
- **SBA.BAS / SBASIC.BAS / SBASIC1.BAS / SBASIC2.BAS:** Simple `LINE INPUT A$` with no visible prompt.
- **SBASIC3.BAS / SBASIC3B.BAS:** Uses box-drawing characters (`â–‘` left, `â–‘` right) as a bordered prompt, and draws a full-screen box using IBM PC line-drawing characters.

---

## Version History

| Version | File | Key Additions |
|---------|------|---------------|
| BASICB 7.00 / Adv. Super Basic 1.00 | `SBA.BAS` | Initial interpreter, basic I/O, graphics, sound, file ops |
| BASICB 2.00 / Super Adv. Super Basic 1.00 | `SBASIC.BAS` | DICTIONARY, GRAPHICS sub, SBSOUND, RUNTIME handler, extended math |
| BASICB 3.00 / Super Adv. Super Basic 2.00 | `SBASIC1.BAS` | SB-prefixed subs, CHDIR/MKDIR/RMDIR, EGAB graphics, EDIT/DELETE/DUMP, UNZIP |
| BASICB 4.00 / Super Adv. Super Basic 3.00 | `SBASIC2.BAS` | Streamlined SBASIC1, SCSAVE (screen save), separate RUNTIME |
| BASICB 5.00 / Super Adv. Super Basic 3.00 | `SBASIC3.BAS` | Trig extensions (SEC/CSC/COT), hyperbolic functions, temperature conversions, box UI |
| BASICB 5.00 / Super Adv. Super Basic 3.00 | `SBASIC3B.BAS` | Full command set + all SBASIC3 math extensions + all 20 temperature conversions |

---

## Command Reference

Commands are **case-sensitive** in the dispatcher (tested with `LEFT$` against uppercase strings). All versions accept the commands documented here, though earlier versions may have fewer commands and slightly different behavior.

### Core Commands (all versions)

| Command | Syntax | Description |
|---------|--------|-------------|
| `PRINT` or `?` | `PRINT <text>` | Print text or value to screen |
| `CLS` / `BLANK` | `CLS` | Clear screen |
| `BEEP` / `BELL` | `BEEP` | Sound the terminal bell |
| `DATE` / `DATE$` | `DATE` | Print current system date |
| `TIME` / `TIME$` | `TIME` | Print current system time |
| `TIMER` | `TIMER` | Print elapsed seconds since midnight |
| `REM` / `'` | `REM comment` | Comment line, ignored |
| `SYSTEM` | `SYSTEM` | Exit to DOS/OS |
| `RESET` | `RESET` | Reset/close all open files |
| `CLOSE` | `CLOSE` | Close all open files |
| `MEM` / `MEMORY` | `MEM` | Print free memory in bytes |
| `PI` | `PI` | Print pi (3.14285714...) |

### Math & Numeric Functions

These commands evaluate and print a single numeric result.

| Command | Syntax | Description |
|---------|--------|-------------|
| `ABS` / `ABSOLUTE` | `ABS <n>` | Absolute value |
| `ATN` | `ATN <n>` | Arctangent (radians) |
| `CDBL` | `CDBL <n>` | Convert to double precision |
| `CINT` | `CINT <n>` | Convert to integer (rounded) |
| `COS` | `COS <n>` | Cosine (radians) |
| `CSNG` | `CSNG <n>` | Convert to single precision |
| `EXP` | `EXP <n>` | e raised to power n |
| `FIX` | `FIX <n>` | Truncate to integer (toward zero) |
| `FRE` | `FRE <n>` | Free memory query |
| `INT` | `INT <n>` | Floor integer |
| `LOG` | `LOG <n>` | Natural logarithm |
| `RND` | `RND <n>` | Random number |
| `SGN` | `SGN <n>` | Sign of number (-1, 0, 1) |
| `SIN` | `SIN <n>` | Sine (radians) |
| `SQR` | `SQR <n>` | Square root |
| `TAN` | `TAN <n>` | Tangent (radians) |
| `ASC` | `ASC <char>` | ASCII code of character |
| `CHR$` | `CHR$ <n>` | Character from ASCII code |
| `HEX$` | `HEX$ <n>` | Hexadecimal string of integer |
| `INP` | `INP <port>` | Read byte from hardware port |
| `LEN` | `LEN <string>` | Length of string |
| `OCT$` | `OCT$ <n>` | Octal string of integer |
| `POS` | `POS <n>` | Current cursor column position |
| `SPACE$` | `SPACE$ <n>` | String of n spaces |
| `SPC` | `SPC <n>` | Print n spaces |
| `STR$` | `STR$ <n>` | String representation of number |
| `TAB` | `TAB <n>` | Advance cursor to column n |
| `VAL` | `VAL <string>` | Numeric value of string |
| `VARPTR$` | `VARPTR$ <var>` | Pointer address of variable |
| `RANDOMIZE` | `RANDOMIZE` | Seed random number generator |

### Graphics Commands

These commands require an appropriate screen mode (set with `SCREEN`).

| Command | Syntax | Description |
|---------|--------|-------------|
| `SCREEN` | `SCREEN <mode>` | Set screen mode (0=text, 1=CGA 320Ã—200, 2=CGA 640Ã—200, etc.) |
| `COLOR` | `COLOR <fg>,<bg>` | Set foreground/background color |
| `BACKGROUND` | `BACKGROUND <color>` | Set background color |
| `CLS` | `CLS` | Clear screen |
| `CIRCLE` | `CIRCLE (<x>,<y>),<r>,<c>` | Draw circle at (x,y) radius r color c |
| `LINE` | `LINE (<x1>,<y1>)-(<x2>,<y2>),<c>` | Draw line |
| `BOX` | `BOX (<x1>,<y1>)-(<x2>,<y2>),<c>` | Draw filled box / rectangle |
| `DRAW` | `DRAW <string>` | Execute graphics macro string |
| `PAINT` | `PAINT (<x>,<y>),<c>` | Flood fill area with color |
| `PSET` | `PSET (<x>,<y>),<c>` | Set pixel |
| `PRESET` | `PRESET (<x>,<y>)` | Reset pixel to background color |
| `POINT` | `POINT (<x>,<y>)` | Return color of pixel |
| `PEEK` | `PEEK <addr>` | Read byte from memory address |
| `POKE` | `POKE <addr>,<val>` | Write byte to memory address |
| `OUT` | `OUT <port>,<val>` | Write byte to hardware port |
| `WIDTH` | `WIDTH <n>` | Set screen width (40 or 80 columns) |
| `BLINK` | `BLINK <text>` | Flash/blink text on screen (repeated print) |
| `EXPAND` | `EXPAND (<cx>,<cy>),(xsc,ysc),<text>` | Render text at large size using ROM font bitmaps |
| `STICK` | `STICK <n>` | Read joystick axis value |
| `STRIG` | `STRIG <n>` | Read joystick button state |
| `PEN` | `PEN <n>` | Read light pen status |

#### Screen Modes (for `SCREEN` command)

| Mode | Description |
|------|-------------|
| 0 | Text mode (40 or 80 cols) |
| 1 | CGA 320Ã—200, 4 colors |
| 2 | CGA 640Ã—200, 2 colors |
| 7 | EGA 320Ã—200, 16 colors |
| 8 | EGA 640Ã—200, 16 colors |
| 9 | EGA 640Ã—350, 16 colors |
| 10 | EGA 640Ã—350, 4 colors |
| 11 | VGA 640Ã—480, 2 colors |
| 12 | VGA 640Ã—480, 16 colors |
| 13 | VGA 320Ã—200, 256 colors |

### Sound Commands

| Command | Syntax | Description |
|---------|--------|-------------|
| `SOUND` | `SOUND <freq>,<duration>` | Play tone at frequency (Hz) for duration (clock ticks) |
| `PLAY` | `PLAY <string>` | Play music macro language (MML) string |
| `BEEP` | `BEEP` | Short default beep |
| `ALARM` | `ALARM` | Play alarm tone sequence |
| `ALERT` | `ALERT` | Play alert tone sequence |

### File & System Commands

| Command | Syntax | Description |
|---------|--------|-------------|
| `FILES` / `DIR` / `DIRECTORY` | `FILES [pattern]` | List files (optionally matching pattern) |
| `LOAD` | `LOAD <filename>` | Load a program from file into line array |
| `SAVE` | `SAVE <filename>` | Save current program lines to file |
| `RUN` | `RUN` | Execute stored program lines |
| `LIST` | `LIST` | Print stored program lines to screen |
| `NEW` | `NEW` | Clear current program from memory |
| `AUTO` | `AUTO` | Automatically number new program lines |
| `GOTO` | `GOTO <line>` | Jump to line number in stored program |
| `EDIT` *(SBASIC1)* | `EDIT <line>` | Edit a stored program line interactively |
| `DELETE` *(SBASIC1)* | `DELETE <line>` | Delete a stored program line |
| `DUMP` *(SBASIC1)* | `DUMP` | Print all variables and their values |
| `CHDIR` *(SBASIC1)* | `CHDIR <path>` | Change current directory |
| `MKDIR` *(SBASIC1)* | `MKDIR <path>` | Create directory |
| `RMDIR` *(SBASIC1)* | `RMDIR <path>` | Remove directory |
| `UNZIP` *(SBASIC1)* | `UNZIP <file>` | Extract a ZIP archive (via SHELL) |
| `EGABLOAD` *(SBASIC1)* | `EGABLOAD <file>` | Load an EGA/VGA .BSV bitmap file |
| `EGABSAVE` *(SBASIC1)* | `EGABSAVE <file>` | Save screen as EGA/VGA .BSV bitmap |
| `SCREEN SAVE` *(SBASIC2)* | `SCREEN SAVE <file>` | Save current screen contents to file |
| `USER` | `USER` | Display user info / custom message |

### Variable & Program Commands

| Command | Syntax | Description |
|---------|--------|-------------|
| `INPUT` | `INPUT <varname>` | Prompt user for value and store in variable |
| `KEY` | `KEY <n>` | Read state of a function key |
| `INCREASE` | `INCREASE <var>` | Increment a numeric variable by 1 |
| `DECREASE` | `DECREASE <var>` | Decrement a numeric variable by 1 |
| `WAIT` | `WAIT <n>` | Pause execution for n milliseconds |
| `ALLOW` | `ALLOW <var>,<val>` | Assign value to a variable (`LET` equivalent) |
| `ADVANCE` | `ADVANCE <var>` | Advance / print variable value |
| `ACKNOWLEDGE` | `ACKNOWLEDGE [msg]` | Print message and wait for keypress |
| `ALERT` | `ALERT [msg]` | Display an alert message |
| `ASLEEP` | `ASLEEP <n>` | Sleep for n seconds |
| `ACCEPT` *(SBASIC.BAS)* | `ACCEPT` | Accept / validate input |
| `ACCESS` *(SBASIC.BAS)* | `ACCESS <resource>` | Report access information |
| `VARIABLES` | `VARIABLES` | List all defined variables |

### Arithmetic Operations

| Command | Syntax | Description |
|---------|--------|-------------|
| `ADD` | `ADD <a>,<b>` | Print a + b |
| `SUBTRACT` | `SUBTRACT <a>,<b>` | Print a âˆ’ b |
| `MULTIPLY` | `MULTIPLY <a>,<b>` | Print a Ã— b |
| `DIVIDE` | `DIVIDE <a>,<b>` | Print a Ã· b (with division-by-zero check) |
| `MOD` / `MODULATION` | `MOD <a>,<b>` | Print a MOD b (integer remainder) |
| `INT DIVIDE` | `INT DIVIDE <a>,<b>` | Print a \ b (integer division) |
| `POWER` | `POWER <a>,<b>` | Print a ^ b |

### Trig & Hyperbolic Functions (SBASIC3 / SBASIC3B)

These commands are only available in `SBASIC3.BAS` and `SBASIC3B.BAS`.

#### Extra Trigonometric Functions

| Command | Syntax | Description |
|---------|--------|-------------|
| `SEC` | `SEC <n>` | Secant: 1/cos(n) |
| `CSC` | `CSC <n>` | Cosecant: 1/sin(n) |
| `COT` | `COT <n>` | Cotangent: cos(n)/sin(n) |
| `DEG` | `DEG <n>` | Convert radians to degrees |
| `RAD` | `RAD <n>` | Convert degrees to radians |

#### Hyperbolic Functions

| Command | Description | Formula |
|---------|-------------|---------|
| `SINH` | Hyperbolic sine | (e^x âˆ’ e^âˆ’x) / 2 |
| `COSH` | Hyperbolic cosine | (e^x + e^âˆ’x) / 2 |
| `TANH` | Hyperbolic tangent | sinh(x)/cosh(x) |

#### Inverse Hyperbolic Functions

| Command | Description |
|---------|-------------|
| `ARCSINH` | Inverse hyperbolic sine |
| `ARCCOSH` | Inverse hyperbolic cosine |
| `ARCTANH` | Inverse hyperbolic tangent |
| `ARCSECH` | Inverse hyperbolic secant |
| `ARCCSCH` | Inverse hyperbolic cosecant |
| `ARCCOTH` | Inverse hyperbolic cotangent |

#### Inverse Trigonometric Functions

| Command | Description |
|---------|-------------|
| `ARCSIN` | Inverse sine |
| `ARCCOS` | Inverse cosine |
| `ARCSEC` | Inverse secant |
| `ARCCSC` | Inverse cosecant |
| `ARCCOT` | Inverse cotangent |

### Temperature Conversions (SBASIC3B only)

`SBASIC3B.BAS` adds conversions between five temperature scales. Syntax: `<FROM>2<TO> <value>`

The five scales are:
- **FAR** â€” Fahrenheit
- **CEL** â€” Celsius
- **KEL** â€” Kelvin
- **REA** â€” RÃ©aumur
- **RAN** â€” Rankine

All 20 pairwise conversions are supported:

| Command | Converts |
|---------|---------|
| `FAR2CEL` | Fahrenheit â†’ Celsius |
| `FAR2KEL` | Fahrenheit â†’ Kelvin |
| `FAR2REA` | Fahrenheit â†’ RÃ©aumur |
| `FAR2RAN` | Fahrenheit â†’ Rankine |
| `CEL2FAR` | Celsius â†’ Fahrenheit |
| `CEL2KEL` | Celsius â†’ Kelvin |
| `CEL2REA` | Celsius â†’ RÃ©aumur |
| `CEL2RAN` | Celsius â†’ Rankine |
| `KEL2FAR` | Kelvin â†’ Fahrenheit |
| `KEL2CEL` | Kelvin â†’ Celsius |
| `KEL2REA` | Kelvin â†’ RÃ©aumur |
| `KEL2RAN` | Kelvin â†’ Rankine |
| `REA2FAR` | RÃ©aumur â†’ Fahrenheit |
| `REA2CEL` | RÃ©aumur â†’ Celsius |
| `REA2KEL` | RÃ©aumur â†’ Kelvin |
| `REA2RAN` | RÃ©aumur â†’ Rankine |
| `RAN2FAR` | Rankine â†’ Fahrenheit |
| `RAN2CEL` | Rankine â†’ Celsius |
| `RAN2KEL` | Rankine â†’ Kelvin |
| `RAN2REA` | Rankine â†’ RÃ©aumur |

**Examples:**
```
FAR2CEL 212        ' prints 100 (boiling point)
CEL2FAR 0          ' prints 32 (freezing point)
KEL2CEL 273.1      ' prints ~0
```

### Dictionary Command (SBASIC.BAS only)

`SBASIC.BAS` and `SBASIC1.BAS` include a large `DICTIONARY` subroutine. When an input line exactly matches an acronym or abbreviation, the interpreter prints its definition instead of reporting a command error.

The dictionary covers hundreds of technical terms including:

- Computer acronyms: `BIOS`, `BASIC`, `ASCII`, `ALU`, `API`, `CPU`, `RAM`, `ROM`, `ANSI`, â€¦
- Programming languages: `ALGOL`, `ADA`, `APL`, `ASSEMBLER`, `ABACUS`, â€¦
- Organizations: `ACM`, `ANSI`, `ABA`, `AISP`, `AAAI`, `ASTM`, `AMTDA`, â€¦
- Military/aerospace: `ABM`, `ATF`, `AMMSS`, `ASP`, `ARPA`, `ARPANET`, â€¦
- Manufacturing/engineering: `ATC`, `AGVS`, `APT-AC`, `ARELEM`, `CAD`, `CAM`, â€¦
- IBM-specific: `ADF`, `AFA`, `AFP`, `ADIH`, `APD`, `APIC/CS`, `APPN`, â€¦

**Example:**
```
BASIC
â†’ BEGINNER'S ALL-PURPOSE SYMBOLIC INSTRUCTION CODE.  A POPULAR, PROBLEM SOLVING, ALGEBRA-LIKE, PROGRAMMING LANGUAGE
```

---

## Error Handling

Later versions (`SBASIC.BAS` through `SBASIC3B.BAS`) include an `ON ERROR GOTO` handler that traps QuickBASIC runtime errors and prints a human-readable message. The error handler is in the `RUNTIME` (or `SBRUNTIME`) subroutine and covers all standard QB error codes:

| Error Code | Message |
|-----------|---------|
| 1 | NEXT without FOR |
| 2 | Syntax error |
| 3 | RETURN without GOSUB |
| 4 | Out of DATA |
| 5 | Illegal function call |
| 6 | Overflow |
| 7 | Out of memory |
| 8 | Label not defined |
| 9 | Subscript out of range |
| 10 | Duplicate definition |
| 11 | Division by zero |
| 12 | Illegal in direct mode |
| 13 | Type mismatch |
| 14 | Out of string space |
| 16 | String formula too complex |
| 18 | Function not defined |
| 19 | No RESUME |
| 20 | RESUME without error |
| 24 | Device timeout |
| 25 | Device fault |
| 26 | FOR without NEXT |
| 27 | Out of paper |
| 29 | WHILE without WEND |
| 30 | WEND without WHILE |
| 33 | Duplicate label |
| 35 | Subprogram NOT defined |
| 37 | Argument-count mismatch |
| 38 | Array not defined |
| 40 | Variable required |
| 50 | FIELD overflow |
| 51 | Internal error |
| 52 | Bad file name or number |
| 53 | File not found |
| 54 | Bad file mode |
| 55 | File already open |
| 56 | FIELD statement active |
| 57 | Device I/O error |
| 58 | File already exists |
| 59 | Bad record length |
| 61 | Disk full |
| 62 | Input past end of file |
| 63 | Bad record number |
| 64 | Bad file name |
| 67 | Too many files |
| 68 | Device unavailable |
| 69 | Communication-buffer overflow |
| 70 | Permission denied |
| 71 | Disk not ready |
| 72 | Disk-media error |
| 73 | Feature unavailable |
| 74 | Rename across disks |
| 75 | Path/File access error |
| 76 | Path NOT found |

---

## Source Files

Each `.BAS` file is reproduced in full below. All files are standalone â€” no inter-file dependencies.

---

### SBA.BAS (source)

<details>
<summary>Click to expand full source (~1,078 lines)</summary>

```basic
DECLARE SUB EXPAND ()
DECLARE SUB USER ()
DECLARE SUB LAD ()
DECLARE SUB SCREN ()
DECLARE SUB SVE ()
DECLARE SUB BOX ()
DECLARE SUB NW ()
DECLARE SUB PNT ()
DECLARE SUB PRST ()
DECLARE SUB PST ()
DECLARE SUB OT ()
DECLARE SUB SND ()
DECLARE SUB WDTH ()
DECLARE SUB PKE ()
DECLARE SUB PRNT ()
DECLARE SUB RDOMIZE ()
DECLARE SUB PEK ()
DECLARE SUB PLY ()
DECLARE SUB LNE ()
DECLARE SUB KY ()
DECLARE SUB INPT ()
DECLARE SUB FLS ()
DECLARE SUB GTO ()
DECLARE SUB DRW ()
DECLARE SUB CLOR ()
DECLARE SUB CRCLE ()
DECLARE SUB BACKGROUND ()
DECLARE SUB LST ()
DECLARE SUB RN ()
DECLARE SUB ATO ()
DECLARE SUB ASLEEP ()
DECLARE SUB ALLOW ()
DECLARE SUB ALARM ()
DECLARE SUB ALERT ()
DECLARE SUB ABOLUTE ()
DECLARE SUB ACKNOWLEDGE ()
DECLARE SUB ADD ()
DECLARE SUB ADVANCE ()
DECLARE SUB VRBLES (E$)
DECLARE SUB READY ()
DECLARE SUB COMMANDS ()
COMMON SHARED A$, SCREENMODE, ACTIVEPAGE, COLORSWITCH, VISUALPAGE, CURRENTCOLOR, STARTUPTIME$, STARTUPDATE$, MEM, ENTER$, SPCE$, TAB$, BACKSPACE$, ESC$, VARIBLE, VARIBLE$, Z.CHR, A$()
DIM VARIBLE(255), VARIBLE$(255), Z.CHR(8), A$(200)
CLS
SCREEN 0, 0, 0, 0
SCREENMODE = 0
ACTIVEPAGE = 0
COLORSWITCH = 0
VISUALPAGE = 0
COLOR 15
CURRENTCOLOR = 15
STARTUPTIME$ = TIME$
STARTUPDATE$ = DATE$
PRINT "Advanced Super Basic Version 1.00"
PRINT "Super Basic Version 5.00"
PRINT "BASICB Version 7.00"
PRINT LTRIM$(STR$(FRE(0))); " bytes free of main memory."
MEM = FRE(0)
IF MEM <= 10000 THEN
COLOR 20
PRINT "Possible Memory Error.Advanced Super Basic Needs More Than 10k."
CURRENTCOLOR = 20
END IF
PRINT "Current Screen Mode is Set to Screen Mode "; LTRIM$(STR$(SCREENMODE)); "."
PRINT "Current Time is "; TIME$
PRINT "Current Date is "; DATE$
ENTER$ = CHR$(13)
ESC$ = CHR$(27)
BACKSPACE$ = CHR$(8)
SPCE$ = CHR$(32)
TAB$ = CHR$(9)
1 READY
GOTO 1

SUB ABOLUTE
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
VRBLES E$
E = VAL(E$)
PRINT ABS(E)
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
VRBLES Q$
Q = E
W$ = MID$(A$, B + 1, LEN(A$))
VRBLES W$
W = E
PRINT Q + W
END SUB

SUB ADVANCE
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
VRBLES E$
FOR J = 1 TO E
PRINT
NEXT J
END SUB

SUB ALARM
A = INSTR(A$, " ")
B = INSTR(A$, ",")
FREQ$ = MID$(A$, A + 1, B - 1)
VRBLES FREQ$
FREQ = E
DUR$ = MID$(A$, B + 1, LEN(A$))
VRBLES DUR$
DUR = E
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
VRBLES D$
IF B = 0 THEN
ELSE
END IF
END SUB

SUB ASLEEP
A = INSTR(A$, " ")
E = VAL(MID$(A$, A + 1, LEN(A$)))
SLEEP E
END SUB

SUB ATO
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
END SELECT
GOTO 83
END IF
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
END SELECT
83 END SUB

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
GOTO 143
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
143 END SUB

SUB CLOR
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
END SELECT
GOTO 93
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
END SELECT
END IF
93 END SUB

SUB COMMANDS
IF LEFT$(A$, 8) = "ABSOLUTE" THEN
ABOLUTE
GOTO 3
END IF
IF LEFT$(A$, 11) = "ACKNOWLEDGE" THEN
ACKNOWLEDGE
GOTO 3
END IF
IF LEFT$(A$, 3) = "ADD" THEN
ADD
GOTO 3
END IF
IF LEFT$(A$, 7) = "ADVANCE" THEN
ADVANCE
GOTO 3
END IF
IF LEFT$(A$, 5) = "ALARM" THEN
ALARM
GOTO 3
END IF
IF LEFT$(A$, 5) = "ALERT" THEN
ALERT
GOTO 3
END IF
IF LEFT$(A$, 5) = "ALLOW" THEN
ALLOW
GOTO 3
END IF
IF LEFT$(A$, 6) = "ASLEEP" THEN
ASLEEP
GOTO 3
END IF
IF LEFT$(A$, 4) = "AUTO" THEN
ATO
GOTO 3
END IF
IF LEFT$(A$, 3) = "RUN" THEN
RN
GOTO 3
END IF
IF LEFT$(A$, 4) = "LIST" THEN
LST
GOTO 3
END IF
IF LEFT$(A$, 10) = "BACKGROUND" THEN
BACKGROUND
GOTO 3
END IF
IF LEFT$(A$, 5) = "CLOSE" THEN
CLOSE
GOTO 3
END IF
IF LEFT$(A$, 3) = "CLS" THEN
CLS
GOTO 3
END IF
IF LEFT$(A$, 4) = "BEEP" THEN
BEEP
GOTO 3
END IF
IF LEFT$(A$, 6) = "CIRCLE" THEN
CRCLE
GOTO 3
END IF
IF LEFT$(A$, 5) = "COLOR" THEN
CLOR
GOTO 3
END IF
IF LEFT$(A$, 4) = "DATE" THEN
PRINT DATE$
GOTO 3
END IF
IF LEFT$(A$, 5) = "DATE$" THEN
PRINT DATE$
GOTO 3
END IF
IF LEFT$(A$, 4) = "DRAW" THEN
DRW
GOTO 3
END IF
IF LEFT$(A$, 5) = "FILES" THEN
FLS
GOTO 3
END IF
IF LEFT$(A$, 3) = "DIR" THEN
FLS
GOTO 3
END IF
IF LEFT$(A$, 9) = "DIRECTORY" THEN
FLS
GOTO 3
END IF
IF LEFT$(A$, 3) = "MEM" THEN
PRINT FRE(0)
GOTO 3
END IF
IF LEFT$(A$, 6) = "MEMORY" THEN
PRINT FRE(0)
GOTO 3
END IF
IF LEFT$(A$, 4) = "GOTO" THEN
GTO
GOTO 3
END IF
IF LEFT$(A$, 5) = "INPUT" THEN
INPT
GOTO 3
END IF
IF LEFT$(A$, 3) = "KEY" THEN
KY
GOTO 3
END IF
IF LEFT$(A$, 4) = "LINE" THEN
LNE
GOTO 3
END IF
IF LEFT$(A$, 4) = "PEEK" THEN
PEK
GOTO 3
END IF
IF LEFT$(A$, 4) = "PLAY" THEN
PLY
GOTO 3
END IF
IF LEFT$(A$, 4) = "POKE" THEN
PKE
GOTO 3
END IF
IF LEFT$(A$, 5) = "PRINT" THEN
PRNT
GOTO 3
END IF
IF LEFT$(A$, 1) = "?" THEN
PRNT
GOTO 3
END IF
IF LEFT$(A$, 9) = "RANDOMIZE" THEN
RDOMIZE
GOTO 3
END IF
IF LEFT$(A$, 3) = "REM" THEN
GOTO 3
END IF
IF LEFT$(A$, 1) = "'" THEN
GOTO 3
END IF
IF LEFT$(A$, 5) = "RESET" THEN
RESET
GOTO 3
END IF
IF LEFT$(A$, 5) = "SOUND" THEN
SND
GOTO 3
END IF
IF LEFT$(A$, 6) = "SYSTEM" THEN
SYSTEM
GOTO 3
END IF
IF LEFT$(A$, 5) = "WIDTH" THEN
WDTH
GOTO 3
END IF
IF LEFT$(A$, 5) = "WRITE" THEN
PRNT
GOTO 3
END IF
IF LEFT$(A$, 5) = "TIME$" THEN
PRINT TIME$
GOTO 3
END IF
IF LEFT$(A$, 4) = "TIME" THEN
PRINT TIME$
GOTO 3
END IF
IF LEFT$(A$, 3) = "OUT" THEN
OT
GOTO 3
END IF
IF LEFT$(A$, 5) = "PAINT" THEN
PNT
GOTO 3
END IF
IF LEFT$(A$, 6) = "PRESET" THEN
PRST
GOTO 3
END IF
IF LEFT$(A$, 4) = "PSET" THEN
PST
GOTO 3
END IF
IF LEFT$(A$, 3) = "BOX" THEN
BOX
GOTO 3
END IF
IF LEFT$(A$, 3) = "NEW" THEN
NW
GOTO 3
END IF
IF LEFT$(A$, 4) = "SAVE" THEN
SVE
GOTO 3
END IF
IF LEFT$(A$, 6) = "SCREEN" THEN
SCREN
GOTO 3
END IF
IF LEFT$(A$, 4) = "LOAD" THEN
LAD
GOTO 3
END IF
IF LEFT$(A$, 4) = "USER" THEN
USER
GOTO 3
END IF
IF LEFT$(A$, 2) = "PI" THEN
PRINT USING "#.###############"; 3 + (1 / 7)
GOTO 3
END IF
IF LEFT$(A$, 6) = "EXPAND" THEN
EXPAND
GOTO 3
END IF
17000 SHELL A$: GOTO 3
80000 SHELL A$: GOTO 3
3 END SUB

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

SUB DRW
A = INSTR(A$, CHR$(34))
B$ = MID$(A$, A, LEN(A$))
DRAW "X" + VARPTR$(B$)
END SUB

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
NEXT Z.I
FOR Z.Y = 0 TO 7
FOR Z.J = 1 TO YSC
FOR Z.X = 0 TO 7
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

SUB INPT
A = INSTR(A$, " ")
B$ = MID$(A$, A, LEN(A$))
B = ASC(B$) - 65 + 33
IF INSTR(A$, "$") = 0 THEN
ELSE
END IF
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
GOTO 103
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
103 END SUB

SUB LST
FOR PL = 1 TO LN
PRINT LTRIM$(STR$(PL * 10)); " "; A$(PL)
NEXT PL
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

SUB PKE
A = INSTR(A$, " ")
B = INSTR(A$, ",")
LCN = VAL(MID$(A$, A + 1, B - 1))
V = VAL(MID$(A$, B + 1, LEN(A$)))
POKE LCN, V
END SUB

SUB PLY
A = INSTR(A$, CHR$(34))
B$ = MID$(A$, A + 1, LEN(A$) - 1)
IF B$ = "" THEN
PRINT "Missing Operand Error"
GOTO 113
END IF
PLAY "X" + VARPTR$(B$)
113 END SUB

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

SUB PRNT
X$ = CHR$(34)
540 A = INSTR(A$, X$): IF A = 0 THEN 670
B = INSTR(A + 1, A$, X$): IF B = 0 THEN ZX = -1
IF LEN(A$) = 5 OR LEN(A$) = 6 THEN PRINT : GOTO 123
IF ZX = 0 THEN E$ = MID$(A$, A + 1, B)
IF ZX = -1 THEN E$ = MID$(A$, A + 1, LEN(A$))
A1 = INSTR(A$, ";"): IF A1 = 0 THEN 600 ELSE 630
600 B1 = INSTR(A$, ","): IF B1 = 0 THEN 610 ELSE 650
610 PRINT E$
GOTO 123
630 PRINT E$;
GOTO 123
650 PRINT E$,
GOTO 123
670 IF A$ = "PRINT" THEN PRINT : GOTO 123
IF A$ = "?" THEN PRINT : GOTO 123
A = INSTR(A$, "ABS"): IF A = 0 THEN 730
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
PRINT ABS(E): GOTO 123
730 A = INSTR(A$, "ASC"): IF A = 0 THEN 770
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1)
PRINT ASC(E$): GOTO 123
770 A = INSTR(A$, "ATN"): IF A = 0 THEN 810
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
PRINT ATN(E): GOTO 123
810 A = INSTR(A$, "CDBL"): IF A = 0 THEN 850
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
PRINT CDBL(E): GOTO 123
850 A = INSTR(A$, "CHR$"): IF A = 0 THEN 890
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
PRINT CHR$(E): GOTO 123
890 A = INSTR(A$, "CINT"): IF A = 0 THEN 930
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
PRINT CINT(E): GOTO 123
930 A = INSTR(A$, "COS"): IF A = 0 THEN 970
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
PRINT COS(E): GOTO 123
970 A = INSTR(A$, "CSNG"): IF A = 0 THEN 1010
B = INSTR(A$, "("): C = INSTR(A$, ")")
E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT CSNG(E): GOTO 123
1010 A = INSTR(A$, "EXP"): IF A = 0 THEN 1050
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT EXP(E): GOTO 123
1050 A = INSTR(A$, "FIX"): IF A = 0 THEN 1090
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT FIX(E): GOTO 123
1090 A = INSTR(A$, "FRE"): IF A = 0 THEN 1130
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT FRE(E): GOTO 123
1130 A = INSTR(A$, "HEX$"): IF A = 0 THEN 1170
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT HEX$(E): GOTO 123
1170 A = INSTR(A$, "INP"): IF A = 0 THEN 1210
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT INP(E): GOTO 123
1210 A = INSTR(A$, " INT"): IF A = 0 THEN 1250
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT INT(E): GOTO 123
1250 A = INSTR(A$, "LEN"): IF A = 0 THEN 1290
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1)
 PRINT LEN(E$): GOTO 123
1290 A = INSTR(A$, "LOG"): IF A = 0 THEN 1330
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT LOG(E): GOTO 123
1330 A = INSTR(A$, "OCT$"): IF A = 0 THEN 1370
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT OCT$(E): GOTO 123
1370 A = INSTR(A$, "PEEK"): IF A = 0 THEN 1410
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT PEEK(E): GOTO 123
1410 A = INSTR(A$, "PEN"): IF A = 0 THEN 1450
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT PEN(E): GOTO 123
1450 A = INSTR(A$, "PLAY"): IF A = 0 THEN 1490
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT PLAY(E): GOTO 123
1490 A = INSTR(A$, "POINT"): IF A = 0 THEN 1530
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT POINT(E): GOTO 123
1530 A = INSTR(A$, "POS"): IF A = 0 THEN 1570
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT POS(E): GOTO 123
1570 A = INSTR(A$, "RND"): IF A = 0 THEN 1610
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT RND(E): GOTO 123
1610 A = INSTR(A$, "SGN"): IF A = 0 THEN 1650
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT SGN(E): GOTO 123
1650 A = INSTR(A$, "SIN"): IF A = 0 THEN 1690
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT SIN(E): GOTO 123
1690 A = INSTR(A$, "SPACE$"): IF A = 0 THEN 1730
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT SPACE$(E): GOTO 123
1730 A = INSTR(A$, "SPC"): IF A = 0 THEN 1770
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT SPC(E); : GOTO 123
1770 A = INSTR(A$, "SQR"): IF A = 0 THEN 1810
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT SQR(E): GOTO 123
1810 A = INSTR(A$, "STICK"): IF A = 0 THEN 1850
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT STICK(E): GOTO 123
1850 A = INSTR(A$, "STR$"): IF A = 0 THEN 1890
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT STR$(E): GOTO 123
1890 A = INSTR(A$, "STRIG"): IF A = 0 THEN 1930
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT STRIG(E): GOTO 123
1930 A = INSTR(A$, "TAB"): IF A = 0 THEN 1970
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT TAB(E); : GOTO 123
1970 A = INSTR(A$, "TAN"): IF A = 0 THEN 2010
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1): E = VAL(E$)
 PRINT TAN(E): GOTO 123
2010 A = INSTR(A$, "VAL"): IF A = 0 THEN 2050
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1)
 PRINT VAL(E$): GOTO 123
2050 A = INSTR(A$, "VARPTR$"): IF A = 0 THEN 2060
 B = INSTR(A$, "("): C = INSTR(A$, ")")
 E$ = MID$(A$, B + 1, C - 1)
 PRINT VARPTR$(E$): GOTO 123
2060 PRINT "COMMAND NOT FOUND ERROR": GOTO 123
123 END SUB

SUB PRST
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

SUB RDOMIZE
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
IF E$ = "TIMER" THEN
RANDOMIZE TIMER
GOTO 133
END IF
E = VAL(E$)
RANDOMIZE E
133 END SUB

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

SUB SCREN
A = INSTR(A$, " ")
IF A = 0 THEN
PRINT MODE
GOTO 153
ELSE
E = VAL(MID$(A$, A, LEN(A$)))
SCREEN E
MODE = E
GOTO 153
END IF
153 END SUB

SUB SND
A = INSTR(A$, " ")
B = INSTR(A$, ",")
E$ = MID$(A$, A + 1, B - 1)
FREQ = VAL(E$)
E$ = MID$(A$, B + 1, LEN(A$))
DUR = VAL(E$)
SOUND FREQ, DUR
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

SUB USER
A = INSTR(A$, " ")
E$ = MID$(A$, A + 1, LEN(A$))
USR$ = E$
END SUB

SUB VRBLES (E$)
SELECT CASE E$
CASE "A" TO "Z"
        G = INSTR(E$, "$")
        IF G = 0 THEN
                GOTO 1540
        ELSE
                GOTO 1540
        END IF
        CASE ELSE
        IF CMD <> -1 THEN
                E = VAL(E$)
                GOTO 1540
        ELSE
                E$ = LTRIM$(E$)
                GOTO 1540
        END IF
END SELECT
1540 END SUB

SUB WDTH
A = INSTR(A$, " ")
E = VAL(MID$(A$, A + 1, LEN(A$)))
WIDTH E
END SUB

```
</details>

---

### SBASIC.BAS (source)

<details>
<summary>Click to expand full source (~2,697 lines)</summary>

```basic
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

```
</details>

---

### SBASIC1.BAS (source)

<details>
<summary>Click to expand full source (~4,992 lines)</summary>

```basic
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

```
</details>

---

### SBASIC2.BAS (source)

<details>
<summary>Click to expand full source (~2,422 lines)</summary>

```basic
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

```
</details>

---

### SBASIC3.BAS (source)

<details>
<summary>Click to expand full source (~1,029 lines)</summary>

```basic
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

```
</details>

---

### SBASIC3B.BAS (source)

<details>
<summary>Click to expand full source (~3,464 lines)</summary>

```basic
DECLARE SUB SbCel2Far ()
DECLARE SUB SbCel2Rea ()
DECLARE SUB SbFar2Cel ()
DECLARE SUB SbFar2Kel ()
DECLARE SUB SbFar2Ran ()
DECLARE SUB SbFar2Rea ()
DECLARE SUB SbCel2Kel ()
DECLARE SUB SbCel2Ran ()
DECLARE SUB SbRea2Far ()
DECLARE SUB SbRea2Cel ()
DECLARE SUB SbRea2Kel ()
DECLARE SUB SbRea2Ran ()
DECLARE SUB SbKel2Far ()
DECLARE SUB SbKel2Cel ()
DECLARE SUB SbKel2Rea ()
DECLARE SUB SbKel2Ran ()
DECLARE SUB SbRan2Far ()
DECLARE SUB SbRan2Cel ()
DECLARE SUB SbRan2Rea ()
DECLARE SUB SbRan2Kel ()
DECLARE FUNCTION Kel2Cel! (E!)
DECLARE FUNCTION Ran2Cel! (E!)
DECLARE FUNCTION Ran2Far! (E!)
DECLARE FUNCTION Kel2Far! (E!)
DECLARE FUNCTION Rea2Kel! (E!)
DECLARE FUNCTION Ran2Kel! (E!)
DECLARE FUNCTION Kel2Ran! (E!)
DECLARE FUNCTION Rea2Ran! (E!)
DECLARE FUNCTION Kel2Rea! (E!)
DECLARE FUNCTION Ran2Rea! (E!)
DECLARE FUNCTION Cel2Kel! (E!)
DECLARE FUNCTION Cel2Ran! (E!)
DECLARE FUNCTION Rea2Far! (E!)
DECLARE FUNCTION Rea2Cel! (E!)
DECLARE SUB Runtime ()
DECLARE SUB Expand (A$)
DECLARE SUB SbAsc (A$)
DECLARE SUB SbChr ()
DECLARE SUB SbFre ()
DECLARE SUB SbHex ()
DECLARE SUB SbInp ()
DECLARE SUB SbLen ()
DECLARE SUB SbOct ()
DECLARE SUB SbPeek ()
DECLARE SUB SbPen ()
DECLARE SUB SbPlay ()
DECLARE SUB SbPoint ()
DECLARE SUB SbPos ()
DECLARE SUB SbSpace ()
DECLARE SUB SbSpc ()
DECLARE SUB SbStick ()
DECLARE SUB SbStr ()
DECLARE SUB SbStrig ()
DECLARE SUB SbTab ()
DECLARE SUB SbVal ()
DECLARE SUB SbVarptr ()
DECLARE SUB SbAdd ()
DECLARE SUB SbSubtract ()
DECLARE SUB SbMultiply ()
DECLARE SUB SbDivide ()
DECLARE SUB SbMod ()
DECLARE SUB SbIntDivide ()
DECLARE SUB SbPower ()
DECLARE SUB SbAllow ()
DECLARE SUB SbPrint ()
DECLARE SUB SbAcknowledge ()
DECLARE SUB SbAdvance ()
DECLARE SUB SbBlink ()
DECLARE SUB SbAlert ()
DECLARE SUB SbAuto ()
DECLARE SUB SbRun ()
DECLARE SUB SbList ()
DECLARE SUB SbBackground ()
DECLARE SUB SbBeep ()
DECLARE SUB SbCircle ()
DECLARE SUB SbColor ()
DECLARE SUB SbDraw ()
DECLARE SUB SbFiles ()
DECLARE SUB SbGoto ()
DECLARE SUB SbInput ()
DECLARE SUB SbKey ()
DECLARE SUB SbLine ()
DECLARE SUB SbPlay2 ()
DECLARE SUB SbPoke ()
DECLARE SUB SbSound ()
DECLARE SUB SbWidth ()
DECLARE SUB SbOut ()
DECLARE SUB SbPaint ()
DECLARE SUB SbPreset ()
DECLARE SUB SbPset ()
DECLARE SUB SbBox ()
DECLARE SUB SbNew ()
DECLARE SUB SbSave ()
DECLARE SUB SbScreen ()
DECLARE SUB SbLoad ()
DECLARE SUB SbWait ()
DECLARE SUB SbIncrease ()
DECLARE SUB SbDecrease ()
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
COMMON SHARED A$, Z.CHR(), VAR(), VAR$(), A$(), LN
CLEAR , , 15000
ON ERROR GOTO C:
DIM VAR(255), VAR$(255), A$(255), Z.CHR(8), STATUS$, MODE
CLS
LCN = 2
Intro
C:
Runtime
RESUME NEXT

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

FUNCTION Cel2Kel (E)
T1 = 32 + E * 1.8
Cel2Kel = 5 * (T1 - 32) / 9 + 273.1
END FUNCTION

FUNCTION Cel2Ran (E)
T1 = 32 + E * 1.8
Cel2Ran = T1 + 459.58
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
IF LEFT$(A$, 6) = "EXPAND" THEN
        Expand (A$)
GOTO B:
END IF
IF LEFT$(A$, 3) = "CLS" THEN
        CLS
GOTO B:
END IF
IF LEFT$(A$, 3) = "ASC" THEN
        SbAsc (A$)
GOTO B:
END IF
IF LEFT$(A$, 4) = "CHR$" THEN
        SbChr
GOTO B:
END IF
IF LEFT$(A$, 3) = "FRE" THEN
        SbFre
GOTO B:
END IF
IF LEFT$(A$, 4) = "HEX$" THEN
        SbHex
GOTO B:
END IF
IF LEFT$(A$, 3) = "INP" THEN
        SbInp
GOTO B:
END IF
IF LEFT$(A$, 3) = "LEN" THEN
        SbLen
GOTO B:
END IF
IF LEFT$(A$, 4) = "OCT$" THEN
        SbOct
GOTO B:
END IF
IF LEFT$(A$, 4) = "PEEK" THEN
        SbPeek
GOTO B:
END IF
IF LEFT$(A$, 3) = "PEN" THEN
        SbPen
GOTO B:
END IF
IF LEFT$(A$, 4) = "PLAY" THEN
        SbPlay
GOTO B:
END IF
IF LEFT$(A$, 5) = "POINT" THEN
        SbPoint
GOTO B:
END IF
IF LEFT$(A$, 3) = "POS" THEN
        SbPos
GOTO B:
END IF
IF LEFT$(A$, 6) = "SPACE$" THEN
        SbSpace
GOTO B:
END IF
IF LEFT$(A$, 3) = "SPC" THEN
        SbSpc
GOTO B:
END IF
IF LEFT$(A$, 5) = "STICK" THEN
        SbStick
GOTO B:
END IF
IF LEFT$(A$, 4) = "STR$" THEN
        SbStr
GOTO B:
END IF
IF LEFT$(A$, 5) = "STRIG" THEN
        SbStrig
GOTO B:
END IF
IF LEFT$(A$, 3) = "TAB" THEN
        SbTab
GOTO B:
END IF
IF LEFT$(A$, 3) = "VAL" THEN
        SbVal
GOTO B:
END IF
IF LEFT$(A$, 7) = "VARPTR$" THEN
        SbVarptr
GOTO B:
END IF
IF LEFT$(A$, 3) = "ADD" THEN
        SbAdd
GOTO B:
END IF
IF LEFT$(A$, 8) = "SUBTRACT" THEN
        SbSubtract
GOTO B:
END IF
IF LEFT$(A$, 8) = "MULTIPLY" THEN
        SbMultiply
GOTO B:
END IF
IF LEFT$(A$, 6) = "DIVIDE" THEN
        SbDivide
GOTO B:
END IF
IF LEFT$(A$, 3) = "MOD" THEN
        SbMod
GOTO B:
END IF
IF LEFT$(A$, 10) = "INT DIVIDE" THEN
        SbIntDivide
GOTO B:
END IF
IF LEFT$(A$, 5) = "POWER" THEN
        SbPower
GOTO B:
END IF
IF LEFT$(A$, 5) = "ALLOW" THEN
        SbAllow
GOTO B:
END IF
IF LEFT$(A$, 5) = "PRINT" THEN
        SbPrint
GOTO B:
END IF
IF LEFT$(A$, 5) = "TIMER" THEN
        PRINT TIMER
GOTO B:
END IF
IF LEFT$(A$, 11) = "ACKNOWLEDGE" THEN
        SbAcknowledge
GOTO B:
END IF
IF LEFT$(A$, 7) = "ADVANCE" THEN
        SbAdvance
GOTO B:
END IF
IF LEFT$(A$, 4) = "BELL" THEN
        BEEP
GOTO B:
END IF
IF LEFT$(A$, 5) = "BLANK" THEN
        CLS
GOTO B:
END IF
IF LEFT$(A$, 5) = "BLINK" THEN
        SbBlink
GOTO B:
END IF
IF LEFT$(A$, 5) = "ALERT" THEN
        SbAlert
GOTO B:
END IF
IF LEFT$(A$, 4) = "AUTO" THEN
        SbAuto
GOTO B:
END IF
IF LEFT$(A$, 3) = "RUN" THEN
        SbRun
GOTO B:
END IF
IF LEFT$(A$, 4) = "LIST" THEN
        SbList
GOTO B:
END IF
IF LEFT$(A$, 10) = "BACKGROUND" THEN
        SbBackground
GOTO B:
END IF
IF LEFT$(A$, 5) = "CLOSE" THEN
        CLOSE
GOTO B:
END IF
IF LEFT$(A$, 3) = "CLS" THEN
        CLS
GOTO B:
END IF
IF LEFT$(A$, 4) = "BEEP" THEN
        SbBeep
GOTO B:
END IF
IF LEFT$(A$, 6) = "CIRCLE" THEN
        SbCircle
GOTO B:
END IF
IF LEFT$(A$, 5) = "COLOR" THEN
        SbColor
GOTO B:
END IF
IF LEFT$(A$, 4) = "DATE" THEN
        PRINT DATE$
GOTO B:
END IF
IF LEFT$(A$, 5) = "DATE$" THEN
        PRINT DATE$
GOTO B:
END IF
IF LEFT$(A$, 4) = "DRAW" THEN
        SbDraw
GOTO B:
END IF
IF LEFT$(A$, 5) = "FILES" THEN
        SbFiles
GOTO B:
END IF
IF LEFT$(A$, 3) = "DIR" THEN
        SHELL A$
GOTO B:
END IF
IF LEFT$(A$, 9) = "DIRECTORY" THEN
        SHELL "DIR"
GOTO B:
END IF
IF LEFT$(A$, 3) = "MEM" THEN
        PRINT FRE(0)
GOTO B:
END IF
IF LEFT$(A$, 6) = "MEMORY" THEN
        PRINT FRE(0)
GOTO B:
END IF
IF LEFT$(A$, 4) = "GOTO" THEN
        SbGoto
GOTO B:
END IF
IF LEFT$(A$, 5) = "INPUT" THEN
        SbInput
GOTO B:
END IF
IF LEFT$(A$, 3) = "KEY" THEN
        SbKey
GOTO B:
END IF
IF LEFT$(A$, 4) = "LINE" THEN
        SbLine
GOTO B:
END IF
IF LEFT$(A$, 5) = "PLAY " THEN
        SbPlay2
GOTO B:
END IF
IF LEFT$(A$, 4) = "POKE" THEN
        SbPoke
GOTO B:
END IF
IF LEFT$(A$, 9) = "RANDOMIZE" THEN
        RANDOMIZE
GOTO B:
END IF
IF LEFT$(A$, 3) = "REM" THEN
GOTO B:
END IF
IF LEFT$(A$, 1) = "'" THEN
GOTO B:
END IF
IF LEFT$(A$, 5) = "RESET" THEN
        RESET
GOTO B:
END IF
IF LEFT$(A$, 5) = "SOUND" THEN
        SbSound
GOTO B:
END IF
IF LEFT$(A$, 6) = "SYSTEM" THEN
        SYSTEM
GOTO B:
END IF
IF LEFT$(A$, 5) = "WIDTH" THEN
        SbWidth
GOTO B:
END IF
IF LEFT$(A$, 5) = "TIME$" THEN
        PRINT TIME$
GOTO B:
END IF
IF LEFT$(A$, 4) = "TIME" THEN
        PRINT TIME$
GOTO B:
END IF
IF LEFT$(A$, 3) = "OUT" THEN
        SbOut
GOTO B:
END IF
IF LEFT$(A$, 5) = "PAINT" THEN
        SbPaint
GOTO B:
END IF
IF LEFT$(A$, 6) = "PRESET" THEN
        SbPreset
GOTO B:
END IF
IF LEFT$(A$, 4) = "PSET" THEN
        SbPset
GOTO B:
END IF
IF LEFT$(A$, 3) = "BOX" THEN
        SbBox
GOTO B:
END IF
IF LEFT$(A$, 3) = "NEW" THEN
        SbNew
GOTO B:
END IF
IF LEFT$(A$, 4) = "SAVE" THEN
        SbSave
GOTO B:
END IF
IF LEFT$(A$, 6) = "SCREEN" THEN
        SbScreen
GOTO B:
END IF
IF LEFT$(A$, 4) = "LOAD" THEN
        SbLoad
GOTO B:
END IF
IF LEFT$(A$, 4) = "WAIT" THEN
        SbWait
GOTO B:
END IF
IF LEFT$(A$, 8) = "INCREASE" THEN
        SbIncrease
GOTO B:
END IF
IF LEFT$(A$, 8) = "DECREASE" THEN
        SbDecrease
GOTO B:
END IF
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
IF LEFT$(A$, 7) = "FAR2CEL" THEN
        SbFar2Cel
GOTO B:
END IF
IF LEFT$(A$, 7) = "FAR2KEL" THEN
        SbFar2Kel
GOTO B:
END IF
IF LEFT$(A$, 7) = "FAR2REA" THEN
        SbFar2Rea
GOTO B:
END IF
IF LEFT$(A$, 7) = "FAR2RAN" THEN
        SbFar2Ran
GOTO B:
END IF
IF LEFT$(A$, 7) = "CEL2FAR" THEN
        SbCel2Far
GOTO B:
END IF
IF LEFT$(A$, 7) = "CEL2KEL" THEN
        SbCel2Kel
GOTO B:
END IF
IF LEFT$(A$, 7) = "CEL2REA" THEN
        SbCel2Rea
GOTO B:
END IF
IF LEFT$(A$, 7) = "CEL2RAN" THEN
        SbCel2Ran
GOTO B:
END IF
IF LEFT$(A$, 7) = "KEL2FAR" THEN
        SbKel2Far
GOTO B:
END IF
IF LEFT$(A$, 7) = "KEL2CEL" THEN
        SbKel2Cel
GOTO B:
END IF
IF LEFT$(A$, 7) = "KEL2REA" THEN
        SbKel2Rea
GOTO B:
END IF
IF LEFT$(A$, 7) = "KEL2RAN" THEN
        SbKel2Ran
GOTO B:
END IF
IF LEFT$(A$, 7) = "REA2FAR" THEN
        SbRea2Far
GOTO B:
END IF
IF LEFT$(A$, 7) = "REA2CEL" THEN
        SbRea2Cel
GOTO B:
END IF
IF LEFT$(A$, 7) = "REA2RAN" THEN
        SbRea2Ran
GOTO B:
END IF
IF LEFT$(A$, 7) = "REA2KEL" THEN
        SbRea2Kel
GOTO B:
END IF
IF LEFT$(A$, 7) = "RAN2FAR" THEN
        SbRan2Far
GOTO B:
END IF
IF LEFT$(A$, 7) = "RAN2CEL" THEN
        SbRan2Cel
GOTO B:
END IF
IF LEFT$(A$, 7) = "RAN2REA" THEN
        SbRan2Rea
GOTO B:
END IF
IF LEFT$(A$, 7) = "RAN2KEL" THEN
        SbRan2Kel
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

SUB Expand (A$)
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
Box 2, 1, 24, 78
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
Box 2, 1, 24, 78
VIEW PRINT 3 TO 23
A:
Ready
GOTO A:
END SUB

FUNCTION Kel2Cel (E)
T1 = 32 + 1.8 * (E - 273.1)
Kel2Cel = 5 * (T1 - 32) / 9
END FUNCTION

FUNCTION Kel2Far (E)
T1 = 32 + 1.8 * (E - 273.1)
Kel2Far = T1
END FUNCTION

FUNCTION Kel2Ran (E)
T1 = 32 + 1.8 * (E - 273.1)
Kel2Ran = T1 + 459.58
END FUNCTION

FUNCTION Kel2Rea (E)
T1 = 32 + 1.8 * (E - 273.1)
Kel2Rea = 4 * (T1 - 32) / 9
END FUNCTION

'SUPER BASIC RAD FUNCTION VERSION 1.00
FUNCTION Rad (E)
Rad = E * 3.141593 / 180
END FUNCTION

FUNCTION Ran2Cel (E)
T1 = E - 459.58
Ran2Cel = 5 * (T1 - 32) / 9
END FUNCTION

FUNCTION Ran2Far (E)
T1 = E - 459.58
Ran2Far = T1
END FUNCTION

FUNCTION Ran2Kel (E)
T1 = E - 459.58
Ran2Kel = 5 * (T1 - 32) / 9 + 273.1
END FUNCTION

FUNCTION Ran2Rea (E)
T1 = E - 459.58
Ran2Rea = 4 * (T1 - 32) / 9
END FUNCTION

FUNCTION Rea2Cel (E)
T1 = 32 + E * 2.25
Rea2Cel = 5 * (T1 - 32) / 9
END FUNCTION

FUNCTION Rea2Far (E)
T1 = 32 + E * 2.25
Rea2Far = T1
END FUNCTION

FUNCTION Rea2Kel (E)
T1 = 32 + E * 2.25
Rea2Kel = 5 * (T1 - 32) / 9 + 273.1
END FUNCTION

FUNCTION Rea2Ran (E)
T1 = 32 + E * 2.25
Rea2Ran = T1 + 459.58
END FUNCTION

SUB Ready
LOCATE , 1
PRINT "³";
LOCATE , 78
PRINT "³";
LOCATE , 2
LINE INPUT A$
Commands (A$)
END SUB

SUB Runtime
IF ERR = 1 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "NEXT without FOR."
END IF
IF ERR = 37 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Argument-count mismatch."
END IF
IF ERR = 2 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Syntax error."
END IF
IF ERR = 38 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Array not defined."
END IF
IF ERR = 3 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "RETURN without GOSUB."
END IF
IF ERR = 40 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Variable required."
END IF
IF ERR = 4 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Out of DATA."
END IF
IF ERR = 50 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "FIELD overflow."
END IF
IF ERR = 5 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Illegal function call."
END IF
IF ERR = 51 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Internal error."
END IF
IF ERR = 6 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Overflow."
END IF
IF ERR = 52 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Bad file name or number."
END IF
IF ERR = 7 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Out of memory."
END IF
IF ERR = 53 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "File not found."
END IF
IF ERR = 8 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Label not defined."
END IF
IF ERR = 54 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Bad file mode."
END IF
IF ERR = 9 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Subscript out of range."
END IF
IF ERR = 55 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "File already open."
END IF
IF ERR = 10 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Duplicate definition."
END IF
IF ERR = 56 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "FIELD statement active."
END IF
IF ERR = 11 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Division by zero."
END IF
IF ERR = 57 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Device I/O error."
END IF
IF ERR = 12 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Illegal in direct mode."
END IF
IF ERR = 58 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "File already exists."
END IF
IF ERR = 13 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Type mismatch."
END IF
IF ERR = 59 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Bad record length."
END IF
IF ERR = 14 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Out of string space."
END IF
IF ERR = 61 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Disk full."
END IF
IF ERR = 16 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "String formula too complex."
END IF
IF ERR = 62 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Input past end of file."
END IF
IF ERR = 17 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Cannot continue."
END IF
IF ERR = 63 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Bad record number."
END IF
IF ERR = 18 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Function not defined."
END IF
IF ERR = 64 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Bad file name."
END IF
IF ERR = 19 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "No RESUME."
END IF
IF ERR = 67 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Too many files."
END IF
IF ERR = 20 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "RESUME without error."
END IF
IF ERR = 68 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Device unavailable."
END IF
IF ERR = 24 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Device timeout."
END IF
IF ERR = 69 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Communication-buffer overflow."
END IF
IF ERR = 25 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Device fault."
END IF
IF ERR = 70 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Permission denied."
END IF
IF ERR = 26 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "FOR without NEXT."
END IF
IF ERR = 71 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Disk not ready."
END IF
IF ERR = 27 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Out of paper."
END IF
IF ERR = 72 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Disk-media error."
END IF
IF ERR = 29 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "WHILE without WEND."
END IF
IF ERR = 73 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Feature unavailable."
END IF
IF ERR = 30 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "WEND without WHILE."
END IF
IF ERR = 74 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Rename across disks."
END IF
IF ERR = 33 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Duplicate label."
END IF
IF ERR = 75 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Path/File access error."
END IF
IF ERR = 35 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Subprogram NOT defined."
END IF
IF ERR = 76 THEN
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT "Path NOT found."
END IF
END SUB

'SUPER BASIC ABS VERSION 3.00
SUB SbAbs
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT ABS(E)
        END IF
END SUB

SUB SbAcknowledge
        A = INSTR(A$, " ")
        IF A = 0 THEN
                F$ = "Press Any Key To Continue."
        ELSE
                F$ = MID$(A$, A + 1, LEN(A$))
        END IF
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT F$
        DO
        LOOP UNTIL INKEY$ <> ""

END SUB

SUB SbAdd
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        IF B = 0 THEN
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT "Missing Operand Error."
                GOTO 123
        ELSE
                E$ = MID$(A$, A + 1, B - 1)
                Q = VAL(E$)
                E$ = MID$(A$, B + 1, LEN(A$))
                W = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Q + W
        END IF
123
END SUB

SUB SbAdvance
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
        ELSE
                E = VAR(ASC(E$))
        END IF
        FOR J = 1 TO E
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT
        NEXT J

END SUB

SUB SbAlert
        COLOR 20
        A = INSTR(A$, " ")
        IF A = 0 THEN
                E$ = "Alert!!!"
        ELSE
                E$ = MID$(A$, A + 1, LEN(A$))
        END IF
        LOCATE , 1
        PRINT "³";
        LOCATE , 78
        PRINT "³";
        LOCATE , 2
        PRINT E$
        DO
                SOUND 650, 2
        LOOP UNTIL INKEY$ <> ""

END SUB

SUB SbAllow
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

'SUPER BASIC ARCCOS VERSION 1.00
SUB SbArcCos
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT ArcTanh(E)
        END IF

END SUB

SUB SbAsc (A$)
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(E$, "$") = 0 THEN
                PRINT ASC(E$)
        ELSE
                PRINT ASC(VAR$(ASC(E$)))
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT ATN(E)
        END IF

END SUB

SUB SbAuto
        DO
                LN = LN + 1
                PRINT LTRIM$(STR$(LN * 10)); " ";
                LINE INPUT A$(LN)
        LOOP UNTIL A$(LN) = ""
        LN = LN - 1

END SUB

SUB SbBackground
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

SUB SbBeep
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
        ELSE
                E = VAR(ASC(E$))
        END IF
        SOUND 800, E * 18.2

END SUB

SUB SbBlink
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

SUB SbBox
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

'SUPER BASIC CDBL VERSION 3.00
SUB SbCdbl
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Cel2Far(E)
        END IF

END SUB

SUB SbCel2Kel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Cel2Kel(E)
        END IF

END SUB

SUB SbCel2Ran
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Cel2Ran(E)
        END IF


END SUB

SUB SbCel2Rea
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Cel2Rea(E)
        END IF

END SUB

SUB SbChr
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT CHR$(E)
        ELSE
                PRINT CHR$(VAR(ASC(E$)))
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT CINT(E)
        END IF

END SUB

SUB SbCircle
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

SUB SbColor
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

'SUPER BASIC COS VERSION 3.00
SUB SbCos
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT CSNG(E)
        END IF

END SUB

SUB SbDecrease
        A = INSTR(A$, " ")
        F$ = MID$(A$, A + 1, LEN(A$))
        E = ASC(F$)
        VAR(E) = VAR(E) - 1

END SUB

'SUPER BASIC DEG VERSION 1.00
SUB SbDeg
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Deg(E)
        END IF

END SUB

SUB SbDivide
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

SUB SbDraw
        A = INSTR(A$, " ")
        E$ = MID$(A$, A, LEN(A$))
        DRAW "X" + VARPTR$(E$)

END SUB

'SUPER BASIC EXP VERSION 3.00
SUB SbExp
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Far2Rea(E)
        END IF

END SUB

SUB SbFiles
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        FILES E$

END SUB

'SUPER BASIC FIX VERSION 3.00
SUB SbFix
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT FIX(E)
        END IF

END SUB

SUB SbFre
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT FRE(E)
        ELSE
                PRINT FRE(VAR(ASC(E$)))
        END IF
END SUB

SUB SbGoto
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
                Commands (A$)
        NEXT K
J:
END SUB

SUB SbHex
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT HEX$(E)
        ELSE
                PRINT HEX$(VAR(ASC(E$)))
        END IF
END SUB

SUB SbIncrease
        A = INSTR(A$, " ")
        F$ = MID$(A$, A + 1, LEN(A$))
        E = ASC(F$)
        VAR(E) = VAR(E) + 1

END SUB

SUB SbInp
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT INP(E)
        ELSE
                PRINT INP(VAR(ASC(E$)))
        END IF
END SUB

SUB SbInput
        A = INSTR(A$, " ")
        E$ = MID$(A$, A, LEN(A$))
        E = ASC(E$)
        IF INSTR(A$, "$") = 0 THEN
                INPUT VAR(E)
        ELSE
                INPUT VAR$(E)
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT INT(E)
        END IF

END SUB

SUB SbIntDivide
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

SUB SbKel2Cel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Kel2Cel(E)
        END IF


END SUB

SUB SbKel2Far
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Kel2Far(E)
        END IF


END SUB

SUB SbKel2Ran
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Kel2Ran(E)
        END IF


END SUB

SUB SbKel2Rea
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Kel2Rea(E)
        END IF


END SUB

SUB SbKey
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

SUB SbLen
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(A$, "$") = 0 THEN
                PRINT LEN(E$)
        ELSE
                PRINT LEN(VAR(ASC(E$)))
        END IF
END SUB

SUB SbLine
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

SUB SbList
        FOR J = 1 TO LN
                PRINT LTRIM$(STR$(J * 10)); " "; A$(J)
        NEXT J

END SUB

SUB SbLoad
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

'SUPER BASIC LOG VERSION 3.00
SUB SbLog
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT LOG(E)
        END IF

END SUB

SUB SbMod
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

SUB SbMultiply
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

SUB SbNew
        FOR J = 1 TO LN
                A$(J) = ""
        NEXT J
        LN = 0
        MODE = 0
        SCREEN 0
        CLS

END SUB

SUB SbOct
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT OCT$(E)
        ELSE
                PRINT OCT$(VAR(ASC(E$)))
        END IF
END SUB

SUB SbOut
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        PORT = VAL(MID$(A$, A + 1, B - 1))
        V = VAL(MID$(A$, B + 1, LEN(A$)))
        OUT PORT, V

END SUB

SUB SbPaint
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PAINT (Q, W), R

END SUB

SUB SbPeek
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT PEEK(E)
        ELSE
                PRINT PEEK(VAR(ASC(E$)))
        END IF
END SUB

SUB SbPen
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT PEN(E)
        ELSE
                PRINT PEN(VAR(ASC(E$)))
        END IF
END SUB

SUB SbPlay
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT PLAY(E)
        ELSE
                PRINT PLAY(VAR(ASC(E$)))
        END IF
END SUB

SUB SbPlay2
        A = INSTR(A$, " ")
        B$ = MID$(A$, A + 1, LEN(A$))
        IF B$ = "" THEN
                PRINT "Missing Operand Error"
                GOTO 320
        END IF
        PLAY "X" + VARPTR$(B$)
320
END SUB

SUB SbPoint
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT POINT(E)
        ELSE
                PRINT POINT(VAR(ASC(E$)))
        END IF
END SUB

SUB SbPoke
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        LCN = VAL(MID$(A$, A + 1, B - 1))
        V = VAL(MID$(A$, B + 1, LEN(A$)))
        POKE LCN, V

END SUB

SUB SbPos
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT POS(E)
        ELSE
                PRINT POS(VAR(ASC(E$)))
        END IF
END SUB

SUB SbPower
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

SUB SbPreset
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PRESET (Q, W), R

END SUB

SUB SbPrint
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

SUB SbPset
        A = INSTR(A$, "(")
        B = INSTR(A$, ")")
        C = INSTR(A$, ",")
        D = INSTR(C + 1, A$, ",")
        Q = VAL(MID$(A$, A + 1, C - 1))
        W = VAL(MID$(A$, C + 1, B - 1))
        R = VAL(MID$(A$, D + 1, LEN(A$)))
        PSET (Q, W), R

END SUB

'SUPER BASIC RAD VERSION 1.00
SUB SbRad
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Rad(E)
        END IF

END SUB

SUB SbRan2Cel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Ran2Cel(E)
        END IF


END SUB

SUB SbRan2Far
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Ran2Far(E)
        END IF


END SUB

SUB SbRan2Kel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Ran2Kel(E)
        END IF


END SUB

SUB SbRan2Rea
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Ran2Rea(E)
        END IF


END SUB

SUB SbRea2Cel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Rea2Cel(E)
        END IF


END SUB

SUB SbRea2Far
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Rea2Far(E)
        END IF
    
END SUB

SUB SbRea2Kel
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Rea2Kel(E)
        END IF


END SUB

SUB SbRea2Ran
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Rea2Ran(E)
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT RND(E)
        END IF
END SUB

SUB SbRun
        FOR J = 1 TO LN
                A$ = A$(J)
                Commands (A$)
        NEXT J

END SUB

SUB SbSave
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

SUB SbScreen
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

'SUPER BASIC SEC VERSION 1.00
SUB SbSec
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                LOCATE , 1
                PRINT "³";
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Sinh(E)
        END IF

END SUB

SUB SbSound
        A = INSTR(A$, " ")
        B = INSTR(A$, ",")
        E$ = MID$(A$, A + 1, B - 1)
        FREQ = VAL(E$)
        E$ = MID$(A$, B + 1, LEN(A$))
        DUR = VAL(E$)
        SOUND FREQ, DUR

END SUB

SUB SbSpace
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SPACE$(E)
        ELSE
                PRINT SPACE$(VAR(ASC(E$)))
        END IF

END SUB

SUB SbSpc
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT SPC(E);
        ELSE
                PRINT SPC(VAR(ASC(E$)));
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT SQR(E)
        END IF

END SUB

SUB SbStick
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT STICK(E)
        ELSE
                PRINT STICK(VAR(ASC(E$)))
        END IF

END SUB

SUB SbStr
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT STR$(E)
        ELSE
                PRINT STR$(VAR(ASC(E$)))
        END IF

END SUB

SUB SbStrig
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT STRIG(E)
        ELSE
                PRINT STRIG(VAR(ASC(E$)))
        END IF

END SUB

SUB SbSubtract
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

SUB SbTab
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF E$ < "A" OR E$ > "Z" THEN
                E = VAL(E$)
                PRINT TAB(E);
        ELSE
                PRINT TAB(VAR(ASC(E$)));
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
                LOCATE , 78
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
                LOCATE , 78
                PRINT "³";
                LOCATE , 2
                PRINT Tanh(E)
        END IF

END SUB

SUB SbVal
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(A$, "$") = 0 THEN
                PRINT VAL(E$)
        ELSE
                PRINT VAL(VAR$(ASC(E$)))
        END IF

END SUB

SUB SbVarptr
        A = INSTR(A$, " ")
        E$ = MID$(A$, A + 1, LEN(A$))
        IF INSTR(A$, "$") = 0 THEN
                PRINT VARPTR$(E$)
        ELSE
                PRINT VARPTR$(VAR$(ASC(E$)))
        END IF

END SUB

SUB SbWait
        DO
        LOOP UNTIL INKEY$ <> ""

END SUB

SUB SbWidth
        A = INSTR(A$, " ")
        E = VAL(MID$(A$, A + 1, LEN(A$)))
        WIDTH E

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

```
</details>
