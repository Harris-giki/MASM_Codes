.model small
.stack 100h 
.data
    string 1 db"Letters from a to z: ---","$" ;Prompt Message

.code
main: 
    mov ax, @data ;load data segment address
    mov ds, ax    ;Set DS with data segment

    ;Display the initial String
    mov ah, 09h
    mov dx, offset string1
    int 21h

    ;initialize loop
    mov cx, 26 ;26 letters in the alphabet
    mov dl, 97 ;ASCII value of 'a'

atozloop:
    mov ah, 02h ;function 02h: display character in DL
    int 21h     ; Print the current Letter

    inc dl          ;Move to the next character
    loop atozloop   ;Repeat until CX=0

    ;Exit the program
    mov ah, 04ch
    int 21h