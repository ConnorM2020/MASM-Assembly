; MASM test

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
sum DWORD ?
.code
main proc
	mov dword ptr [ebp-4], 0 ; i = 0
	mov dword ptr [ebp-8], 0 ;  j = 0
	jmp l1

	; inside for loop
	l3:					; needs to be placed here so continues looping
						; jump back up to l3 until condition is satified
		mov eax, [ebp-4]	
		add eax, 1			; j = j + i ,where i increments
		mov [ebp-4], eax 

	l1: 
		cmp dword ptr [ebp-4], 10 	; i  < 10 - if (i < 10)
		jge l2		; jump if i > 10, to l2

	mov eax, [ebp-4]
	mov ebx, [ebp-8]
	add ebx, eax
	mov [ebp-8], ebx

	jmp l3
	
	

	l2:
		INVOKE ExitProcess, 0 ; ends once jge ebx, 10: A

main endp
end main
