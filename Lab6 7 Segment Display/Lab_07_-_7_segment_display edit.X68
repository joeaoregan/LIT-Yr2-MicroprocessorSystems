*-----------------------------------------------------------
* Program    :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
	ORG	$1000
START:				; first instruction of program






*---------------------------------------------------------- 
* Display a digit on the 7-segment display 
* Pre:  D3.B contains 1 digit to display 
*       A2 points to 7-segment LED to use 
* Post: A2 points to next 7-segment LED 

	move.b	#32,d0	 trap task to get address of hardware 
	move.b	#0,d1    0 in D1 means display
	trap	#15	 display hardware window 
	move.b	#1,d1    1 in D1 means get address of 7 segment
	trap	#15	 get address of 7-segment display and stores it in D1
	move.l	d1,a4	 A4 = Address of 7-segment display 
	move.b	#2,d1    2 in d1 means get address of LEDS
	trap	#15	 get address of LEDs 
	move.l	d1,a3	 A3 = Address of LEDs 

	move.l a4,a2     Address of 7 segment display needs to be in A2 for segment7 sub routine

*------------ identify the characters load them into D3 one at a time and display them one at a time----------
	move.b	#15,d3	  place the array position in D3 and call segment7 subroutine 12th item which is the char o 
	bsr	segment7
	move.b	#14,d3			12th item which is the char n
	bsr	segment7
	
	move.b	#10,d3			10th item which is the blank char
	bsr	segment7



*------------ end of display characters 

	MOVE.B	#9,D0
	TRAP	#15		; halt simulator

* Variables and Strings

segment7: 
    movem.l d3/a0,-(a7)     save registers 
    lea digits,a0           starting address of bit pattern array table now in A0 
    and.l   #$00ff,d3       we force the top 8 bits of D3 to 0 by anding with #$00ff
    move.b  (a0,d3),(a2)    display digit by placing in A2 the contents of A0 position value in D3 e.g (digits,pos 12)
    adda.l  #2,a2 
    movem.l (a7)+,d3/a0     restore registers 
    rts 
* bit patterns to form digits on readout 
*----------------------------------------------------------- 
*         A 
*       ----- 
*     F|     |B 
*      |  G  | 
*       ----- 
*     E|     |C 
*      |  D  | 
*       -----   .H 
* 
* Bit Number  128  64 32  16 8 4 2 1
* Segment     H    G  F   E  D C B A 


digits: 
    dc.b  $3F           digit 0 63 in decimal 1+2+4+8+16+32 #0
    dc.b  $06           digit 1 #1
    dc.b  $5B           digit 2 #2
    dc.b  $4F           digit 3 #3
    dc.b  $66           digit 4 #4
    dc.b  $6D           digit 5 #5
    dc.b  $7D           digit 6 #6
    dc.b  $07           digit 7 #7
    dc.b  $7F           digit 8 #8
    dc.b  $6F           digit 9 #9
    dc.b  $00           digit off #10
    dc.b  $40           dash #11
    
    dc.b  $79           letter E 121 in decimal pos #12 in the array
    dc.b  $76           letter H 118 in decimal #13
    dc.b  $54		letter n 84 in decimal #14
    dc.b  $5C           letter o 92 in decimal pos #15 in the array


    ds.w  0             force word boundary always the last element in the array of digits


	END	START		; last line of source






*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
