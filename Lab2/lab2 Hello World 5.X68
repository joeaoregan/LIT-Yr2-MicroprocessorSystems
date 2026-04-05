*-----------------------------------------------------------
* Program    : Hello World - Part 5
* Written by : Joe O'Regan
* Date       : 27/01/2016
* Description: Sample Program 4 for Quickstart Guide
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program

	LEA	MESSAGE,A1	; Loads Message into address register A1
	MOVE.B	#14,D0		; Moves the number 14 into data register D0
	TRAP 	#15		; Displays Message

	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings
CR	EQU	$0D		; ASCII code for Carriage Return
LF	EQU	$0A		; ASCII code for Line Feed
MESSAGE DC.B	'HELLO CRUEL WORLD',CR,LF	; ASCII string with new line
	DC.B	'ALL YOUR BASE ARE BELONG TO US',CR,LF
	DC.B	'YOU CAN ALSO MAKE MULTIPLE LINES',CR,LF
	DC.B	'IN ONE DC.B STATEMENT',CR,LF,'JUST REMEMBER',CR,LF
	DC.B	'TO SEPERATE EACH WITH A COMMA',CR,LF,CR,LF
	DC.B	'AND END YOUR LAST STATEMENT WITH A ZERO',CR,LF,0


	END	START		; last line of source




*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
