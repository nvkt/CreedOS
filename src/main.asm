[org 0x7C00] ; BIOS loads the boot sector at 0x7C00
[bits 16] ; 16-bit code

%define ENDL 0x0D, 0x0A

start:
    jmp main

puts:
    push si
    push ax

.loop:
    lodsb
    or al, al
    jz .done

    mov ah, 0x0E
    int 0x10

    jmp .loop


.done:
    pop ax
    pop si
    ret


main:
    ; Set data segment registers
    mov ax, 0
    mov ds, ax
    mov es, ax

    ; set up stack
    mov ss, ax
    mov sp, 0x7C00 ; stack grows downwards

    mov si, msg_hello
    call puts

    hlt

.halt:
    jmp .halt

msg_hello: db "Hello, World!", ENDL, 0


times 510-($-$$) db 0 ; Fill the rest of the sector with 0s
dw 0AA55h 



