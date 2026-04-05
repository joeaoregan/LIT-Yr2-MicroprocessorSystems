*-----------------------------------------------------------
* Title      :
* Written by :
* Date       : 07/02/2016
* Description: Lec3 S17
*-----------------------------------------------------------
    ORG	$1000
START:				; first instruction of program
 	MOVE.W	#FRAME3,D2  ; 18 in Hex is stored in D2 ( 6 x 4)
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings
FRAME		EQU	5                                                                                                   
FRAME2		EQU	FRAME+1                                                              
FRAME3		EQU	FRAME2*4  


	END	START		; last line of source
 

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
