	; created By Connor Mallon
	; EBX = current pointer while y < n
	; EAX = Value stored - 800HEX = 2048 Decimal, check value throughout
	; ECX = R value stored  (3) r(+1) =  p = p * (4)
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
.code

main PROC
	
	mov dword ptr [ebp-4], 2		; p =2
	mov dword ptr [ebp-8], 3		; r = 3
	mov dword ptr [ebp-12], 5		; n = 5
	mov dword ptr [ebp-10h], 1		; y = 1

	mov eax, [ebp-10h]		; eax = y
	mov ebx, 0				; clear ebx

	l1:								; start of while loop, always call back
	cmp ebx, dword ptr [ebp-12]		; while y <= n
	jg	l2							; jump to l2 if y > n

	mov ecx, [ebp-8]
	add ecx, 1			; (r+1)		by using add, ecx value is not altered

	mov eax, [ebp-4]				; add eax, ecx, then mov to eax

	mul ecx				; mul eax, ecx
	mov [ebp-4], eax	; store result to p

	; increment y now
	mov ebx, [ebp-10h]
	inc ebx
	mov [ebp-10h], ebx	; y++
	jmp l1				; continue looping if condition not met

	l2:
	INVOKE ExitProcess, 0

main endp
end main
