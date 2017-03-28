*-----------------------------------------------------------
* Program    :planets
* Written by :Emerson Williams and Brad Krupp Jr.
* Date       :2/7/07
* Description:Sample Program 2 for Quickstart Guide
*-----------------------------------------------------------
START   ORG     $1000

*-------Code for output-------
LOOP    LEA     MESSAGE,A1     
        MOVE.B  #14,D0          
        TRAP    #15       

*-------Code for input-------
        MOVE.B  #4,D0           Trap task 4 does the following:
        TRAP    #15             Read a number from the keyboard into D1.L
        CMP.L   #0,D1           Compares D1 to the number 0
        BEQ     DONE            Branch to DONE if they are equal
        
        CMP.B   #0,D1           Compares D1 to 0
        BLT     INVALID         BLT branches if D1 is less than 0
        CMP.B   #10,D1           Compares D1 to 1
        BGE     INVALID         BGT branches if D1 is greater than 9

*--figure out what the number actually is--
        CMP.B   #1,D1           Compares D1 and 1
        BNE     TWO             BEQ branches if D1 and 1 are not equal
        LEA     DISPONE,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP    
                
TWO     CMP.B   #2,D1           Compares D1 and 2
        BNE     THREE           BEQ branches if D1 and 2 are not equal
        LEA     DISPTWO,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

THREE   CMP.B   #3,D1           Compares D1 and 3
        BNE     FOUR            BEQ branches if D1 and 3 are not equal
        LEA     DISPTHR,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

FOUR    CMP.B   #4,D1           Compares D1 and 4
        BNE     FIVE
        LEA     DISPFOU,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

FIVE    CMP.B   #5,D1           Compares D1 and 2
        BNE     SIX             BEQ branches if D1 and 2 are not equal
        LEA     DISPFIV,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

SIX     CMP.B   #6,D1           Compares D1 and 3
        BNE     SEVEN           BEQ branches if D1 and 3 are not equal
        LEA     DISPSIX,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

SEVEN   CMP.B   #7,D1           Compares D1 and 4
        BNE     EIGHT
        LEA     DISPSEV,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

EIGHT   CMP.B   #8,D1           Compares D1 and 2
        BNE     NINE            BEQ branches if D1 and 2 are not equal
        LEA     DISPEIG,A1      
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP

NINE    LEA     DISPNIN,A1      
        MOVE.B  #14,D0  
        TRAP    #15

        BRA     LOOP            Branch to LOOP

INVALID LEA     INV,A1
        MOVE.B  #14,D0  
        TRAP    #15
        BRA     LOOP
        
DONE    MOVE.B  #9,D0
        TRAP    #15             Halt Simulator

CR      EQU     $0D         
LF      EQU     $0A 

MESSAGE DC.B    'Enter a number between 0 and 9, Enter 0 to exit: ',0
INV     DC.B    'That is not between 1 and 9.',CR,LF,0
DISPONE DC.B    'HELLO MERCURY',CR,LF,0
DISPTWO DC.B    'HELLO VENUS',CR,LF,0
DISPTHR DC.B    'HELLO EARTH',CR,LF,0
DISPFOU DC.B    'HELLO MARS',CR,LF,0
DISPFIV DC.B    'HELLO JUPITER',CR,LF,0
DISPSIX DC.B    'HELLO SATURN',CR,LF,0
DISPSEV DC.B    'HELLO URANUS',CR,LF,0
DISPEIG DC.B    'HELLO NEPTUNE',CR,LF,0
DISPNIN DC.B    'HELLO PLUTO',CR,LF,0


        END     START



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
