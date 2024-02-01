
; MASMtest

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
sum DWORD ?
.code 

main proc
	mov dword ptr [ebp-4], 11 ; int a = 11
	mov dword ptr [ebp-8], 3 ; int b = 3
	
	; move into specific registers 
	mov eax,  [ebp-4]
	add eax, [ebp-8]
	mov [ebp-4], eax ; store back to a: a = a + b


	mov ecx, [ebp-4] ; ebp-4 : a
	sub ecx,[ebp-8] ; ebp-8: b
	mov [ebp-4], ecx

	; increment and decrement a, b
	mov eax, [ebp-4]
	inc eax			; a++
	mov [ebp-4], eax 

	; decrement b
	mov ebx, [ebp-8]
	dec ebx
	mov [ebp-8], ebx

	; ecx :  a MUL
	mov eax, [ebp-4] ; mov a into eax
	mov ecx, 2 ; mov 2 into ecx ... eax * ecx : 
	mul ecx
	mov [ebp-4], ecx ; a =  a * 2



	; div works different
	; first clear the edx register and store result from edx, from: ecx
	mov edx, 0 ; clear the dex dividend register
	mov eax, [ebp-4]
	mov ecx, 3
	div ecx
	mov [ebp-8], edx  ; edx is the divident register for the modulus operator

main endp
end main