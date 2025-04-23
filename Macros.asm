;In assembly language, a macro is like a template or shortcut that 
;lets you define a group of instructions once and then reuse it wherever you need.


.model small
.stack 100h
.data
    msg1 db "Hello, World!", "$"
    msg2 db "Assembly is cool!", "$"

.code
main:
    mov ax, @data
    mov ds, ax

    ; Define macro to print a string
    PRINT MACRO str_addr
        mov ah, 09h       ; DOS print string function
        lea dx, str_addr  ; Load address of string into DX
        int 21h           ; Call DOS interrupt
    ENDM

    ; --- Using the macro ---
    PRINT msg1           ; This will print: Hello, World!
    
    mov ah, 09h
    mov dx, offset newline
    int 21h

    PRINT msg2           ; This will print: Assembly is cool!

    ; Exit program
    mov ah, 4Ch
    int 21h

newline db 0Dh,0Ah, "$"  ; Just a new line

end main
