*-----------------------------------------------------------
* Program    : Lab3Part1.x68
* Written by : Joe O'Regan
* Date       : 09-02-16
* Description: Division Program
*-----------------------------------------------------------
	ORG	$1000
START:				; First instruction of program
; Prompt for numerator
	LEA	PROMPTN,A1	; Load PROMPTN (numerator message) to A1
	MOVE.B	#14,D0		; Trap task 14
	TRAP 	#15		; Display message
; Input	numerator
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.W  D1,D4		; Step 1. Move numerator to D4	
; Prompt for denominator
	LEA	PROMPTD,A1	; Load PROMPTD (denominator message) to A1
	MOVE.B	#14,D0		; Trap task 14
	TRAP 	#15		; Display message
; Input denominator
	MOVE.B  #4,D0
	TRAP    #15
	MOVE.W  D1,D3		; Step 2. Move denominator to D3
; Divide
	DIVU	D3,D4		; Divide D4 by D3
; Separate Quotient & Remainder
	MOVE.W  D4,D5		; Step 4. Move Quotient to temp location D5
	SWAP	D4		; Step 4. Swap postition of remainder to start of D4			
; Output quotient
	LEA	PROMPTQ,A1	; Print quotient message
	MOVE.B	#14,D0
	TRAP	#15
	
	MOVE.B  D5,D1		; Move quotient to D1	
	MOVE.B 	#3,D0		; Step 3. Print quotient
	TRAP	#15
; Ouput remainder
	LEA	PROMPTR,A1	; Print remainder message
	MOVE.B	#14,D0
	TRAP	#15
	
	MOVE.B	D4,D1		; Move remainder to D1	
	MOVE.B 	#3,D0		; Step 3. Print remainder
	TRAP	#15
; exit
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator
* Variables and Strings
CR	EQU	$0D		; ASCII code for Carriage Return
LF	EQU	$0A		; ASCII code for Line Feed
PROMPTN DC.B	'ENTER NUMERATOR: ',0
PROMPTD DC.B	'ENTER DENOMINATOR: ',0
PROMPTQ	DC.B	'QUOTIENT:  ',0
PROMPTR DC.B	CR,LF,'REMAINDER: ',0
;MESSAGE	DC.B	' DIVIDED BY ',0

	END	START		; last line of source

*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
