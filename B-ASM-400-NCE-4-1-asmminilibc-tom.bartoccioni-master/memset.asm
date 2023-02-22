section    .text
global      memset

memset:
            mov RCX, -1
            dec RDX

_loop:
            inc RCX
            mov BYTE [RDI + RCX], SIL
            cmp RCX, RDX
            jne _loop

_break:
            mov RAX, RDI
            ret