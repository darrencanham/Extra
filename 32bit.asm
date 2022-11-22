.model small    
.stack 100H     ;stack size 
.data   
data1 dw 0000H        
msg db 10,13,"Enter the first number::$"     ;db:define byte
msg1 db 10,13,"Enter the second number::$"
msg2 db 10,13,"The Resultant sum is::$"

.code
.startup

MOV BX,00  ;TURNED TO ZERO FROM REWRITING

MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV CX,8    ;TAKING 4 TIMES INPUT
AGAIN:MOV AH,01  ;LOOP

INT 21H
CMP  AL, 'A'    ;IF A>AX
JGE P1        ;FOR TRUE
SUB AL,30H
JMP P4        ;FOR FALSE
   
P1:SUB AL,37H
P4:SHL BX,4 ;shift left
MOV AH,00
ADD BX,AX
LOOP AGAIN

MOV data1,BX

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV CX,8    ;TAKING 4 TIMES INPUT
AGAIN2:MOV AH,01  ;LOOP
INT 21H
CMP  AL,'A'   ;IF A>AX
JG P2        ;FOR TRUE JGE:jump if greater or equal
SUB AL,30H
JMP P3        ;FOR FALSE 
;MOV AH,00  
P2:SUB AL,37H
P3:SHL BX,4    ;shift left
MOV AH,00
ADD BX,AX
LOOP AGAIN2

ADD BX,data1

MOV  AH,09
MOV DX,OFFSET msg2
INT 21H

MOV DX,00
MOV CX,8 ;PRINT 2-DIGIT
AGAIN3: ROL BX,4
           MOV DL,BL
           AND DL,0FH
           CMP DL,09
           JGE L6
           ADD DL,30H
JMP L7

L6:ADD DL,37H

L7:MOV AH,02
INT 21H
LOOP AGAIN3

.exit
end