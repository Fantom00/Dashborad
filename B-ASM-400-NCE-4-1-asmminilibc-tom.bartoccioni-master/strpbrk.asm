section .text
global strpbrk

strpbrk:
            mov RCX, -1                 ; i = -1
            
_loop:
            inc RCX                     ; i++
            mov AL, BYTE [RDI + RCX]    ; AL = RDI + i
            cmp AL, 0                   ; compare AL with \0
            je _break                   ; if avant == 0 -> _break
            jmp _init_loop2             ; if avant == 0 -> _loop2

_break:
            mov RAX, RDI                ; RAX = arg1
            add RAX, RCX                ; RAX + i
            ret                         ; return RAX

_init_loop2:
            mov RDX, -1                 ; j = -1
            mov RBX, RDI                ; RBX = arg1
            add RBX, RCX                ; RBX + i

_loop2:
            inc RDX                     ; j++
            mov AL, BYTE [RSI + RDX]    ; AL = arg2 + j
            cmp AL, 0                   ; compare AL with \0
            je _loop                    ; if avant == 0 -> _loop
            cmp BYTE [RBX], AL          ; compare *(arg2 + j) with AL
            je _break                   ; if avant == 0 -> _break
            jmp _loop2                  ; jump in _loop2