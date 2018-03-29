TITLE Homework #3		(Homework 3 code.asm)

; Russell Richardson
; Visual Studio 2015
; This program switches contents of an array
; starting with the 1st and 2nd elements, then
; the 3rd and 4th elements, etc.

INCLUDE Irvine32.inc

.data

dwarray DWORD	0, 2, 5, 9, 10, 12

.code
main PROC

	mov	esi, OFFSET dwarray			; address space of first element in dwarray
	mov edi, OFFSET dwarray
	add edi, 4						; address space of next element in dwarray
	mov ecx, LENGTHOF dwarray / 2	; 3
	mov ebx, TYPE dwarray			; 4

L1:
	mov eax, [esi]
	mov edx, [edi]

	mov [esi], edx
	mov [edi], eax

	add esi, ebx
	add esi, ebx

	add edi, ebx
	add edi, ebx

	LOOP L1

	mov	esi, OFFSET dwarray
	mov ecx, LENGTHOF dwarray
	mov ebx, TYPE dwarray

	call DumpMem
	call DumpRegs
	call WaitMsg
	exit
main ENDP
END main