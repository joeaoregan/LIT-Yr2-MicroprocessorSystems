*-----------------------------------------------------------
* Program    : Lab3Part2.X68
* Written by : Joe O'Regan
* Date       : 09-02-2016
* Description: Enter 4 numbers and perform a calculation
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program
; Prompt enter A
	LEA	PROMPTA,A1	; Load message to A1
	MOVE.B	#14,D0		; trap task 14
	TRAP 	#15		; Display message
	MOVE.B  #4,D0           ; Input A
	TRAP    #15
	MOVE.B  D1,D2		; Move A to D2	
; Prompt enter B
	LEA	PROMPTB,A1	
	MOVE.B	#14,D0		
	TRAP 	#15	
	MOVE.B  #4,D0           ; Input B
	TRAP    #15
	MOVE.B  D1,D3		; Move B to D3	
; Prompt enter C
	LEA	PROMPTC,A1	
	MOVE.B	#14,D0		
	TRAP 	#15	
	MOVE.B  #4,D0           ; Input	C
	TRAP    #15
	MOVE.B  D1,D4		; Move C to D4	
; Prompt enter D
	LEA	PROMPTD,A1	
	MOVE.B	#14,D0		
	TRAP 	#15
	MOVE.B  #4,D0           ; Input	D
	TRAP    #15
	MOVE.B  D1,D5		; Move D to D5
; Perform calculation
	ADD 	D2,D3		; Add D2 to D3, store answer in D3
	ADD	D4,D5		; Add D4 to D5, store answer in D5
	MULU	D3,D5		; Multiply D3 by D5, store answer in D5
	MOVE.B	D5,D1		; Move D5 to D1 for output
;Output answer	
	LEA 	ANSWER,A1
	MOVE.B	#14,D0
	TRAP	#15
	
	MOVE.B	#3,D0
	TRAP 	#15
	MOVE.B	#9,D0
	TRAP	#15		; halt simulator
* Variables and Strings
PROMPTA DC.B	'ENTER A: ',0   ; Messages: Prompt user to enter numbers
PROMPTB DC.B	'ENTER B: ',0
PROMPTC	DC.B	'ENTER C: ',0
PROMPTD DC.B	'ENTER D: ',0
ANSWER  DC.B	'ANSWER: ',0    ; Message: Answer of calculation
	END	START		; last line of source




*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
