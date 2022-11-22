.model small
.stack 100H		; Stack size
.data
data1 dw 0000H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code
.startup

MOV BX, 00	

;  Output a string of data, terminated by a $ to the monitor
MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV CX, 4;			; TAKING 4 TIMES INPUT
AGAIN: MOV AH,01 	; LOOP


INT 21H
CMP AL, 'A'		; IF A > AX
JGE P1		; for true
SUB AL, 30H
JMP P4		; for false


P1: SUB AL,37H
P4: SHL BX,4		; shift left
MOV AH, 00
ADD BX, AX
LOOP AGAIN

MOV data1, BX

MOV AH, 09
MOV DX, OFFSET msg1
INT 21H

MOV CX, 4
AGAIN2: MOV AH, 01
INT 21H

CMP AL, 'A'	; if A > AX
JG P2		; for true JGE: jump if greater or equal
SUB AL, 30H
JMP P3	; for false
MOV AH, 00
P2: SUB AL, 37H
P3: SHL BX, 4	; shift left
MOV AH, 00
ADD BX, AX
LOOP AGAIN2

ADD BX, data1

MOV AH, 09
MOV DX, OFFSET msg2
INT 21H

MOV DX, 00
MOV CX, 4 		;print 2-digit
AGAIN3: ROL BX,4
	MOV DL, BL
	AND DL, 0FH
	CMP DL, 09
	JGE L6
	ADD DL, 30H

JMP L7

L6: ADD DL, 37H

L7: MOV AH, 02
INT 21H
LOOP AGAIN3

.exit
end	   







