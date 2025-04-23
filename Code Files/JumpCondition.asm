.model small                  ; Use the small memory model
.stack 100h                   ; Allocate 256 bytes for the stack

.data
    string1 db "Enter First Number:", "$"     ; Prompt for first input
    string2 db "Enter 2nd Number:", "$"       ; Prompt for second input
    string3 db "Both are Equal.", "$"         ; Message if inputs match
    string4 db "Both are Not Equal", "$"      ; Message if inputs don't match

.code
main:
    mov ax, @data             ; Load address of data segment into AX
    mov ds, ax                ; Initialize DS with AX

    ; Prompt for the first number
    mov ah, 09h
    mov dx, offset string1
    int 21h                   ; Display "Enter First Number:"

    ; Take first character input
    mov ah, 01h
    int 21h                   ; Wait for user input
    mov bl, al                ; Store first input in BL

    ; Prompt for the second number
    mov ah, 09h
    mov dx, offset string2
    int 21h                   ; Display "Enter 2nd Number:"

    ; Take second character input
    mov ah, 01h
    int 21h
    mov cl, al                ; Store second input in CL
    ; Compare both inputs
    cmp cl, bl
    je label1                 ; If equal, jump to label1

    ; If not equal, show "Not Equal" message
    mov ah, 09h
    mov dx, offset string4
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h

label1:
    ; If equal, show "Both are Equal."
    mov ah, 09h
    mov dx, offset string3
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
end maingu