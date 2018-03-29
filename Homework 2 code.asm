TITLE Homework #2		(Homework 2 code.asm)

; Russell Richardson
; This program adds and subtracts
; using three general purpose registers

INCLUDE Irvine32.inc

.data

.code
main PROC
	xor		eax, eax	;clears the eax register
	mov		ebx, 200h	;puts 200h into ebx
	mov		edx, 5h		;puts 5h into edx
	add		eax, ebx	;adds 200h to eax
	sub		eax, edx	;subtracts 5h from eax

	call DumpRegs
	call WaitMsg
	exit
main ENDP
END main