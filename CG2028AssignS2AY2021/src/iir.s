.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	iir
 	.thumb_func

@ CG2028 Assignment, Sem 2, AY 2020/21
@ (c) CG2028 Teaching Team, ECE NUS, 2021

@Register map
@R0 - N, returns y
@R1 - b
@R2 - a
@R3 - x_n
@R4 - <use(s)>
@R5 - <use(s)>
@....

iir:
@ PUSH / save (only those) registers which are modified by your function
@ parameter registers need not be saved.
PUSH {R4 - R12}

@ write asm function body here

LDR R4, [R1], #4
MUL R4, R3, R4 //y_n = x_n * b[0]
LDR R5, [R2], #4
SDIV R4, R4, R5 //y_n = y_n/a[0]

LDR R6, =x_store
LDR R7, =y_store

SUB R9, R0, #1 //N-1 TO R3

loop:
	LDR R8, [R1], #4 //b[j+1], j++
	LDR R11, [R6], #4 //x_store[j], j++
	MUL R8, R8, R11 // b[j+1]*x_store[j]
	LDR R10, [R2], #4 //a[j+1], j++
	LDR R12, [R7], #4 //y_store[j], j++
	MLS R8, R10, R12, R8 //b[j+1]*x_store[j]-a[j+1]*x_store[j]
	SDIV R8, R8, R5 // R8/a[0]
	ADD R4, R8 //y_n+=R8
	SUBS R0, #1
	BGT loop

SUBS R6, #4
SUBS R7, #4

loop2:
	LDR R11, [R6, #-4]
	STR R11, [R6], #-4
	LDR R12, [R7, #-4]
	STR R12, [R7], #-4
	SUBS R9, #1
	BNE loop2

@LDR R6, =x_store
@LDR R7, =y_store

STR R3, [R6]
STR R4, [R7]

MOV R12, #100
SDIV R4, R4, R12

MOV R0, R4

@ POP / restore original register values. DO NOT save or restore R0. Why?
POP {R4 - R12}

@ return to C program
		BX	LR

@label: .word value
.equ N_MAX, 10
@.lcomm label num_bytes
.lcomm x_store 4*N_MAX
.lcomm y_store 4*N_MAX
