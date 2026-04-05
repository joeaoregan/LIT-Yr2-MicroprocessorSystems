*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
; output prompt enter A
	LEA	PROMPTA,A1	; Load message to A1
	MOVE.B	#14,D0		; trap task 14
	TRAP 	#15		; Display message
; input	A
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.B  D1,D2		; Move A to D2
	
; output prompt enter B
	LEA	PROMPTB,A1	
	MOVE.B	#14,D0		
	TRAP 	#15	
; input	B
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.B  D1,D3		; Move B to D3
	
; output prompt enter C
	LEA	PROMPTC,A1	
	MOVE.B	#14,D0		
	TRAP 	#15	
; input	C
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.B  D1,D4		; Move C to D4	

; output prompt enter D
	LEA	PROMPTD,A1	
	MOVE.B	#14,D0		
	TRAP 	#15
; input	D
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.B  D1,D5		; Move D to D5
		
	ADD 	D2,D3		; Add D2 to D3
	ADD	D4,D5		; Add D4 to D5
	MULU	D3,D5		; Multiply D3 by D5
	MOVE.B	D5,D1		; Move D5 to print
	
	LEA 	ANSWER,A1
	MOVE.B	#14,D0
	TRAP	#15
	
	MOVE.B	#3,D0
	TRAP 	#15


	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings


PROMPTA DC.B	'ENTER A: ',0
PROMPTB DC.B	'ENTER B: ',0
PROMPTC	DC.B	'ENTER C: ',0
PROMPTD DC.B	'ENTER D: ',0
ANSWER  DC.B	'ANSWER: ',0



	END	START		; last line of source

*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
