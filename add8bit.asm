.model small
.stack 100H

.data
data1 db 00H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code
.startup

MOV BL, 00

MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV CX, 2
AGAIN: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P1
SUB AL,30H
JMP P4
P1: SUB AL, 37H
P4: SHL BL, 4
ADD BL, AL
LOOP AGAIN

MOV data1, BL

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV CX, 2
AGAIN2: MOV AH, 01
INT 21H

CMP AL, 'A'
JGE P2
SUB AL,30H
JMP P3
P2: SUB AL, 37H
P3: SHL BL, 4
ADD BL,AL
LOOP AGAIN2

ADD BL, data1

MOV AH,09
MOV DX,OFFSET msg2
INT 21H

MOV DL, 00
MOV CX, 2
AGAIN3: ROL BL, 4
		MOV DL,BL
		AND DL, 0FH
		CMP DL, 09
		JG L6
		ADD DL,30H
JMP L7

L6: ADD DL, 37H

L7: MOV AH,02
INT 21H
LOOP AGAIN3

MOV AH, 4CH
INT 21H
.exit
end
