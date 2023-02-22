section .text
global strchr

strchr:
            mov RCX, -1                 ; i = -1

_loop:
            inc RCX                     ; i++
            cmp BYTE [RDI + RCX], SIL   ; compare *(arg1 + i) with arg2
            je _break                   ; if avant == 0 -> _break
            cmp BYTE [RDI + RCX], 0     ; compare *(arg1 + i) with \0
            jne _loop                   ; if avant != 0 -> _loop

_break:
            mov RAX, RDI                ; RAX = i
            add RAX, RCX                ; RAX + RCX
            ret                         ; return RAX