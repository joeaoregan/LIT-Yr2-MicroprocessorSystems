*-----------------------------------------------------------
* Program    : Lab 1
* Written by : Joe O'Regan
* Date       : 21/01/2016
* Description: First Program
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	MOVE.B #10,D1                 ; Step 2
	MOVE.B #9,D4                  ; Step 6
	ADD D4,D1                     ; Step 7
	MOVE.B #$F,D2                 ; Step 8
	MOVE.B #%00010000,D3          ; Step 9
	ADD #3,D1                     ; Step 10

* Exit code 
	MOVE.B	#9,D0
	TRAP	#15		; Used for I/O
;         SIMHALT                       ; halt simulator (not needed Task 9 = terminate)

* Variables and Strings



	END	START		; last line of source




*~Font name~Fixedsys~
*~Font size~12~
*~Tab type~1~
*~Tab size~8~
