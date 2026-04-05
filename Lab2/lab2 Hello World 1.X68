*-----------------------------------------------------------
* Program    : Hello World
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
MESSAGE DC.B	'HELLO WORLD',0

	END	START		; last line of source
*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
