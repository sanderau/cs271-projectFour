; Author: Austin Sanders
; Project Four | CS271	5.8.2017

; I'm not really sure what to call these but they dertermine how the program allocates memory and how much memory goes onto the stack :)
.386
.model flat,stdcall
.stack 4096

;included procedues
ExitProcess proto,dwExitCode:dword
WriteString proto
Crlf proto
ReadInt proto
WriteDec proto

.data

;*******************************************************************************************************************
	;data used for intro
	author BYTE "Austin Sanders.", 0 ; yours truly
	composite BYTE "Composite Numbers      Programmed by ", 0 ; title of program

;*******************************************************************************************************************
	;data used for get range
	range SDWORD ? ; the range of composite numbers, this is entered by the user
	upperLimit DWORD 400 ; upper limit of range
	lowerLimit DWORD 1 ; lower limit of range
	prompt BYTE "Enter the number of composite numbers to display [1, 400]: ", 0 ; prompts the user to enter number
	tooLow BYTE "Too low. Try Again.", 0 ; printed if the user enters a number out of range
	tooHigh BYTE "Too high. Try again", 0 ; printed if the user enters a number out of range

;*******************************************************************************************************************
	; all of the data used by printComposite

.code
main proc
	
	call intro		
	call getRange	
	call printComposite	

	invoke ExitProcess,0
main endp

;*******************************************************************************************************************


intro PROC
	mov edx, OFFSET composite
	call WriteString

	mov edx, OFFSET author
	call WriteString

	call Crlf

	ret
intro ENDP


;*******************************************************************************************************************


getRange PROC
	
	mainLoop:
		mov edx, OFFSET prompt
		call WriteString ; prompt for user input
		
		call ReadInt
		mov range, eax ; get user input

		cmp eax, upperLimit
		jg higher

		mov eax, range
		cmp eax, lowerLimit
		jl lower

		jmp exit



	higher:
			mov edx, OFFSET tooHigh
			call WriteString

			call Crlf
			jmp mainLoop

	lower:
			mov edx, OFFSET tooLow
			call WriteString

			call Crlf
			jmp mainLoop

	exit:


	ret
getRange ENDP

;*******************************************************************************************************************

printComposite PROC


	ret
printComposite ENDP

;*******************************************************************************************************************

end main