*-----------------------------------------------------------
* Title      :
* Written by : Joe O'Regan
* Date       :
* Description: read values using a loop + output numbers entered
*-----------------------------------------------------------
    ORG    $1000
START:                      ; first instruction of program
  MOVE.W  #$2000,A0         * point A0 to location $2000
  
* Loop until 0 is entered

  REPEAT					; REPEAT - UNTIL loop
* prompt for input
	lea prompt,A1
	move.b	#14,D0
	trap 	#15

* get number from user into address register and increment by a word i.e. 16 bits
	move.b	#4,D0
	trap	#15
	
	move.w	d1,(A0)+
  UNTIL.W D1 <EQ> #0 DO

; code inserted
  MOVE.W #$2000,A0          ; reset A0 to $2000
  MOVE.W #10,D2		        ; PLACE 10 IN D2 AS FORMAT IS DECIMAL
  REPEAT 
  	MOVE.W (A0)+,D1	        ; move contents of a0 to d1 and increment a0
  	iF.W d1 <NE> #0 THEN
  		lea num,A1 	        ; PRINT THE STRING NUM USING TASK 14
		move.b	#14,D0
		trap 	#15	

		move.b	#15,D0      ; PRINT D1 TO THE SCREEN USING TASK 15
		trap	#15 
     	ENDI 
  UNTIL.W D1 <EQ> #0 DO     ; endo of new code
  
	MOVE.B	#9,D0
	TRAP	#15		        ; Halt Simulator
* Put variables and constants here
CR	EQU		$D
LF	EQU		$A
prompt		dc.b	CR,LF,'Enter a number: ',0
num		    dc.b	CR,LF,'The number entered was: ',0  ; new line of code;

    END    START                                        ; last line of source





  
    
	





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
