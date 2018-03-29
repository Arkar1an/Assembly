TITLE Homework #6		(Homework 6 code.asm)

; Russell Richardson
; Visual Studio 2015
; This program inputs a line of text to a buffer and then determines
; the number of chars of a-z, A-Z, and 0-9.

INCLUDE Irvine32.inc

.data

inputSize = 132
charInput BYTE inputSize+1 DUP(?)
charCount BYTE 123 DUP(0)

menuLine1 BYTE "Enter up to 132 characters: ",0

easyReturn BYTE 0dh,0ah,0
format BYTE " - ",0

.code
main PROC
		
	xor		edx,edx
	mov		edx, OFFSET menuLine1
	call	WriteString

	mov		edx, OFFSET charInput
	mov		ecx, inputSize		; buffer size - 1
	call	ReadString			; charInput now has user input
	mov		ecx, LENGTHOF charInput 
	mov		edi, OFFSET charInput

	L1:
		mov		al, [edi]
		cmp		al,0
		je		PART2 ; this jumps to printing if the null character is found
		cmp		al,48
		jb		L2
		cmp		al,122
		ja		L2

		movzx	esi,al
		add		charCount[esi],1

		L2:
		inc		edi
		loop	L1
		
	PART2:

		mov		ecx, 10 ; for numbers 0 - 9
		mov		edi, OFFSET charCount
		add		edi, 48 ; sets offset to location ASCII "0" in charCount array
		mov		bl, 48	; bl will be used to print ASCII char

		L3: ; L3 prints out the decimal numbers 0-9
			
			mov		al,[edi]
			cmp		al,0
			je		continue1 ; skips printing if no chars were counted

			xor		eax, eax
			mov		al, bl
			call	WriteChar ; this prints the character being counted
			
			xor		edx, edx
			mov		edx, OFFSET format
			call	WriteString ; this prints " - " for formatting
			
			xor		eax, eax
			mov		al, [edi]
			call	WriteDec ; this prints the number of times the number appeared
			
			xor		edx, edx
			mov		edx, OFFSET easyReturn
			call	WriteString
		
			continue1:
			inc		bl
			inc		edi

			loop L3

		xor		edx, edx
		mov		edx, OFFSET easyReturn
		call	WriteString ; this is to make output look pretty

		mov		ecx, 26 ; for letters A - Z
		add		edi, 7  ; sets offset to location ASCII "A" in charCount
		mov		bl, 65

		L4 : ; L4 prints out letters A - Z
			mov		al, [edi]
			cmp		al, 0
			je		continue2 ; skips printing if no chars were counted

			xor		eax, eax
			mov		al, bl
			call	WriteChar ; this prints the character being counted

			xor		edx, edx
			mov		edx, OFFSET format
			call	WriteString ; this prints " - " for formatting

			xor		eax, eax
			mov		al, [edi]
			call	WriteDec ; this prints the number of times the letter appeared

			xor		edx, edx
			mov		edx, OFFSET easyReturn
			call	WriteString

			continue2:
			inc		bl
			inc		edi

			loop L4

		xor		edx, edx
		mov		edx, OFFSET easyReturn
		call	WriteString ; this is to make output look pretty

		mov		ecx, 26 ; for letters a - z
		add		edi, 6  ; sets offset to location ASCII "a" in charCount
		mov		bl, 97

		L5: ; L5 prints out letters a - z
				
			mov		al, [edi]
			cmp		al, 0
			je		continue3; skips printing if no chars were counted

			xor		eax, eax
			mov		al, bl
			call	WriteChar ; this prints the character being counted

			xor		edx, edx
			mov		edx, OFFSET format
			call	WriteString ; this prints " - " for formatting

			xor		eax, eax
			mov		al, [edi]
			call	WriteDec ; this prints the number of times the letter appeared

			xor		edx, edx
			mov		edx, OFFSET easyReturn
			call	WriteString

			continue3:
			inc		bl
			inc		edi

			loop L5

	call WaitMsg
	exit
main ENDP
END main