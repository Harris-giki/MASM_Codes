.model small              ; Define the memory model
.stack 100h              ; Allocate 256 bytes for the stack

.data                    ; Data segment
    msg db "String is Pakistan", "$"               ; Display message for the string
    msg1 db "Pakistan", "$"                        ; The actual string to search in
    msg2 db "Enter a character to search.....", "$"; Prompt to enter a character
    found db "Search character is found", "$"      ; Message if character is found
    nfound db "Search character is not found", "$" ; Message if not found
    enter db 0Ah, 0Dh, "$"                          ; Newline (carriage return + line feed)
    no db ?                                         ; Variable to store user input character

.code
main:
    ; Setup the data segment
    mov ax, @data
    mov ds, ax

    ; Print "String is Pakistan"
    mov ah, 09h
    mov dx, offset msg
    int 21h

    ; Print a newline
    mov ah, 09h
    mov dx, offset enter
    int 21h

    ; Ask user to enter a character
    mov ah, 09h
    mov dx, offset msg2
    int 21h

    ; Read a single character from user input
    mov ah, 01h
    int 21h
    mov no, al                 ; Save the entered character in variable 'no'

    ; Print a newline before showing result
    mov ah, 09h
    mov dx, offset enter
    int 21h

    ; Initialize SI to point to start of msg1 ("Pakistan")
    mov si, offset msg1
    mov cx, 8                 ; Length of "Pakistan" (without '$')

search_loop:
    mov al, [si]              ; Load current character from msg1 into AL
    cmp al, '$'               ; End of string?
    je not_found              ; If end is reached without finding character
    cmp al, no                ; Compare with input character
    je is_found               ; If match found, jump to 'is_found'
    inc si                    ; Move to next character
    loop search_loop          ; Decrement CX and repeat if not zero

not_found:
    ; Print "Search character is not found"
    mov ah, 09h
    mov dx, offset nfound
    int 21h
    jmp exit_program          ; Jump to exit

is_found:
    ; Print "Search character is found"
    mov ah, 09h
    mov dx, offset found
    int 21h

exit_program:
    ; Print a final newline
    mov ah, 09h
    mov dx, offset enter
    int 21h

    ; Exit the program
    mov ah, 4Ch
    int 21h

end main
