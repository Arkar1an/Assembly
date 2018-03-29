TITLE Homework #5		(Homework 5 code.asm)

; Russell Richardson
; Visual Studio 2015
; This program performs calculations such as:
; calculating MPG
; max distance you can travel
; gallons required for a trip

; I did not end up using the output containers you specified in
; the assignment since all MUL and DIV answers end up in EAX and
; ReadInt uses EAX for output. It seemed tedious to MOV output to
; a location in memory that would never be used or would get
; overwritten in the next loop cycle.

INCLUDE Irvine32.inc

.data
gals DWORD ?
miles DWORD ?
mpg DWORD ?
input BYTE ?

menuLine1 BYTE "M - Calculate the actual miles per gallon or MPG",0dh,0ah,0
menuLine2 BYTE "D - Calculate the max distance you can travel",0dh,0ah,0
menuLine3 BYTE "G - Calculate the gallons required for a trip",0dh,0ah,0
menuLine4 BYTE "Q - Quit the program",0dh,0ah,0
menuLine5 BYTE "Choose M, D, G, or Q: ",0dh,0ah,0

query1 BYTE "Enter miles: ",0
query2 BYTE "Enter gallons: ",0
query3 BYTE "Enter MPG: ",0

answer1 BYTE "Miles per gallon: ",0
answer2 BYTE "Max distance: ",0
answer3 BYTE "Gallons required: ",0

easyReturn BYTE 0dh,0ah,0

.code
main PROC
	
	L1:				; this will print the menu and read input
		
		xor		edx,edx
		mov		edx,OFFSET menuLine1
		call	WriteString
		mov		edx,OFFSET menuLine2
        call	WriteString
		mov		edx,OFFSET menuLine3
        call	WriteString
		mov		edx,OFFSET menuLine4
        call	WriteString
		mov		edx,OFFSET menuLine5
        call	WriteString
		call	ReadChar
		mov		input, al
	
		cmp		input,'m'
		je		L2
		cmp		input,'d'
		je		L3
		cmp		input,'g'
		je		L4
		cmp		input,'q'
		je		L5

	L2:				; (m) this will calculate MPG given miles and gallons
		xor		edx,edx
		mov		edx,OFFSET query1
		call	WriteString
		call	ReadInt
		mov		miles,eax

		mov		edx,OFFSET query2
		call	WriteString
		call	ReadInt
		mov		gals,eax

		mov		eax,miles
		mov		edx,0
		div		gals
		
		mov		edx, OFFSET answer1
		call	WriteString
		call	WriteInt
		mov		edx,OFFSET easyReturn
		call	WriteString

		call	WaitMsg
		call	Clrscr
		jmp L1		; jumps back to menu
	
	L3:				; (d) this will calculate max distance given gallons and MPG
		xor		edx,edx
		mov		edx,OFFSET query2
		call	WriteString
		call	ReadInt
		mov		gals, eax
		
		mov		edx,OFFSET query3
		call	WriteString
		call	ReadInt
		mov		mpg, eax

		mov		eax, gals
		mov		edx, 0
		mul		mpg

		mov		edx, OFFSET answer2
		call	WriteString
		call	WriteInt
		mov		edx, OFFSET easyReturn
		call	WriteString

		call WaitMsg
		call Clrscr
		jmp L1		; jumps back to menu
	
	L4:				; (g) this will calculate gallons for given distance and MPG
		xor		edx,edx
		mov		edx,OFFSET query1
		call	WriteString
		call	ReadInt
		mov		miles, eax
		
		mov		edx,OFFSET query3
		call	WriteString
		call	ReadInt
		mov		mpg, eax

		mov		eax, miles
		mov		edx, 0
		div		mpg

		mov		edx, OFFSET answer1
		call	WriteString
		call	WriteInt
		mov		edx, OFFSET easyReturn
		call	WriteString

		call WaitMsg
		call Clrscr
		jmp L1		; jumps back to menu

	L5:				; exits loop if user enters "q"

	call WaitMsg
	exit
main ENDP
END main