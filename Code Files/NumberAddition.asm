.model small  ;tells the assembles that we are using small memory model
.stack 100h   ;allocates a stack segment of 256 bytes
.data 
        string1 db"Enter the first number:","$"
        string2 db"Enter the first number:","$"
        string3 db "Sum is:","$"
.code
    mov ax,@ data ;load the address of the data segment into the register AX
    mov ds,ax     ;set the DS register to point to your data segment
  
    ;Print string1 prompt
    mov ah, 09h
    mov dx, offset string1
    int 21h

    ;read the first character from the user
    mov ah, 01h
    int 21h     ;the character is stored in AL
    mov bl, al  ;the character is moved to save in BL
    sub bl, 48 ;convert the ASCII character to a number 
    
    ;Print string2 prompt
    mov ah, 09h 
    mov dx, offset string2
    int 21h

    ;read the first character from the user
    mov ah, 01h
    int 21h
    mov cl,al
    sub cl, 48   ; Convert ASCII to number
    
    ; Add both numbers
    add bl, cl  ; bl = first + second number
    sub bl, 48  ; Convert back to ASCII for display

    ; Print "Sum is: "
    mov ah, 09h
    mov dx, offset string3
    int 21h
    ; Print the result character 
    mov dl,bl
    mov ah, 02h
    int 21h     ; Display result
    
    ; Exit program
    mov ah, 04ch
    int 21h
end