	; created By Connor Mallon
	; Simple Premise of Assembly for loop, note: l2 is after l1, does not execute until cmp is satisifed
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
.code

main PROC

	mov dword ptr [ebp-4], 0		; x = 0
	mov dword ptr [ebp-8], 5		; y = 5
	mov eax, [ebp-4]
	mov ebx, [ebp-8]				

	; start of compare

	l1:
	cmp eax, ebx			; 0 == 5
	jge l2					; if eax > ebx, call to l2

	; simple increment
	inc eax
	jmp l1					;Always call back if eax > 


	l2:
		INVOKE ExitProcess, 0		; END 

main endp
end main