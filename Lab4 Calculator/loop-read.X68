*-----------------------------------------------------------
* Program    :	loop-read.x68
* Written by : 	Joe O'Regan
* Date       : 	24/02/2016
* Description: 	Lab4 Part 1: Prompt user to read in from keyboard
* 		store the numbers starting at membory location 2000
*		output the numbers to screen
*-----------------------------------------------------------
	ORG	$1000		; Program starts at address $1000
START:				; first instruction of program
  MOVE.W  #$2000,A0		; Memory location A0 starts at $2000
  
* Enter Numbers and Store
  REPEAT			; REPEAT UNTIL Loop - Ends when 0 IS ENTERED
	* Prompt for input
	LEA Prompt,A1		; Message Prompt: Prompt user to enter number
	MOVE.B	#14,D0		; Trap task 14: Display message
	TRAP 	#15
	
	* get number from user into address register and increment by a word i.e. 16 bits
	MOVE.B	#4,D0		; Trap task 4: Read in input from keyboard
	TRAP	#15
	MOVE.W	D1,(A0)+	; Move D1 (num entered) to Memory location A0 and increment A0
  UNTIL.W D1 <EQ> #0 DO		; End of Repeat Until loop for entering numbers
  
* Reset A0 to $2000 and print numbers to screen, until 0 is reached in memory
  MOVE.W #$2000,A0          	; Reset A0 to $2000 so values stored can be printed to screen
  MOVE.W #10,D2		        ; PLACE 10 IN D2 - ***FORMAT IS DECIMAL***
  REPEAT 
  	MOVE.W (A0)+,D1	        ; Move contents of A0 to D1 and increment A0
  	iF.W D1 <NE> #0 THEN
  		LEA NUM,A1 	; Print the string NUM using TASK 14
		MOVE.B	#14,D0	; Output NUM message
		TRAP 	#15	

		MOVE.B	#15,D0	; Print D1 to screen using TASK 15, with format specified in D2
		TRAP	#15 
     	ENDI 
  UNTIL.W D1 <EQ> #0 DO     	; End of Repeat Until Loop for printing numbers entered
  
* Exit
	MOVE.B	#9,D0
	TRAP	#15		; Halt simulator

* Variables and Strings
CR		EQU	$D					; Carriage Return
LF		EQU	$A					; Line Feed
Prompt		DC.B	'Enter a number: ',0			; Enter new number message
NUM		DC.B	CR,LF,'The number entered was: ',0	; Output number entered message


	END	START		; Last line of source


*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
