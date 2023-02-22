section .text
global strcmp

strcmp:
            mov RCX, -1                 ; i = -1

_loop:
            inc RCX                     ; i++
            cmp BYTE [RDI + RCX], 0     ; compare *(s1 + i) with "\0"
            je _break                   ; if *(s1 + i) == 0 -> _break
            cmp BYTE [RSI + RCX], 0     ; compare *(s2 + i) with "\0"
            je _break                   ; if *(s2 + i) == 0 -> _break
            mov DL, BYTE [RDI + RCX]    ; tmp = *(s1 + i)
            sub DL, BYTE [RSI + RCX]    ; tmp -= *(s2 + i)
            cmp DL, 0                   ; compare tmp with 0
            je _loop                    ; if DL != 0 -> _negatif

_break:
            mov DL, BYTE [RDI + RCX]    ; tmp = *(s1 + i)
            sub DL, BYTE [RSI + RCX]    ; tmp -= *(s1 + i)
            cmp DL, 0                   ; compare tmp with 0
            jz _equal                   ; if DL == 0 -> equal
            jl _negatif                 ; if DL < 0 -> negatif
_positif:
            mov RAX, 1                  ; RAX = 1
            ret                         ; return RAX
_negatif:
            mov RAX, -1                 ; RAX = -1
            ret                         ; return RAX
_equal:
            mov RAX, 0                  ; RAX = 0
            ret                         ; return RAX