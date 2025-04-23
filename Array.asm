.model small
.stack 100h

.data
    string1 db "Enter string: ", "$"                  ; Prompt message for input
    string2 db 0Dh,0Ah, "String is: ", "$"            ; Prompt message for output
    string3 db 0Dh,0Ah, "Length of the string: ", "$" ; Message before length
    enter db 0Dh,0Ah, "$"                             ; this adds a newline (moves the cursor to the next line).
    len db 0                                          ; a variable to keep count of how many characters the user typed.
    str db 11 dup(?)                                  ; String array (10 characters + null terminator)

.code
main:
    mov ax, @data
    mov ds, ax                 ; Initialize data segment

    ; --- Prompt for input ---
    mov ah, 09h
    mov dx, offset string1
    int 21h
    lea si, str      ;SI register will point to the start of your string array.
inputLoop:
    mov ah, 01h      ;tells DOS: read 1 character from the keyboard.
    int 21h
    cmp al, 13       ;al will be storing the user defined input and thus comapred with 13 (ASCII of Enter key) to end the loop
    je endInput      ;We check if al == 13 (ASCII of Enter key) → if yes, go to endInput.
    
    mov [si], al    ;store the typed character in your array.
    inc si          ;move to the next empty box in the array.
    inc len         ;increase the length counter by 1.
    cmp len, 10     ;stop input (so it doesn’t overflow).
    je endInput
    jmp inputLoop   ;Otherwise → keep taking characters.
endInput:
    mov byte ptr [si], '$' ;This puts a $ at the end of your string so it can be printed by DOS (DOS requires $ to know where a string ends).

    ;Adding a new line
    mov ah, 09h
    mov dx, offset enter
    int 21h
    
    ;Printing a string prompt message
    mov ah, 09h
    mov dx, offset string2
    int 21h

    lea dx, str ; Load Effective Address of the array into the 16 bit dx register for output of the input string stored in the array
    int 21h

    ;Adding a new line
    mov ah, 09h
    mov dx, offset enter
    int 21h

    ;Printing a string prompt message
    mov ah, 09h
    mov dx, offset string3
    int 21h

     ;Actual output for Print "Length of the string: "
    add len, 48     ;converts the number into ASCII, so it can be displayed.
    mov dl, len     
    mov ah, 02h     ;print that length number on screen.
    int 21h
    
    ;Exit the program 
    mov ah, 4Ch
    int 21h
end main