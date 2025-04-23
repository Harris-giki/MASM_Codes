.model small               ; Use the small memory model
.stack 100h                ; Allocate 256 bytes for the stack

.data
string1 db "Digits From 1 to 9.......:", "$"  ; Message to be displayed before digits

.code
main:
    mov ax, @data          ; Load data segment address into AX
    mov ds, ax             ; Initialize DS with AX (data segment base)
    ; Display the prompt message
    mov ah, 09h            
    mov dx, offset string1 
    int 21h   
    countLoop:
    mov ah, 02h            ; Function 02h: display character in DL
    int 21h                ; Print current digit

    inc dl                 ; Increment DL to next ASCII digit
    loop countLoop         ; Decrease CX and repeat if CX ≠ 0
; End program
    mov ah, 4Ch            ; Function 4Ch: terminate program
    int 21h                
end main