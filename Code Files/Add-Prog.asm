.model small  ;tells the assembles that we are using small memory model
.stack 100h   ;allocates a stack segment of 256 bytes
.data         ;denotes the starting of a data segment, we could declare variables or messages here
.code         ;denotes the starting of the code segment for our instruction part
    mov ax,@ data ;load the address of the data segment into the register AX
    mov ds,ax     ;set the DS register to point to your data segment

    mov bl, 2     ;move the number 2 into register BL
    mov cl, 2     ;move the number 2 into register CL
    add bl, cl    ;add the values of both of the registers and save it in the BL register

    add bl, 48   ;add 48 to the number stored in the BL register, a common trick to convert a number into its ASCII Code
    mov dl, bl   ;copy the values of BL into the DL register
    
    
    mov ah, 09h  ;this is for DOS interrupt 21h, function 09h is used to print a string 
    int 21h

    mov ah, 04ch ;this is DOS interrupt, function to terminate the program
    int 21h
end