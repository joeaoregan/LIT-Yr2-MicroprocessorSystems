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
        MOVE.B  (A0),D2 
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
DISPLAY MOVEM.L D0/D1/A1,-(SP)  ; save registers 
        MOVE.B  #11,D0      ; clear screen 
        MOVE.W  #$FF00,D1 
        TRAP    #15 
        
        LEA     SWITCH0,A1  ; message pointer 
        MOVE.B  #14,D0 
        TRAP    #15         ; display message 
        BTST    #0,D2       ; test switch 0 state 
        BEQ     S0_OFF      ; if off 
        LEA     ON,A1       ; 'ON' message 
        BRA     S0DISP 
S0_OFF  LEA     OFF,A1      ; 'OFF' message 
S0DISP  MOVE.B  #14,D0 
        TRAP    #15         ; display 'ON' or 'OFF' 

        LEA     SWITCH1,A1  ; same for switch1 
        MOVE.B  #14,D0 
        TRAP    #15 
        BTST    #1,D2 
        BEQ     S1_OFF 
        LEA     ON,A1 
        BRA     S1DISP 
S1_OFF  LEA     OFF,A1 
S1DISP  MOVE.B  #14,D0 
        TRAP    #15 
        
        MOVEM.L (SP)+,D0/D1/A1  ; restore registers 
        RTS 

*------------------------------------------------ 
* Variables and Strings 
SWITCH0 DC.B    'SWITCH 0 ',0 
SWITCH1 DC.B    'SWITCH 1 ',0 
ON      DC.B    'ON',$D,$A,0 
OFF     DC.B    'OFF',$D,$A,0 

        END       START   ; last line of source 
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
