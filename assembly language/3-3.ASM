DATA SEGMENT
grade DW 85,86,87,81,82,83,84,88,89,90  ; 5,6,7,1,2,3,4,8,9,a
rank DW 10 DUP(?)
DATA ENDS
STACK SEGMENT STACK
DB 100 DUP(?)
STACK ENDS
CODE SEGMENT
	ASSUME CS:CODE,DS:DATA,SS:STACK
START:MOV AX,DATA
MOV DS,AX
MOV CX,10
MOV DX,0  
XOR BX,BX
LEA SI,grade
CCC:
MOV AX,grade[BX]
PUSH CX
MOV CX,10
SSS:
CMP AX,[SI]
JA JMM
INC DX ;若si大则计数加一
JMM: ADD SI,2
LOOP SSS
POP CX
MOV rank[BX],DX
MOV DX,0
ADD BX,2
LEA SI,grade
LOOP CCC

MOV AH,4CH
INT 21H
CODE ENDS
END START