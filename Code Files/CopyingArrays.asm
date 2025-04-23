.model small              ; Use small memory model
.stack 100h              ; Allocate 256 bytes of stack

.data                    ; Data segment starts
    enter db 0Ah,0Dh,"$"         ; Newline string (carriage return + line feed)
    src_str db "PAKISTAN","$"    ; Source string to be copied
    dest_str db 9 dup(?)         ; Destination string, 9 bytes (same length as "PAKISTAN")

.code                    ; Code segment starts
main:
    mov ax, @data        ; Initialize data segment
    mov ds, ax

    ; Initialize source and destination pointers
    mov si, offset src_str   ; SI → points to beginning of src_str
    mov di, offset dest_str  ; DI → points to beginning of dest_str
    mov cx, 9                ; Set counter to number of characters to copy

copy:
    mov bl, [si]             ; Load byte from src_str into BL
    mov [di], bl             ; Store byte into dest_str
    inc si                   ; Move to next byte in src_str
    inc di                   ; Move to next byte in dest_str
    loop copy                ; Repeat until all characters copied

    ; Print original string
    mov dx, offset src_str   ; Load address of src_str into DX
    mov ah, 09h              ; DOS print string function
    int 21h                  ; Call DOS interrupt

    ; Print newline
    mov dx, offset enter     ; Load newline into DX
    mov ah, 09h
    int 21h

    ; Print copied string (dest_str)
    mov dx, offset dest_str  ; Load address of dest_str
    mov ah, 09h
    int 21h

    ; Exit program
    mov ah, 4Ch              ; DOS function to exit program
    int 21h

end main
