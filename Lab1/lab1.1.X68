*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
	MOVE #10,D1
	MOVE #9,D4
	ADD D4,D1
	MOVE #$F,D2
	MOVE #%00010000,D3
	ADD #3,D1

* Exit code 
	MOVE.B	#9,D0
	TRAP	#15
          sSIMHAL simulator

* Variables and Strings



	END	START		; last line of source


*~Font name~Fixedsys~
*~Font size~12~
*~Tab type~1~
*~Tab size~8~
