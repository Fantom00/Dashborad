section .text
global strncmp

strncmp:
            mov RCX, -1                 ; i = -1
            sub RDX, 1                  ; n -= 1

_loop:
            inc RCX                     ; i++
            cmp RCX, RDX                ; compare i with n (3ème arg)
            je _break                   ; if i == n -> break
            cmp BYTE [RDI + RCX], 0     ; compare *(s1 + i) with "\0"
            je _break                   ; if *(s1 + i) == 0 -> _break
            cmp BYTE [RSI + RCX], 0     ; compare *(s2 + i) with "\0"
            je _break                   ; if *(s2 + i) == 0 -> _break
            mov BL, BYTE [RDI + RCX]    ; tmp = *(s1 + i)
            sub BL, BYTE [RSI + RCX]    ; tmp -= *(s2 + i)
            cmp BL, 0                   ; compare tmp with 0
            jz _loop                    ; if BL == 0 -> _loop

_break:
            mov BL, BYTE [RDI + RCX]    ; tmp = *(s1 + i)
            sub BL, BYTE [RSI + RCX]    ; tmp -= *(s1 + i)
            cmp BL, 0                   ; compare tmp with 0
            jz _equal                   ; if BL == 0 -> equal
            jl _negatif                 ; if BL < 0 -> negatif
_positif:
            mov RAX, 1                  ; RAX = 1
            ret                         ; return RAX
_negatif:
            mov RAX, -1                 ; RAX = -1
            ret                         ; return RAX
_equal:
            mov RAX, 0                  ; RAX = 0
            ret                         ; return RAX