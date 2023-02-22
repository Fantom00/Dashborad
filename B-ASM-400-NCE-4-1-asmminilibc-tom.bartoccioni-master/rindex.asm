section .text
global rindex

rindex:
            xor RCX, RCX
            cmp RDI, 0
            je _break
            sub RCX, 1

_loop_strlen:
            inc RCX
            cmp BYTE [RDI + RCX], 0
            jne _loop_strlen

_loop:
            dec RCX                     ; i--
            cmp BYTE [RDI + RCX], SIL   ; compare *(arg1 + i) with arg2
            je _break                   ; if avant == 0 -> _break
            cmp RCX, 0                  ; compare *(arg1 + i) with arg2
            jne _loop                   ; if avant != 0 -> _loop

_error:
            mov RAX, 0                  ; RAX = 0 (pb à régler cas d'erreur)
            ret                         ; return RAX

_break:
            mov RAX, RDI                ; RAX = i
            add RAX, RCX                ; RAX + RCX
            ret                         ; return RAX