.stack 100h                  ; Allocate 256 bytes for the stack

.data
string1 db "Enter Capital Letter: ", "$"  ; Prompt message for user input
string2 db "Small Letter is: ", "$"       ; Message to display before the result

.code
    mov ax, @data           ; Load address of the data segment into AX
    mov ds, ax              ; Initialize DS with the value in AX (data segment)
    mov ah, 09h             ; Function 09h of INT 21h: display string
    mov dx, offset string1  ; Load address of string1 into DX
    int 21h                 ; Call DOS interrupt to display the prompt
    mov ah, 01h             ; Function 01h of INT 21h: read character from keyboard
    int 21h                 ; AL will hold the entered character
    mov bl, al              ; Store the capital letter in BL
    add bl, 32              ; Convert capital letter to lowercase by adding 32
                            ; (ASCII: 'A' = 65, 'a' = 97; 97 - 65 = 32)
    mov ah, 09h             ; Display second prompt string
    mov dx, offset string2  ; Load address of string2 into DX
    int 21h                 ; Call DOS interrupt to display it
    mov dl, bl              ; Move the lowercase letter to DL for printing
    mov ah, 02h             ; Function 02h of INT 21h: display character in DL
    int 21h                 ; Print the lowercase letter
end