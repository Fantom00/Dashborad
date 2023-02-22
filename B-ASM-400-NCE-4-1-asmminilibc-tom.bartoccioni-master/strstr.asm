section .text
global strstr

strstr:
            mov RCX, -1                 ; i = -1
            
_loop:
            inc RCX                     ; i++
            mov AL, BYTE [RDI + RCX]    ; AL = RDI + 1
            cmp BYTE [RSI], AL          ; compare arg2 with AL
            je _init_loop2              ; if avant == 0 -> _loop2
            cmp AL, 0                   ; compare AL with 0
            jne _loop                   ; if avant != 0 -> _loop

_break:
            mov RAX, RDI                ; RAX = arg1
            add RAX, RCX                ; RAX + i
            ret                         ; return RAX

_init_loop2:
            mov RDX, 0                  ; j = 0
            mov RBX, RDI                ; RBX = i
            add RBX, RCX                ; RBX + RCX

_loop2:
            inc RDX                     ; j++
            cmp BYTE [RSI + RDX], 0     ; compare *(arg2 + j) with \0
            je _break                   ; if avant == 0 -> _break
            mov AL, BYTE [RBX + RDX]    ; AL = arg1 + i + j
            cmp BYTE [RSI + RDX], AL    ; compare *(arg2 + j) with AL
            jne _loop                   ; if avant != 0 -> _loop
            jmp _loop2                  ; jump in _loop2