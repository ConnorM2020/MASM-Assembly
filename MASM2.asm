; MASMtest

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
sum DWORD ?
.code

main proc

    mov dword ptr[ebp-4], 0 ; mov x into eax register
    mov dword ptr[ebp-8], 1 ; mov y into ebx register
    mov dword ptr[ebp-12] , 2 ;  0-Ch      :12
    

    mov eax, [ebp-4]  ; mov into eax temp
    mov ebx, [ebp-8]  ; to compare eax == ebx

    cmp eax, ebx
    jnz l21            ; jump to l2 if Zf = 0

    ; note: not set into a register
    cmp dword ptr [ebp-12], 0 ;compare  if = 0
    jnz l21
    
    mov eax, [ebp-12]       ; z = eax[ebp-12]
    add eax, [ebp-8]
    mov [ebp-12], eax       ; z = z + y
    jmp l1

    l21:
    mov eax, [ebp-8]    ; z
    sub eax, [ebp-12]   ; y - z
    mov [ebp-12], eax   ; z  = y - z
   
    l2:
    cmp dword ptr [ebp-12], 0 ; if(z == 0) zf = 1
    add eax, [ebp-4]
    mov [ebp-12], eax
    jmp l1              ; jump to l1

    l22:
    mov eax, [ebp-4]        ; eax = x
    sub eax, [ebp-12]       ; x - z
    mov [ebp12], eax        ; z = x - y

    l1:
    INVOKE ExitProcess, 0


main endp
end main