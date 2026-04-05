*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description: read values using a loop
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
  MOVE.W  #$2000,A0 * point A0 to location $2000
  
* Put program code here
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
  
	MOVE.B	#9,D0
	TRAP	#15		Halt Simulator

* Put variables and constants here
CR	EQU		$D
LF	EQU		$A
prompt		dc.b	CR,LF,'Enter a number: ',0

    END    START        ; last line of source





  
    
	





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
