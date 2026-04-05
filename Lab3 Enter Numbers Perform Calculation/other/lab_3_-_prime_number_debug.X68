*-----------------------------------------------------------
* Program    : Determines if number is prime
*-----------------------------------------------------------
START	ORG	$1000
  REPEAT					; REPEAT - UNTIL loop
    * prompt for input
	lea prompt,A1
	move.b	#14,D0
	trap 	#15

	* get number from user into D7
	move.b	#4,D0
	trap	#15
	move.l	d1,d7
	
	sub.l	#1,d1			; number - 1

	* D2 is loop counter
	FOR.L d2 = #2 TO d1 DO	; FOR loop
	  
	  * D3 is sum
	  clr.l d3

	  WHILE.L d3 <LT> d7 DO	; WHILE loop
	    add.L d2,d3
	  ENDW

	  IF.L d3 <EQ> d7 THEN	; IF statement
	    *not prime
		lea notPrime,A1
		move.b	#13,D0
		trap 	#15
		bra cont			; break
	  ENDI
	ENDF
	* is prime
	lea isPrime,A1
	move.b	#13,D0
	trap 	#15

cont
 	* continue Y/N? 
    lea continue,A1
    move.b	#14,d0
    trap 	#15
	* get user choice
	move.b	#5,d0
	trap	#15

  UNTIL.B D1 <EQ> #'N' OR.B D1 <EQ> #'n' DO

	MOVE.B	#9,D0
	TRAP	#15		Halt Simulator

CR	EQU		$D
LF	EQU		$A
prompt		dc.b	CR,LF,'Enter number to test for prime: ',0
notPrime 	dc.b	'Number is NOT Prime.',0
isPrime 	dc.b	'Number is Prime.',0
continue 	dc.b	'Continue Y/N? ',0
	END	START


*~Font name~Courier New~
*~Font size~12~
*~Tab type~1~
*~Tab size~4~
