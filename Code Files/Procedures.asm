; Like Macros A procedure (also called a subroutine or function) is 
; a block of code that performs a specific task and can be called from multiple places in the program.
; However they are slightly different as particularly used for larger design modules

.model small
.stack 100h

.data
    prompt db "Enter a character: $"
    newline db 0Dh,0Ah, "$"
    message db "You entered: $"

.code
main:
    mov ax, @data
    mov ds, ax

    ; Ask for input
    lea dx, prompt
    call print_string

    ; Get character from user
    mov ah, 01h
    int 21h
    mov bl, al         ; Save character in BL

    ; Print new line
    lea dx, newline
    call print_string

    ; Print message
    lea dx, message
    call print_string

    ; Display the character entered
    mov dl, bl         ; Move character to DL for printing
    mov ah, 02h
    int 21h

    ; Print new line
    lea dx, newline
    call print_string

    ; Exit program
    mov ah, 4Ch
    int 21h

; ----------------------------
; PROCEDURE: print_string
; Description: Prints a string whose address is in DX
; ----------------------------
print_string PROC
    mov ah, 09h
    int 21h
    ret
print_string ENDP

end main
