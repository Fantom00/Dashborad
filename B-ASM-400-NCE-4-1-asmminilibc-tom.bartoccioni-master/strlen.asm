section .text
global strlen

strlen:
    mov RAX, 0                  ; i = 0
    cmp RDI, 0                  ; if str != null
    JE _end                     ; JE = si la ligne d'au dessus est bonne alors _end
    sub RAX, 1                  ; i--

_loop:
    inc RAX                     ; i++
    cmp BYTE [RDI + RAX], 0     ; compare s[i] with \0
    JNE _loop                   ; if != '\0' ->_loop

_end:
    ret                         ; return i