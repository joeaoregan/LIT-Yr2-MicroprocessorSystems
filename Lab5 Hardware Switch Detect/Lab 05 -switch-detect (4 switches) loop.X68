* Modified by: Joe O'Regan K00203642
* Date		 : 16/03/2016
*
*----------------------------------------------------------- 
* Program    : switchInput.x68 
* Written by : Chuck Kelly 
* Date       : Jan 22, 2010 
* Description: Demonstrate use of toggle switches for user input. 
* 
* Displays the current state of toggle switches 0 and 1. 
*----------------------------------------------------------- 
        ORG $1000 
START:                      ; first instruction of program 

* Display hardware window 
        MOVE.B  #32,D0 
        MOVE.B  #00,D1 
        TRAP    #15 

* Use trap task to get address of toggle switches in D1.L 
        MOVE.B  #32,D0      ; trap task 32 Hardware/Simulator 
        MOVE.B  #3,D1       ; D1.B = 03, Return address of toggle swithces in D1.L 
        TRAP    #15         ; perform task 
        MOVE.L  D1,A0       ; A0 is pointer to toggle switches 

* Read starting state of toggle switches into D2 
        MOVE.B  (A0),D2	    ;;;;; Store value in D2
        BSR     DISPLAY     ; display switch states 

    WHILE <T> DO.S          ; ***** INFINITE LOOP ***** 
        REPEAT 
            MOVE.B  #23,D0 
            MOVE.L  #1,D1       ; delay 1/100 second 
            TRAP    #15 
            MOVE.B  (A0),D1     ; read switches 
        UNTIL.B D1 <NE> D2 DO   ; loop until switch change 
        MOVE.B  D1,D2       ; switch data 
        BSR     DISPLAY 
    ENDW    

* Keep here in case infinite loop is removed. 
        MOVE.B  #9,D0 
        TRAP    #15             ; halt simulator 

*------------------------------------------------ 
* Display switch states 
* Pre: D2.B contains switch data 
* Post: Displays switch states 
*       D2 unchanged 
DISPLAY MOVEM.L D0/D1/A1,-(SP)  ; save registers (stack D7)
        MOVE.B  #11,D0          ; clear screen 
        MOVE.W  #$FF00,D1 
        TRAP    #15 
* Clear register D5 and loop through switches        
        CLR.L   D5              ; CHANGE: Use Register D5 incrementing in loop
  REPEAT                        ; CHANGE: loop instead
        LEA     SWITCH,A1       ; message pointer CHANGE: only need 1 SWITCH
        MOVE.B  #14,D0          ; OK
        TRAP    #15             ; OK display message 
* Output the switch number    
        CLR.L   D1              ; NEW: Clear D1, stops gibberish in output
        MOVE.B  D5,D1           ; NEW: Move D5 for output	
	MOVE.B	#3,D0           ; NEW: output d5
	TRAP 	#15             ; NEW
* Bit test against incrementing register D5
        BTST    D5,D2           ; test switch 0 state CHANGE: increment register
        BEQ     S_OFF           ; if off CHANGE: only need one S_OFF, removed 0
        LEA     ON,A1           ; OK 'ON' message 
        
        BRA     SDISP           ; Change: S0DISP TO SDISP only need 1
S_OFF  LEA     OFF,A1           ; 'OFF' message CHANGE: S0_OFF to S_OFF
SDISP  MOVE.L  #14,D0 
        TRAP    #15             ; display 'ON' or 'OFF' 
        ADD     #1,D5           ; Change: Increment D5
  UNTIL.W D5 <EQ> #4 DO         ; Change: D5 counts to 4 switches
       
        MOVEM.L (SP)+,D0/D1/A1  ; restore registers 
        RTS 

*------------------------------------------------ 
* Variables and Strings 
SWITCH  DC.B    'SWITCH ',0       ; ONLY NEED ONE SWITCH MESSAGE

ON      DC.B    ' ON',$D,$A,0     ; ADD SPACE
OFF     DC.B    ' OFF',$D,$A,0    ; ADD SPACE

        END       START   ; last line of source 


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
