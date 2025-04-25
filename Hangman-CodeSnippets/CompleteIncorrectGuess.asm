notBreak:            ; game not won yet, check for game over
mov al, numTry       ; get remaining lives
cmp al, 0            ; check if no lives left
jnz continue         ; jump if player still has tries

; Game over message
mov ah,40h
mov bx,1
mov cx,SIZEOF msg11-3
mov si,offset msg11
mov dx,OFFSET msg11
call coloring        ; print "you've been hanged" message
int 10h
call crlf

call mainMenu        ; show game banner again

mov ah,40h
mov bx,1
mov cx,SIZEOF msg12-3
mov si,offset msg12
mov dx,OFFSET msg12
call coloring        ; print "The month was" label
int 10h

mov cl, count
xor esi,esi
search1:
mov al, month[esi]   ; print actual answer after losing
mov ah,2
mov dl,al
int 21h
inc esi
Loop search1

call crlf
