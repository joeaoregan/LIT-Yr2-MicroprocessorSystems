*-----------------------------------------------------------
* Program    : Lab 3 Part 1
* Written by : Joe O'Regan
* Date       : 09-02-16
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
; output prompt numerator
	LEA	PROMPTN,A1	; Load message to A1
	MOVE.B	#14,D0		; trap task 14
	TRAP 	#15		; Display message
; input	numerator
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.B  D1,D4		; Move numerator to D4
	
; output pompt denominator
	LEA	PROMPTD,A1	; Load message to A1
	MOVE.B	#14,D0		; trap task 14
	TRAP 	#15		; Display message
; input denominator
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.B  D1,D3		; Move denominator to D3
	
	DIVU	D3,D4		; Divide 
; move d4
	MOVE.W  D4,D5		; Quotient to D5
	SWAP	D4		; **** NEED TO SWAP POSITION OF REMAINDER
	
	MOVE.W  D4,D6		; Remainder to D6
		
; output 
	LEA	PROMPTQ,A1	; Print quotient message
	MOVE.B	#14,D0
	TRAP	#15
	
	MOVE.B  D5,D1		; Move quotient to D1
	
	MOVE.B 	#3,D0		; Print quotient
	TRAP	#15
	
	LEA	PROMPTR,A1	; Print remainder message
	MOVE.B	#14,D0
	TRAP	#15
	
	MOVE.B	D6,D1		; Move remainder to D1
	
	MOVE.B 	#3,D0		; Print remainder
	TRAP	#15

	
	

; exit
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings

PROMPTN DC.B	'ENTER NUMERATOR: ',0
PROMPTD DC.B	'ENTER DENOMINATOR: ',0
PROMPTQ	DC.B	'QUOT-I-E-NT: ',0
PROMPTR DC.B	' REMAINDER: ',0
;MESSAGE	DC.B	' DIVIDED BY ',0

	END	START		; last line of source

*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
