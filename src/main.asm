[org 0x7C00] ; BIOS loads the boot sector at 0x7C00
[bits 16] ; 16-bit code

start:
    mov ah, 0x0e         ; BIOS function for teletype output
    mov al, 'H'          ; Character to print
    int 0x10             ; Call BIOS interrupt
    mov al, 'i'          ; Next character
    int 0x10             ; Call BIOS interrupt

hang:
    jmp hang             ; Infinite loop to keep the system from crashing

times 510 - ($ - $$) db 0  ; Pad the rest of the boot sector to 510 bytes
dw 0xAA55                  ; Boot signature




