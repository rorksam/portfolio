#include "reg9s12.h"
G3	equ	7653	; delay count to generate G3 note (with prescaler=8)
A3F	equ	7212
A3	equ	6818	; delay count to generate A3 note
A3S	equ	6435	; delay count to generate A3S (sharp) note
B3	equ	6074	; delay count to generate B3 note 
C4 	equ	5733	; delay count to generate C4 note 
C4S	equ	5412	; delay count to generate C4S (sharp) note
D4 	equ	5108	; delay count to generate D4 note 
D4S	equ	4821
E4 	equ	4551	; delay count to generate E4 note 
F4 	equ	4295	; delay count to generate F4 note 
F4S	equ	4054	; delay count to generate F4S note 
G4 	equ	3827	; delay count to generate G4 note 
G4S	equ	3611	; g4 sharp
A4 	equ	3409	; delay count to generate A4 note 
B4F 	equ	3218	; delay count to generate B4F note 
A4S	equ	3218
B4	equ	3037	; delay count to generate B4 note 
C5 	equ	2867	; delay count to generate C5 note 
C5S	equ	2706
D5 	equ	2554	; delay count to generate D5 note 
D5S	equ	2410
E5 	equ	2275	; delay count to generate E5 note 
E5S	equ	2148
F5 	equ	2148	; delay count to generate F5 note
F5S	equ	2027
G5	equ	1913
G5S	equ	1806
A5	equ	1705
B5	equ	1518
C6S	equ	1353
D6	equ	1277
E6	equ	1137
ZZ	equ	20	; delay count to generate an inaudible sound
R1	equ	$1001
R2	equ	$1002
R3	equ	$1003

notes1	equ	54
notes2	equ	218
notes3	equ	22

	org	$1000
delayCNT ds.w	1	; store the delay for OC operation
ip	ds.b	1	; store the remaining num of notes
rep_cnt	ds.b	1	; store the num times repeated


	org	$2000	 	
	lds	#$2000 
	;temp program setup
	movb	#$FF,DDRB	; set PTB as output for LEDs
	movb	#$FF,DDRJ	; set PTJ as output (in Dragon12+) 
	movb	#$00,PTJ		; PTJ1=0 to allow the LEDs
	movb	#$80,ATD0CTL2	 
	jsr	delay	
	movb	#$08,ATD0CTL3	; 8-bit resolution, 16-clock for 2nd stage
	movb	#$EB,ATD0CTL4	; conversion frequency = 1MHz  

H1 	movb	#$05,ATD0CTL5	; chan 5 of ATD0 (use left-justified) 

H2	brclr	ATD0STAT,$80,H2	; 
	ldaa	ADR00H		; get the ADC result
	staa 	$1004  

		; keep reading the ADC
	;song program setup
	movw	#oc5isr,$3E64	; set the interrupt vector
	movb  	#$90,TSCR 	; enable TCNT, fast timer flag clear
	movb  	#$03,TMSK2 	; set main timer prescaler to 8
	bset  	TIOS,$20   	; enable OC5
	movb 	#$04,TCTL1 	; select toggle for OC5 pin action
	cmpa	#$0D
	blo	ps1
	beq	ps2
	lbra	ps3

delay	psha			; 1 msec delay = (1/24MHz)x1x240x10
	ldaa	#1		
	staa	R3		
L3	ldaa	#1 		
	staa	R2
L2	ldaa	#240
	staa	R1
L1	nop			; 1 E cycle
	nop			;  
	nop			;  
	dec	R1		; 4 E cycles
	bne	L1		; 3 E cycles 
	dec	R2		; total = 10 E cycles
	bne	L2
	dec	R3
	bne	L3
	pula			 
	rts	

ps1	ldx	#song1		; use as a pointer to score table
	ldy	#duration1	; points to duration table
	movb	#1,rep_cnt	; play the song twice
	movb	#notes1,ip	; set up the note counter 
	movw	2,x+,delayCNT	; start with zeroth note 
	ldd	TCNT		; play the first note
	addd	delayCNT		; "
	std	TC5		; "
	bset  	TIE,$20     	; enable OC5 interrupt
	cli                 	;       "
	
forever1 	pshy			; save duration table pointer in stack
	ldy   	0,y      	; get the duration of the current note
	jsr   	d10ms   		; play the note for ?duration x 10ms?
	puly			; get the duration pointer from stack
	iny			; move the duration pointer
	iny			; "
	ldd	2,x+		; get the next note, move pointer
	std	delayCNT		; "
	dec	ip		; if not the last note, play again
	bne	forever1		;
	dec	rep_cnt		; check how many times left to play song
	lbeq	done		; if not finish playing, re-start from 1st note
	ldx	#song1		; pointers and loop count
	ldy	#duration1	; "
	movb	#notes1,ip	; "
	movw	0,x,delayCNT	; get the first note delay count
	ldd	TCNT		; play the first note
	addd	#delayCNT		; "
	std	TC5
	bra   	forever1

ps2	ldx	#song2		; use as a pointer to score table
	ldy	#duration2	; points to duration table
	movb	#1,rep_cnt	; play the song twice
	movb	#notes2,ip	; set up the note counter 
	movw	2,x+,delayCNT	; start with zeroth note 
	ldd	TCNT		; play the first note
	addd	delayCNT		; "
	std	TC5		; "
	bset  	TIE,$20     	; enable OC5 interrupt
	cli                 	;       "
	
forever2 	pshy			; save duration table pointer in stack
	ldy   	0,y      	; get the duration of the current note
	jsr   	d10ms   		; play the note for ?duration x 10ms?
	puly			; get the duration pointer from stack
	iny			; move the duration pointer
	iny			; "
	ldd	2,x+		; get the next note, move pointer
	std	delayCNT		; "
	dec	ip		; if not the last note, play again
	bne	forever2		;
	dec	rep_cnt		; check how many times left to play song
	lbeq	done		; if not finish playing, re-start from 1st note
	ldx	#song2		; pointers and loop count
	ldy	#duration2	; "
	movb	#notes2,ip	; "
	movw	0,x,delayCNT	; get the first note delay count
	ldd	TCNT		; play the first note
	addd	#delayCNT		; "
	std	TC5
	bra   	forever2


ps3	ldx	#song3		; use as a pointer to score table
	ldy	#duration3	; points to duration table
	movb	#1,rep_cnt	; play the song twice
	movb	#notes3,ip	; set up the note counter 
	movw	2,x+,delayCNT	; start with zeroth note 
	ldd	TCNT		; play the first note
	addd	delayCNT		; "
	std	TC5		; "
	bset  	TIE,$20     	; enable OC5 interrupt
	cli                 	;       "
	
forever3 	pshy			; save duration table pointer in stack
	ldy   	0,y      	; get the duration of the current note
	jsr   	d10ms   		; play the note for ?duration x 10ms?
	puly			; get the duration pointer from stack
	iny			; move the duration pointer
	iny			; "
	ldd	2,x+		; get the next note, move pointer
	std	delayCNT		; "
	dec	ip		; if not the last note, play again
	bne	forever3		;
	dec	rep_cnt		; check how many times left to play song
	lbeq	done		; if not finish playing, re-start from 1st note
	ldx	#song3		; pointers and loop count
	ldy	#duration3	; "
	movb	#notes3,ip	; "
	movw	0,x,delayCNT	; get the first note delay count
	ldd	TCNT		; play the first note
	addd	#delayCNT		; "
	std	TC5
	bra   	forever3


			
done	swi

oc5isr 	ldd   	TC5		; restart the OC function
	addd  	delayCNT
	std   	TC5
	rti

; Create a time delay of 10ms Y times (prescaler =8)
d10ms	bset	TIOS,$01		; enable OC0
	ldd 	TCNT
again1	addd	#30000		; start an output-compare operation
	std	TC0		; for 10 ms time delay
	brclr	TFLG1,$01,*
	ldd	TC0
	dbne	y,again1
	rts

; store the notes of the whole song
song1	dc.w	D4,ZZ,D4,ZZ,D4,ZZ,D4,ZZ,D4,B3,D4,ZZ,D4,ZZ,D4,ZZ,D4,ZZ,D4,ZZ,D4,C4,D4,ZZ,D4,F4S,ZZ,F4S,ZZ,F4S,E4,E4,D4,ZZ,D4,ZZ,D4,C4,C4,B3,ZZ,B3,ZZ,B3,ZZ,B3,A3,ZZ,A3,ZZ,A3,ZZ,A3,G3
	
; each number is multiplied by 10 ms to give the duration of the corresponding note
duration1	dc.w	30,3,10,3,100,3,30,3,10,40,80,3,30,3,10,3,100,3,30,3,10,40,80,3,10,30,3,10,3,20,80,20,30,3,10,3,20,80,20,30,3,10,3,30,3,10,30,3,10,3,30,3,10,160


; store the notes of the whole song
song2	dc.w	A3,D4,F4S,G4,F4S,ZZ,F4S,A3,D4,F4S,G4,F4S,E4,A4,D4 ;15 notes
	dc.w	ZZ,A3,B3,C4S,D4,D4S,F4S,D4S,F4S,E4,ZZ,C4,D4,D4S,E4,F4S,A4,F4S,A4,G4 ;20 notes
	dc.w	ZZ,E4,F4S,G4,A4,A4S,C5S,B4,A4S,B4,C5S,E5,D5,C5S,D5,B4,G4,F4S ;18
	dc.w	E4,D4S,D4,C4S,B3,A3S ;6
	dc.w	A3,D4,F4S,G4,F4S,ZZ,F4S,A3,D4,F4S,G4,F4S,E4,A4,D4 ;15 notes
	dc.w	ZZ,D4,E4,F4S,G4S,A4,B4,G4S,B4,A4,ZZ,G4,G4S,A4,B4,C5S,D5,C5,D5,C5S ; 20 notes
	dc.w	ZZ,C5,C5S,D5S,E5S,F5S,G5S,A5,E5S,G5S,F5S,A5,E5S,G5S,F5S,A5,F5S,A5,F5S,A5,F5S,A5,E5S,F5S,A4S,B4,C5S,D5,E5 ;29 (30?) notes

	dc.w	F5S,C5S,E5,B4,D5,C6S,D6,C6S,B5,ZZ,C6S,ZZ,G5,D5,F5S,C5S,E5,D6,E6,D6,C6S,ZZ,D6,ZZ ;24 notes
	dc.w	F5S,C5S,E5,B4,D5,C6S,D6,C6S,B5,ZZ,C6S,ZZ ;12 NOTES
	dc.w	G5,D5,G5,D5,G5,E5,A5,A4,B4,C5S,D5,E5 ; 12 NOTES

	dc.w	F5S,C5S,E5,B4,D5,C6S,D6,C6S,B5,ZZ,C6S,ZZ,G5,D5,F5S,C5S,E5,D6,E6,D6,C6S,ZZ,D6,ZZ ;24 notes
	dc.w	F5S,C5S,E5,B4,D5,C6S,D6,C6S,B5,ZZ,C6S,ZZ ;12 NOTES
	dc.w	B5,A5,B5,A5,C6S,ZZ,G5,A5,B5,C6S,D6 ;11 notes


; each number is multiplied by 10 ms to give the duration of the corresponding note
duration2	dc.w 40,40,40,90,10,3,240,40,40,40,40,60,20,80,40
	dc.w	40,20,20,20,20,20,20,20,20,40,40,20,20,20,20,20,20,20,20,40
	dc.w	40,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,80
	dc.w	60,20,20,20,20,20
	dc.w 	40,40,40,90,10,3,240,40,40,40,40,60,20,80,40
	dc.w	40,20,20,20,20,20,20,20,20,40,40,20,20,20,20,20,20,20,20,40
	dc.w	40,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20,20

	dc.w	80,40,80,40,120,13,13,13,20,20,20,20,80,40,80,40,120,13,13,13,20,20,20,20
	dc.w	80,40,80,40,120,13,13,13,20,20,20,20
	dc.w	80,40,80,40,80,40,20,20,20,20,20,20

	dc.w	80,40,80,40,120,13,13,13,20,20,20,20,80,40,80,40,120,13,13,13,20,20,20,20
	dc.w	80,40,80,40,120,13,13,13,20,20,20,20
	dc.w	80,40,80,40,20,20,20,20,20,20,20


; store the notes of the whole song
song3	dc.w	D4,B4,A4,B4,D4,ZZ,D4,C4S,E4,B4,A4,C4S,E4,B4,A4,G4,A4,B4,D4,C4S,C4,B3
       ;dc.w	20,30,10,20,40,3 ,20,30 ,10,20,100,30,10,20,40,20,40,40,40,40,40,40
; each number is multiplied by 10 ms to give the duration of the corresponding note
duration3	dc.w	20,30,10,20,40,3,20,30,10,20,100,30,10,20,40,20,40,40,40,40,40,40



	end
