mov ah,40h
mov bx,1
mov cx,SIZEOF msg13-3
mov si,offset msg13
mov dx,OFFSET msg13
call coloring        ; "Play again? y/n"
int 10h
call crlf

mov ah,1
int 21h              ; read user's choice (y/n)
mov char,al

cmp char, 'y'
jnz notagain         ; if not 'y', exit

invoke blankArray    ; reset game
jmp again            ; jump back to game loop

notagain:
exit
