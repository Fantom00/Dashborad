section .text
global strcasecmp

strcasecmp:
            mov RCX, -1                 ; i = -1

_loop:
            inc RCX                     ; i++
            mov DL, BYTE [RDI + RCX]
            cmp DL, 0                   ; compare *(s1 + i) with "\0"
            je _break                   ; if *(s1 + i) == 0 -> _break
            cmp BYTE [RSI + RCX], 0     ; compare *(s2 + i) with "\0"
            je _break                   ; if *(s2 + i) == 0 -> _break
            cmp DL, 90                  ; Z
            jle _majmax                 ; if avant <= 90 -> _majmax
            cmp DL, 97                  ; a
            jge _minmin                 ; if avant >= 97 -> minmin

_jump_back_loop:
            sub DL, BYTE [RSI + RCX]    ; tmp -= *(s2 + i)
            cmp DL, 0                   ; compare tmp with 0
            je _loop                    ; if DL == 0 -> _negatif

_break:
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

_majmax:
            cmp DL, 65                  ; A
            jl _jump_back_loop          ; if avant < A -> _jump_back_loop
            add DL, 32                  ; DL + 32
            cmp DL, BYTE [RSI + RCX]    ; a
            je _loop                    ; if avant == 0 -> _loop
            jmp _jump_back_loop         ;

_minmin:
            cmp DL, 122                 ; z
            jg _jump_back_loop          ; if avant > z -> _jump_back_loop
            sub DL, 32                  ; DL - 32
            cmp DL, BYTE [RSI + RCX]    ; Z
            je _loop                    ; if avant == 0 -> _loop
            jmp _jump_back_loop         ;