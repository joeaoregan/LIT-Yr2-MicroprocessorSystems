*-----------------------------------------------------------
* Program    :	loop-calc.x68
* Written by : 	Joe O'Regan
* Date       : 	24/02/2016
* Description: 	Lab 4 Part 1: Prompt user to read in from keyboard
* 		store the numbers starting at membory location 2000
*               After the user has selected a menu option. 
*		Add the numbers together and store in D5 OR
* 		Multiply the all the numbers and store in D6
*		output the numbers to screen and the total for
*               add or multiply depending on the option selected
*-----------------------------------------------------------
	ORG	$1000		; Program starts at address $1000
START:				; First instruction of program
* MENU

* Display Options - Branches back to MENU after calculation performed	
MENU  	MOVE.W  #$2000,A0	; Memory location A0 starts at $2000
        LEA Option,A1		; Display the Option Message (Menu)
  	MOVE.B	#14,D0          ; Trap task 14: Display message
  	TRAP	#15
* Input Menu Option
  	MOVE.B	#4,D0           ; Trap task 4: Read in input from keyboard
  	TRAP	#15
  	
  	MOVE.B	D1,D3		; Store option selected in D3 to decide output later
  	
* MENU OPTION COMPARES & BRANCHES  	
* Exit if 0  	
  	CMP.L   #0,D1           ; Compares D1 to the number 0
        BEQ     EXIT            ; Branch to EXIT if they are equal
* INVALID: Check number is in valid range 0-2        
        CMP.B   #0,D1           ; Compares D1 to 0
        BLT     INVALID         ; BLT branches if D1 is less than 0
        CMP.B   #2,D1           ; Compares D1 to 2
        BGT     INVALID         ; BGT branches if D1 is greater than 2
* User Message: Enter 0 to calculate       
        LEA Calculate,A1	; Display Calculate Message
	MOVE.B	#14,D0
	TRAP 	#15
* Decide to proceed with ADDITION or MULTIPLICATION
        CMP.B   #1,D1           ; Compares D1 and 1
        BNE     MULT            ; Branches to MULT (Multiplication) if D1 not equals 1

* ADDITION:
        CLR.B   D5              ; Clear / Reset D5, Data Register Containing The Addition Total
  REPEAT                        ; REPEAT UNTIL Loop - Ends when 0 IS ENTERED   
        LEA PromptA,A1		; PromptA Message: Enter number to Add
	MOVE.B	#14,D0		
	TRAP 	#15
* get number from user into address register and increment by a word i.e. 16 bits
	MOVE.B	#4,D0
	TRAP	#15
	MOVE.W	D1,(A0)+	; Move D1 (num entered) to Memory location A0 and increment A0
* Add number to total	
	ADD 	D1,D5		; Add D1 to D5 (Store in D5)
  UNTIL.W D1 <EQ> #0 DO	        ; End of loop
* Branch To Output  
        BRA     OUTPUT		; Branch to Output
        
* MULTIPLICATION:   
MULT    MOVE.W  #1,D6		; Set / Reset value of D6 to 1 for multiplication  
  REPEAT                        ; REPEAT UNTIL Loop - Ends when 0 IS ENTERED   
        LEA PromptM,A1		; PromptM Message: Enter number to Multiply
	MOVE.B	#14,D0
	TRAP 	#15
* get number from user into address register and increment by a word
	MOVE.B	#4,D0		; Trap task 4: Read in input from keyboard
	TRAP	#15
	MOVE.W	D1,(A0)+	; Move D1 (num entered) to Memory location A0 and increment A0
* Multiply number by the total in D6
        iF.W D1 <NE> #0 THEN	; If the number is not equal to 0 multiply by total
	MULU	D1,D6		; Multiply number entered by contents of D6
	ENDI
  UNTIL.W D1 <EQ> #0 DO	        ; No need to branch to output

* OUTPUT:
OUTPUT
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
* Output the numbers added together
        iF.W D3 <EQ> #1 THEN
  	MOVE.W	D5,D1		; Move the total D5 to D1 to display
  		LEA TotAdd,A1 	; Output the Message for Total of all numbers added
		MOVE.B	#14,D0	; Output Total Added message
		TRAP 	#15	
		
	MOVE.B	#3,D0		; Output the Value for total of all numbers added
	TRAP 	#15	
	ENDI
* Output the numbers multiplied together
        iF.W D3 <EQ> #2 THEN
    	MOVE.W	D6,D1		; Move the total D6 to D1 to display
  		LEA TotMul,A1 	; Output the Message for Total of all numbers multiplied
		MOVE.B	#14,D0	; Output Total Multiplied message
		TRAP 	#15	
		
	MOVE.B	#3,D0		; Output the Value for total of all numbers Multiplied
	TRAP 	#15
        ENDI
* Run the program again?	
                LEA RunAgain,A1 ; Ask user if they would like to run program again
                MOVE.B	#14,D0
		TRAP 	#15
* Branch back to LOOP to run menu/options again   
        BRA     MENU    	; Branch back to loop
      
* Invalid Option Selected
INVALID LEA     INV,A1
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     MENU
* Exit
EXIT	MOVE.B	#9,D0
	TRAP	#15		; Halt simulator

* Variables and Strings
CR		EQU	$D						    ; Carriage Return
LF		EQU	$A						    ; Line Feed
PromptA		DC.B	'Enter number to add: ',0			    ; Enter new number message add to total
PromptM		DC.B	'Enter number to multiply: ',0		            ; Enter new number message multiply by total
TotAdd		DC.B	CR,LF,CR,LF,'Total Of Numbers Added: ',0	    ; Output the total for the all numbers added
TotMul		DC.B	CR,LF,CR,LF,'Value Of All Numbers Multiplied: ',0   ; Total for all the numbers multiplied
NUM		DC.B	CR,LF,'The number entered was: ',0		    ; Output number entered message
INV		DC.B	CR,LF,'Not A Valid Option'                          ; Invalid selection message
		DC.B	CR,LF,'Options Are Between 0 and 2',CR,LF,CR,LF,0
Option		DC.B	'Please Choose An Option: '                         ; Menu / Options message output
		DC.B	CR,LF,'1. Add All The Numbers'
		DC.B	CR,LF,'2. Multiply All The Numbers'
		DC.B 	CR,LF,'0. Exit The Program',CR,LF,0
RunAgain        DC.B    CR,LF,CR,LF,'Would you like to run the program again?',CR,LF,CR,LF,0
Calculate       DC.B    CR,LF,'Enter 0 to perform calculation',CR,LF,0      ; Explain to user 0 performs calculation

	END	START		                                            ; Last line of source


*~Font name~Fixedsys~
*~Font size~9~
*~Tab type~1~
*~Tab size~8~
