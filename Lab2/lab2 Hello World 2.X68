*-----------------------------------------------------------
* Program    : Hello World - Part 2
* Written by : Joe O'Regan
* Date       : 27/01/2016
* Description: Sample Program 1 for Quickstart Guide
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program

	LEA	MESSAGE,A1	; Loads Message into address register A1
	MOVE.B	#14,D0		; Moves the number 14 into data register D0
	TRAP 	#15		; Displays Message
	
* Exit code
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings
CR	EQU	$0D		; ASCII code for Carriage Return
LF	EQU	$0A		; ASCII code for Line Feed
MESSAGE DC.B	'HELLO WORLD',CR,LF,0   ; ASCII string with new line

	END	START		; last line of source
*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
