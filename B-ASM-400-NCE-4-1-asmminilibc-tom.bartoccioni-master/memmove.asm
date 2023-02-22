section    .text
global      memmove

memmove:
            xor RCX, RCX

_loop:
            cmp RDX, RCX
            je _break
            mov R10B, BYTE [RSI + RCX]
            mov BYTE [RDI + RCX], R10B
            inc RCX
            jmp _loop

_break:
            mov RAX, RDI
            ret