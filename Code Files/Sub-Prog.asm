.model small          ; Use the small memory model (64KB code + 64KB data)
.stack 100h           ; Set up a stack size of 256 bytes
.data                 ; Begin data segment (none declared here)

.code                 ; Begin code segment
    mov bl, 3         ; Store 3 in register BL
    sub bl, 2         ; Subtract 2 from BL → BL now holds 1

    add bl, 48        ; Convert numeric 1 to ASCII ('1' = 49) → BL = 49
    mov dl, bl        ; Move the result to DL (for printing)
    
    mov ah, 02h       ; Function 02h of INT 21h: display character in DL
    int 21h           ; Call DOS interrupt to print the character

    mov ah, 4Ch       ; Function 4Ch of INT 21h: terminate program
    int 21h           ; Call DOS to exit the program

end                   ; End of program