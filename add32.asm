.model small
.stack 100H
.386

.data
data1 dd 00H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code
.startup
MOV EBX, 00000000

MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV ECX, 8
AGAIN: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P1
SUB AL,30H
JMP P4
P1: SUB AL, 37H
P4: SHL EBX, 4
MOV AH,00
ADD EBX, EAX
LOOP AGAIN

MOV data1, EBX
MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV ECX, 8
AGAIN2: MOV AH, 01
INT 21H
CMP AL, 'A'
JGE P2
SUB AL,30H
JMP P3
P2: SUB AL, 37H
P3: SHL EBX, 4
MOV AH,00
ADD EBX,EAX
LOOP AGAIN2 

ADD EBX, data1
MOV AH,09
MOV DX,OFFSET msg2
INT 21H

MOV DX, 00
MOV ECX, 8

AGAIN3: ROL EBX, 4
MOV EDX,EBX
AND DX, 0FH
CMP DX, 09
JG L6
ADD DX,30H
JMP L7
L6: ADD DX, 37H
L7: MOV AH,02
INT 21H
LOOP AGAIN3

MOV AH, 4CH
INT 21H
.exit
end