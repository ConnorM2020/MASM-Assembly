.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
.code

main PROC

	mov dword ptr [ebp-4], 0	; a = 49
	mov dword ptr [ebp-8], 1	; b = 1

	mov eax, [ebp-4]		; eax = a
	add eax, 11
	mov [ebp-4], eax		; a = a + 11

	mov eax, [ebp-4]
	sub eax, [ebp-8]	; x - y
	mov [ebp-4], eax	; x = x + y

	
	mov eax, [ebp-4]
	dec eax
	mov [ebp-4], eax	; a--

	mov eax, [ebp-8]
	inc eax
	mov [ebp-8], eax	; b++

	; now div


						; XOR, MOV ECX, EDX result stored , then store back to [ebp-4]
	xor edx, edx		; first clear with xor
	mov ecx, 3
	div ecx				; stored after here
	mov [ebp-8], edx	; result stored in edx

	mov eax, [ebp-8]

	pop eax
	pop ebx
	pop ecx

	INVOKE ExitProcess, 0

main endp
end main