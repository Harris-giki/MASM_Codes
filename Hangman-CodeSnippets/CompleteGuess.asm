call CompareString   ; compare current guessed state with actual word
mov al, flag1        ; flag1 = 1 means all letters have been correctly guessed
cmp al, 1
jnz notBreak         ; if not 1, game is still ongoing

; Win condition reached
mov ah,40h
mov bx,1
mov cx,SIZEOF msg9 -3
mov si,offset msg9
mov dx,OFFSET msg9
call coloring        ; print "Congratulations!" message
int 10h

call crlf
call mainMenu        ; re-show game header

; Show full month
mov ah,40h
mov bx,1
mov cx,SIZEOF msg10-3
mov si,offset msg10
mov dx,OFFSET msg10
call coloring        ; print "The month is" label
int 10h

mov cl, count        ; count = number of characters in the word
xor esi,esi
search:
mov al, month[esi]   ; display each character of actual month
mov ah,2
mov dl,al
int 21h              ; DOS print character function
inc esi
Loop search          ; loop till full word is printed

call crlf
jmp break            ; go to game ending
